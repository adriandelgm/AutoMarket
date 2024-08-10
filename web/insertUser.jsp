<%-- 
    Document   : insertUser
    Created on : 26 nov. 2022, 20:20:35
    Author     : jesus
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create user</title>
    </head>
    <body>
        <%            
            String txtName = request.getParameter("txtName");
            String txtLastName = request.getParameter("txtLastName");
            String txtEmail = request.getParameter("txtEmail");
            String txtUser = request.getParameter("txtUser");
            String txtPassword = request.getParameter("txtPassword");
            String txtPhone = request.getParameter("txtPhone");
            String txtAddress = request.getParameter("txtAddress");
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/purisCar", "root", "Admin$1234");
            Statement statement = connection.createStatement();
            Statement statement2 = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from users where Email = '" + txtEmail + "'");

            if (resultSet.next()) {
                out.println("<script type='text/javascript'>alert('User already created');</script>");
                RequestDispatcher rd = request.getRequestDispatcher("/users.jsp");
                rd.include(request, response);                
            } else {           
                String sql = "insert into users (Name, LastName, Email, User, Password, Phone, Address) "
                        + "values ('" + txtName + "', '" + txtLastName + "', '" + txtEmail + "', '" + txtUser + "', '" + txtPassword + "', '" + txtPhone + "', '" + txtAddress + "')";

                statement2.executeUpdate(sql);
                statement2.close();

                out.println("<script type='text/javascript'>alert('User created');</script>");
                RequestDispatcher rd = request.getRequestDispatcher("loginUser.jsp");
                rd.include(request, response);
            }

        %>
    </body>
