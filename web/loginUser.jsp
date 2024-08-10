<%-- 
    Document   : loginUser
    Created on : 26 nov. 2022, 20:34:43
    Author     : jesus
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js" integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    </head>
    <body id="grad1">
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
                            <a class="nav-link" href="#">Autos usados</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="loginUser.jsp">Ingresar</a>
                        </li>                       
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <div>
            <div class="container" style="margin-top:2%; width: 200rem;">             
                <div class="card">
                    <div class="card-header">
                        Crear usuario
                    </div>
                    <div class="card-body">
                        <form action="verifyUser.jsp">                                  

                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" name="txtEmail" placeholder="Email">
                                <label>Email</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="user" class="form-control" name="txtUser" placeholder="User">
                                <label>User</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" name="txtPassword" placeholder="Password">
                                <label>Password</label>  
                            </div>
                            <div class="form-floating mb-3 justify-content-md-end">
                                <button type="submit" class="btn btn-primary">Ingresar</button>                            
                            </div>                          
                        </form>                    
                    </div>
                </div>         
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <hr />
        <div class="text-center">
            ¡No posees una cuenta aún?
            <a type="button" href="users.jsp" class="btn btn-link text-center">Regístrate!</a>
        </div>
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
