<%-- 
    Document   : filtroCarros
    Created on : 4 dic 2022, 9:13:37
    Author     : PC
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="https://i.ibb.co/JzRKmwN/purisautos.png">
        <title>PurisCar</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js" integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    </head>
    <body>


        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #000000;">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img width="250" src="https://i.ibb.co/xzzm47X/Captura-de-pantalla-2024-07-14-132029.png" alt="alt"/>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="principalUser.html">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="formRegistroAuto.jsp">Registrar auto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="misAutosServlet">Mis autos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="profileUpdate.jsp">Actualizar perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="filtroCarros.jsp">Filtro Autos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index2.jsp">Cerrar Sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        
        
        <hr />  
        <div class="card">
            <div class="card-header">
                Filtrar por Marca
            </div>
            <div class="card-body">
                <form action="filtroCarrosUsuarioPrincipal.jsp">            
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="txtMarca" placeholder="Name">
                        <label>Marca</label>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <button type="submit" class="btn btn-primary">Search</button>                            
                    </div>                          
                </form>                    
            </div>
        </div>
        <%
            String txtMarca = request.getParameter("txtMarca");

            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/purisCar", "root", "Admin$1234");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from autos where marca like '%" + txtMarca + "%'");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>


        <!-- Cards para mostrar autos del la base de datos -->


        <div class="row row-cols-1 row-cols-md-3 g-4 container-fluid text-center">
            <% while (resultset.next()) {%>
            <div class="col">

                <div class="card">
                    <img src="<%=resultset.getString("img")%>" class="card-img-top" alt="..."width="100" height="200">
                    <div class="card-body">
                        <h5 class="card-title"><%=resultset.getString("nombreUsuario")%> <%=resultset.getString("apellidoUsuario")%></h5>
                        <p class="card-text"><%=resultset.getString("marca")%> <%=resultset.getString("modelo")%> <%=resultset.getString("fabricacion")%> </p>
                        <p class="card-text">Contacto: <%=resultset.getString("correoUsuario")%> Tel: <%=resultset.getString("telefono")%> </p>
                    </div>
                </div>

            </div>
            <%}%>            

        </div>
        <br>
        <br>
        <footer>
            <div class="p-3 mb-2 text-white" style="background-color: #000000;">
                <div class="container text-center">
                    <div class="row">
                        <div class="col-sm-8">
                            <h4 class="text-start">Contáctanos</h4>
                            <p class="text-start">
                                <strong>Email:</strong>
                                soporte.automarket@gmail.com
                                <strong>Teléfono:</strong>
                                (+506)2416-0000
                                <br>
                                Copyright © 2000-2022. Todos los derechos reservados.
                            </p>
                        </div>
                    </div>                   
                </div>
            </div>
        </footer>



    </body>
</html>
