package Datos;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "profileUpdateServlet", urlPatterns = {"/profileUpdateServlet"})

public class profileUpdateServlet extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
           int id = CuentaUsuario.id;
        
           try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/purisCar", "root", "Admin$1234");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from users where id = " + id);
            resultSet.next();
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Mis Datos</title>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js\" integrity=\"sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3\" crossorigin=\"anonymous\"></script>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js\" integrity=\"sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz\" crossorigin=\"anonymous\"></script>");
            out.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT\" crossorigin=\"anonymous\">");
            out.println("</head>");
            out.println("<body>");
               out.println("<hr> "
                       + "<div class=\"card\" style=\"width: 18rem;\">\n"
                       + "  <div class=\"card-header\">\n"
                       + "    Editar información de usuario\n"
                       + "  </div>\n"
                       + "        <form id='formUpdate' action=\"actualizarDatosServlet\" method=\"post\">\n"
                       + "            <div class=\"container\" style=\"margin-top:5%\">\n"
                       + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getString("Name")+ "' name= \"txtName\" class=\"form-control\" type=\"text\" placeholder=\"Name\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                       + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getString("Lastname")+ "' name= \"LastName\" class=\"form-control\" type=\"text\" placeholder=\"Last Name\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                       + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getString("Email")+ "'name= \"txtEmail\" class=\"form-control\" type=\"text\" placeholder=\"Email\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                                           
                       + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getString("User")+ "'name= \"txtUser\" class=\"form-control\" type=\"text\" placeholder=\"User\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                       + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getInt("Phone")+ "'name= \"txtPhone\" class=\"form-control\" type=\"num\" placeholder=\"Phone\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                        + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getString("Address")+ "'name= \"txtAddress\" class=\"form-control\" type=\"text\" placeholder=\"Address\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                        + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getString("Password")+ "'name= \"txtPassword\" class=\"form-control\" type=\"password\" placeholder=\"Password\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                       + "                    <input value='" + resultSet.getString("Id")+ "'name= \"txtId\" class=\"form-control\" type=\"hidden\" >\n"
                       + "              </div>"
                       + "                <hr>\n"
                       + "                <button type=\"submit\" class=\"btn btn-success\" style=\"height: 50px\" style=\"width: 100px\">Actualizar información</button>\n"
                       + "                <a class=\"btn btn-secondary\" href=\"misAutosServlet\">Volver</a>"        
               +"</div>");
            out.println("</body>");
            out.println("</html>");
            out.println(
                        "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js\"></script>\n"
                        + "<script>\n"
                        + "    $(document).ready(function(){\n"
                        + "        $(\"#formUpdate\").submit(function(event){\n"
                        + "            event.preventDefault();\n"
                        + "            var formData = $(this).serialize();\n"
                        + "            $.ajax({\n"
                        + "                type: \"POST\",\n"
                        + "                url: \"profileUpdate.jsp\",\n"
                        + "                data: formData,\n"
                        + "                success: function(response){\n"
                        + "                    alert(response.message);\n"
                        + "                    if(response.status===0){\n"
                        + "                        window.location.href = \"/Proyecto_1/principalUser.jsp\";\n"
                        + "                    }\n"
                        + "                }\n"
                        + "            });\n"
                        + "        });\n"
                        + "    });\n"
                        + "</script>"
                    );

        } catch (NumberFormatException | ClassNotFoundException | SQLException e) {
            out.println(e.getMessage());
        }
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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
