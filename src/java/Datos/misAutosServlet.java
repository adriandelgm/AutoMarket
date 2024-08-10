
package Datos;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "misAutosServlet", urlPatterns = {"/misAutosServlet"})
public class misAutosServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/purisCar", "root", "Admin$1234");
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from autos where correoUsuario = '" + CuentaUsuario.correo + "'");

        try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet misAutosServlet</title>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js\" integrity=\"sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3\" crossorigin=\"anonymous\"></script>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js\" integrity=\"sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz\" crossorigin=\"anonymous\"></script>");
            out.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT\" crossorigin=\"anonymous\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<nav class=\"navbar navbar-expand-lg navbar-dark\" style=\"background-color: #000000;\">\n"
                    + "            <div class=\"container-fluid\">\n"
                    + "                <a class=\"navbar-brand\" href=\"#\">\n"
                    + "                    <img width=\"250\" src=\"https://i.ibb.co/xzzm47X/Captura-de-pantalla-2024-07-14-132029.png\" alt=\"alt\"/>\n"
                    + "                </a>\n"
                    + "                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNavDropdown\" aria-controls=\"navbarNavDropdown\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n"
                    + "                    <span class=\"navbar-toggler-icon\"></span>\n"
                    + "                </button>\n"
                    + "                <div class=\"collapse navbar-collapse\" id=\"navbarNavDropdown\">\n"
                    + "                    <ul class=\"navbar-nav\">\n"
                    + "                        <li class=\"nav-item\">\n"
                    + "                            <a class=\"nav-link active\" aria-current=\"page\" href=\"principalUser.html\">Inicio</a>\n"
                    + "                        </li>\n"
                    + "                        <li class=\"nav-item\">\n"
                    + "                            <a class=\"nav-link\" href=\"formRegistroAuto.jsp\">Registrar auto</a>\n"
                    + "                        </li>\n"
                    + "                        <li class=\"nav-item\">\n"
                    + "                            <a class=\"nav-link\" href=\"misAutosServlet\">Mis autos</a>\n"
                    + "                        </li>"
                    + "                         </li><li class=\"nav-item\">\n" +
"                                                    <a class=\"nav-link\" href=\"index2.jsp\">Cerrar Sesión</a>\n" +
"                                              </li>                       \n"
                    + "                    </ul>\n"
                    + "                </div>\n"
                    + "            </div>\n"
                    + "        </nav>");
            out.println("<div class=\"container\" style=\"margin-top:5%\">"
                    + "<table class=\"table table-hover\">"
                    + "<thead>"
                    + "<tr>"
                    + "<th scope=\"col\">Marca</th>"
                    + "<th scope=\"col\">Modelo</th>"
                    + "<th scope=\"col\">Año de fabricación</th>"
                    + "<th scope=\"col\">Estilo</th>"
                    + "<th scope=\"col\">Imagen</th>"
                    + "<th scope=\"col\">Estado</th>"
                    + "<th scope=\"col\">  </th>"
                    + "<th scope=\"col\">  </th>"
                    + "<th scope=\"col\">  </th>"
                    + "</tr>"
                    + "</thead>"
                    + "</thead>"
                    + "<tbody>");
            while (resultSet.next()) {
                out.println("<td>" + resultSet.getString("marca") + "</td>");
                out.println("<td>" + resultSet.getString("modelo") + "</td>");
                out.println("<td>" + resultSet.getInt("fabricacion") + "</td>");
                out.println("<td>" + resultSet.getString("estilo") + "</td>");
                out.println("<td><img class='card-img-top' alt='...' width='100' height='200' style='object-fit: cover' src='" + resultSet.getString("img") + "'></td>");
                out.println("<td>" + resultSet.getString("estatus") + "</td>");
                out.println("<td><a class=\"btn btn-outline-secondary btn-sm\" href='infoAutoServlet?id=" + resultSet.getInt("id") + "'>Modificar</a></td>");
                out.println("<td><a class=\"btn btn-outline-danger btn-sm\" href='eliminarAutoServlet?id=" + resultSet.getInt("id") + "'>Eliminar</a></td>");
                out.println("<td><a class=\"btn btn-outline-success btn-sm\" href='estadoAutoServlet?id=" + resultSet.getInt("id") + "'>Vendido</a></td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
            out.println("<a class=\"btn btn-secondary\" href=\"formRegistroAuto.jsp\">Registrar otro auto</a>"
                    + "</div>"
                    + "<br>"
                    + "<footer>\n" +
            "            <div class=\"p-3 mb-2 text-white\" style=\"background-color: #000000;\">\n" +
            "                <div class=\"container text-center\">\n" +
            "                    <div class=\"row\">\n" +
            "                        <div class=\"col-sm-8\">\n" +
            "                            <h4 class=\"text-start\">Contáctanos</h4>\n" +
            "                            <p class=\"text-start\">\n" +
            "                                <strong>Email:</strong>\n" +
            "                                soporte.automarket@gmail.com\n" +
            "                                <strong>Teléfono:</strong>\n" +
            "                                (+506)2416-0000\n" +
            "                                <br>\n" +
            "                                Copyright © 2000-2022. Todos los derechos reservados.\n" +
            "                            </p>\n" +
            "                        </div>\n" +
            "                    </div>                   \n" +
            "                </div>\n" +
            "            </div>\n" +
            "        </footer>");                           
            out.println("</body>");
            out.println("</html>");
        
        } catch (NumberFormatException | SQLException e) {
            out.println(e.getMessage());
        }
    }

       
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(misAutosServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(misAutosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(misAutosServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(misAutosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
