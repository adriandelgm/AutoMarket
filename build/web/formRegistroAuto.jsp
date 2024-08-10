<%-- 
    Document   : formRegistroAuto
    Created on : 27 nov. 2022, 17:05:08
    Author     : PC_Lenovo
--%>

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
            #footer {
                bottom: 0;
                width: 100%;
            }
        </style>
        <link rel="icon" href="https://i.ibb.co/JzRKmwN/purisautos.png">
        <title>Puris Autos</title>
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
                            <a class="nav-link active" aria-current="page" href="principalUser.html">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="formRegistroAuto.jsp">Registrar auto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="misAutosServlet">Mis autos</a>
                        </li> 
                        <li class="nav-item">
                            <a class="nav-link" href="index2.jsp">Cerrar Sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container" style="margin-top:3%; margin-bottom: 3%;">
            <div class="card">
                <div class="card-header">
                    Registro de vehículos
                </div>
                <div class="card-body">
                    <form action="guardarRegistro.jsp" method="post" enctype="multipart/form-data">
                        <div class="container" style="margin-top:2%">
                            <div class="container" style="margin-bottom: 2%">
                                <input name= "txtMarca" class="form-control" type="text" placeholder="Marca" aria-label="default input example" required>
                            </div>

                            <div class="container" style="margin-bottom: 2%">
                                <input name= "txtModelo" class="form-control" type="text" placeholder="Modelo" aria-label="default input example" required>
                            </div>

                            <div class="container" style="margin-bottom: 2%">
                                <input name= "txtYear" class="form-control" type="number" placeholder="Año de fabricación" aria-label="default input example" required>
                            </div>

                            <div class="container" style="margin-bottom: 2%" >
                                <select name= "txtEstilo" class="form-select" aria-label="Default select example" required>
                                    <option selected>Estilo</option>
                                    <option value="Sedán">Sedán</option>
                                    <option value="Coupé">Coupé</option>
                                    <option value="Hatchback">Hatchback</option>
                                    <option value="SUV / PickUp">SUV / PickUp</option>
                                    <option value="Van / Comercial">Van / Comercial</option>
                                </select>
                            </div>

                            <div class="input-group mb-3 container" style="margin-bottom: 5%">
                                <label class="input-group-text" for="inputGroupFile01">Imagen</label>
                                <input name= "txtImg" type="file" class="form-control" id="inputGroupFile01" required>
                            </div>
                            <br>
                            <hr>
                            <button type="submit" class="btn btn-success" style="height: 50px"; "width: 100px">Registrar Vehículo</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
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

