<%-- 
    Document   : registerUser
    Created on : 26 nov. 2022, 20:22:32
    Author     : jesus
--%>

<%@page language="java" import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            #grad1 {
                height: 100%;
                background-color: Cornsilk; /* For browsers that do not support gradients */
                background-image: linear-gradient(to bottom right, Cornsilk, white);
            }            
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Registro</title>
    </head>
    <body id="grad1">
        <%
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/purisCar", "root", "Admin$1234");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from users");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>

        <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #000000;">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img width="250" src="https://i.ibb.co/VYcd5KK/logo.png" alt="alt"/>
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
                            <a class="nav-link" href="#">Autos usados</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="loginUser.jsp">Ingresar</a>
                        </li>                       
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top:2%">             
            <div class="card">
                <div class="card-header">
                    Crear usuario
                </div>
                <div class="card-body">
                    <form action="insertUser.jsp">                                  
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="txtName" placeholder="Name">
                            <label>Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" required="required" class="form-control" name="txtLastName" placeholder="Last Name">
                            <label>Last Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" required="required" class="form-control" name="txtEmail" placeholder="Email">
                            <label>Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="user" required="required" class="form-control" name="txtUser" placeholder="User">
                            <label>User</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" required="required" class="form-control" name="txtPassword" placeholder="Password">
                            <label>Password</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" required="required" class="form-control" name="txtPhone" placeholder="Phone">
                            <label>Phone</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" required="required" class="form-control" name="txtAddress" placeholder="Address">
                            <label>Address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <button type="submit" class="btn btn-primary">Registrar</button>                            
                        </div>                          
                    </form>                    
                </div>
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
                                    soporte.purisautos@gmail.com
                                    <strong>Teléfono:</strong>
                                    (+506)2416-0000
                                    <br>
                                    Copyright © 2000-2022. Todos los derechos reservados.
                                </p>
                            </div>
                            <div class="col-sm-4">
                                <img src="https://i.ibb.co/JzRKmwN/purisautos.png" alt="..." width="100" height="100" class="rounded float-end">
                            </div>
                        </div>                   
                    </div>
                </div>
            </footer>
    </body>
</html>
