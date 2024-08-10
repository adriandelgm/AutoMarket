<%@page import="javax.servlet.ServletContext"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.io.IOException"%>
<%@page import="Datos.CuentaUsuario"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar auto nuevo</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            try {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> uploadItems = upload.parseRequest(request);

                ServletContext context = getServletContext();
                String filePath = context.getRealPath("/imagenes/");
                
                for (FileItem uploadItem : uploadItems) {
                    if (uploadItem.isFormField()) {
                        String fieldname = uploadItem.getFieldName();
                        String value = uploadItem.getString("UTF-8");
                        switch (fieldname) {
                            case "txtMarca":
                                CuentaUsuario.marca = value;
                                break;
                            case "txtModelo":
                                CuentaUsuario.modelo = value;
                                break;
                            case "txtYear":
                                CuentaUsuario.afabri = Integer.parseInt(value);
                                break;
                            case "txtEstilo":
                                CuentaUsuario.estilo = value;
                                break;
                        }
                    } else {
                        String fileName = System.currentTimeMillis() + ".jpg";
                        File file = new File(filePath + File.separator + fileName);
                        
                        uploadItem.write(file);

                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/purisCar?useUnicode=true&characterEncoding=UTF-8", "root", "Admin$1234");
                        Statement statement = connection.createStatement();
                        ResultSet resultSet2 = statement.executeQuery("SELECT * FROM users WHERE Email = '" + CuentaUsuario.correo + "'");
                        if (resultSet2.next()) {
                            CuentaUsuario.nombre = resultSet2.getString("Name");
                            CuentaUsuario.apellido = resultSet2.getString("Lastname");
                            CuentaUsuario.usuario = resultSet2.getString("User");
                            CuentaUsuario.telefono = resultSet2.getInt("Phone");
                        }

                        String sql = "INSERT INTO autos (correoUsuario, nombreUsuario, apellidoUsuario, usuario, telefono, marca, modelo, fabricacion, estilo, img, estatus) "
                            + "VALUES ('"
                            + CuentaUsuario.correo + "', '"
                            + CuentaUsuario.nombre + "', '"
                            + CuentaUsuario.apellido + "', '"
                            + CuentaUsuario.usuario + "', '"
                            + CuentaUsuario.telefono + "', '"
                            + CuentaUsuario.marca + "', '"
                            + CuentaUsuario.modelo + "', "
                            + CuentaUsuario.afabri + ", '"
                            + CuentaUsuario.estilo + "', '"
                            + "imagenes/" + fileName + "', "
                            + "'En venta')";
                        statement.executeUpdate(sql);

                        RequestDispatcher rd = request.getRequestDispatcher("/misAutosServlet");
                        rd.include(request, response);
                    }
                }
            } catch (NumberFormatException | ClassNotFoundException | SQLException | IOException e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </body>
</html>
