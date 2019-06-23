<%-- 
    Document   : error
    Created on : 17 Apr, 2017, 9:17:56 PM
    Author     : rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
        <div class="jumbotron">
            <div class="container">
                <center>
                    <h1>Please <a href="index.jsp">Login</a> First!</h1>
                    <%
                        request.getRequestDispatcher("Logout").forward(request, response);
                    %>
                </center>
            </div>
        </div>
    </body>
</html>
