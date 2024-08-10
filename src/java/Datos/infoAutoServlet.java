package Datos;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class infoAutoServlet extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        CuentaUsuario.registroID = id;
        
           try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/purisCar", "root", "Admin$1234");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from autos where id=" + id);
            resultSet.next();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Mis autos</title>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js\" integrity=\"sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3\" crossorigin=\"anonymous\"></script>");
            out.println("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js\" integrity=\"sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz\" crossorigin=\"anonymous\"></script>");
            out.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT\" crossorigin=\"anonymous\">");
            out.println("</head>");
            out.println("<body>");
               out.println("<hr> "
                       + "<div class=\"card\" style=\"width: 18rem;\">\n"
                       + "  <div class=\"card-header\">\n"
                       + "    Editar información del auto\n"
                       + "  </div>\n"
                       + "        <form action=\"actualizarDatosServlet\" method=\"post\">\n"
                       + "            <div class=\"container\" style=\"margin-top:5%\">\n"
                       + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getString("marca")+ "' name= \"txtMarca\" class=\"form-control\" type=\"text\" placeholder=\"Marca\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                       + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getString("modelo")+ "' name= \"txtModelo\" class=\"form-control\" type=\"text\" placeholder=\"Modelo\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                       + "                <div class=\"container\" style=\"margin-bottom: 2%\">\n"
                       + "                    <input value='" + resultSet.getInt("fabricacion")+ "'name= \"txtYear\" class=\"form-control\" type=\"number\" placeholder=\"Año de fabricación\" aria-label=\"default input example\">\n"
                       + "                </div>\n"
                       + "                <div class=\"container\" style=\"margin-bottom: 2%\" >\n"
                       + "                    <select value='" + resultSet.getString("estilo")+ "'name= \"txtEstilo\" type=\"text\" class=\"form-select\" aria-label=\"Default select example\">\n"
                       + "                    <option selected>Estilo</option>\n"
                       + "                                    <option value=\"Sedán\">Sedán</option>\n"
                       + "                                    <option value=\"Coupé\">Coupé</option>\n"
                       + "                                    <option value=\"Hatchback\">Hatchback</option>\n"
                       + "                                    <option value=\"SUV / PickUp\">SUV / PickUp</option>\n"
                       + "                                    <option value=\"Van / Comercial\">Van / Comercial</option>"
                       + "                </select>\n"
                       + "                </div>\n"
                       + "              </div>"
                       + "                <hr>\n"
                       + "                <button type=\"submit\" class=\"btn btn-success\" style=\"height: 50px\" style=\"width: 100px\">Actualizar información</button>\n"
                       + "                <a class=\"btn btn-secondary\" href=\"misAutosServlet\">Volver</a>"        
               +"</div>");
            out.println("</body>");
            out.println("</html>");
  
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
