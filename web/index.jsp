<%-- 
    Document   : index
    Created on : Apr 20, 2017, 2:05:08 PM
    Author     : My DeLL
--%>

<%@page import="com.dto.MovieInfo"%>
<%@page import="com.predict.items.ItemRecommender"%>
<%@page import="java.util.Map"%>
<%@page import="com.dto.Movies"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Map<Long, Movies> allRecords = ItemRecommender.getAllRecords();
    session.setAttribute("allRecords", allRecords);
    
    Map<Long,MovieInfo> movieInfo = ItemRecommender.getMovieInfo();
    session.setAttribute("movieInfo", movieInfo);
    
    Map<String,Long> nametoid = ItemRecommender.getMapping();
    session.setAttribute("nametoid", nametoid);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recommendation System</title>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <style>
            span{
                font-size: 14px;
            }
            .jumbotron{
                margin-top: -20px;
            }
        </style>
    </head>
    <body>
    <center>
        <br><br>
        <div class="container">

            <div class="jumbotron">

                <h1>Movie Recommendation Engine</h1><br><br>

                <ul class="nav nav-pills nav-justified">
                    <li class="active"><a href="#login" data-toggle="tab"><h2>Login</h2></a></li>
                    <li><a href="#register" data-toggle="tab"><h2>Register</h2></a></li>
                </ul>
                <br><br>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="login">

                        <form action="Auth" method="POST">
                            <div class="form-group">
                                <input type="text" name="username" class="input-lg" size="35" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <input type="password" name="password"  class="input-lg" size="35" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg">Log In</button>
                            </div>
                        </form>

                    </div>

                    <div class="tab-pane fade" id="register">
                        <div class="form-group">
                            <input type="text" autocomplete="off" name="username" class="input-lg" id="username" size="35" placeholder="Username">
                        </div>
                        <div class="form-group">
                            <input type="password" autocomplete="off" name="password" id="password"  class="input-lg" size="35" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary btn-lg" id="btn">Register</button>
                        </div>
                        <div id="location"></div>
                    </div>

                </div>

            </div>
        </div>
    </center>

    <script>
            $(document).ready(function(){
                $("#btn").click(function(){

                var username = $("#username").val();
                var password = $("#password").val();

                if (validate())
                {
                    $.ajax({
                        type: "POST",
                        url: "RegisterServlet",
                        data: {
                            username: username,
                            password: password
                        },
                        success: processresponse
                    });
                }
                function processresponse(data)
                {
                    $("#location").text("You're registered now!");
                }
                function validate()
                {
                    var flag = true;

                    if (username.length > 30) {
                        $("#username").append("Must less than 30 characters.");
                        flag = false;
                    }
                    if (password.length < 8) {
                        $("#password").append("Enter a valid Password.");
                        flag = false;
                    }
                    if (password.length > 20) {
                        $("#password").append("Must less than 20 characters.");
                        flag = false;
                    }

                    return flag;
                }

            });
        });
    </script>
</body>
</html>
