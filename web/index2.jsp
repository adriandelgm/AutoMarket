<%-- 
    Document   : index2
    Created on : 29 nov 2022, 15:04:43
    Author     : PC
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>AutoMarket</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js" integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <%
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/purisCar", "root", "Admin$1234");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from autos where estatus = 'En venta'");          
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>   
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
                            <a class="nav-link active" aria-current="page" href="index.html">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="autosUsados.jsp">Autos usados</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="loginUser.jsp">Ingresar</a>
                        </li>                       
                    </ul>
                </div>
            </div>
        </nav>
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://i.ibb.co/6JGQHHt/Captura-de-pantalla-2024-07-14-133049.png" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 style="font-size:300%">Auto Market</h5>
                        <p style="font-size:150%">Los mejores autos de segunda mano a tu alcance</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="imagenes/402543.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <a class="nav-link" href="users.jsp"><h5 style="font-size:300%">Registrarse</h5></a>
                        <p style="font-size:150%">Sea parte de nuestros usuarios, y acceda a las mejores opciones del mercado automotor.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://www.topgear.com/sites/default/files/2021/07/DEF_110_V8_ONROAD_210721_11.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <a class="nav-link" href="autosUsados.jsp"><h5 style="font-size:300%">Autos Usados</h5></a>
                        <p style="font-size:150%">Elija auto a su medida y a su presupuesto.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <br>
        <br>
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
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
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

