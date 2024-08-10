<%-- 
    Document   : verifyUser
    Created on : 27 nov. 2022, 21:26:51
    Author     : jesus
--%>

<%@page import="Datos.CuentaUsuario"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create user</title>
    </head>
    
        <%
            String txtEmail = request.getParameter("txtEmail");
            String txtUser = request.getParameter("txtUser");
            String txtPassword = request.getParameter("txtPassword");
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/purisCar", "root", "Admin$1234");
            Statement statement = connection.createStatement();
            Statement statement2 = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from users where Email = '" + txtEmail + "' and Password = '" + txtPassword + "'");
            
            if (resultSet.next()) {
                int idUsuario = resultSet.getInt("Id");
                CuentaUsuario.correo = txtEmail;
                CuentaUsuario.id=idUsuario;
                out.println("<script type='text/javascript'>alert('Ingreso exitoso!');</script>");
                RequestDispatcher rd = request.getRequestDispatcher("principalUser.jsp");
                rd.include(request, response);
                
            } else {
                statement2.close();
                statement.close();
                out.println("<script type='text/javascript'>alert('Correo o contraseña incorrectos');</script>");
                RequestDispatcher rd = request.getRequestDispatcher("loginUser.jsp");
                rd.include(request, response);
            }

        %>
    