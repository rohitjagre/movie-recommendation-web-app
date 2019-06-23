<%-- 
    Document   : History
    Created on : Apr 22, 2017, 1:05:41 AM
    Author     : My DeLL
--%>

<%@page import="com.dto.MovieInfo"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>

<%
    List<String> searches = (List<String>) session.getAttribute("searches");
    Collections.reverse(searches);
    Map<Long,MovieInfo> movieInfo = (Map<Long,MovieInfo>) session.getAttribute("movieInfo");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
        
        <jsp:include page="header.jsp"></jsp:include>
    <center>
        <div class="container">
            <div class="jumbotron">
                
                <h2>History</h2></div>
            <%
                for (String s : searches) {
                    MovieInfo movie = movieInfo.get(Long.parseLong(s));
                    String name = movie.getName();
            %>
            <a href="Movies.jsp?id=<%= movie.getId()%>"><p><%= name%></p></a>
                    <%
                        }
                    %>
            <br><br>
            <a class="btn btn-primary" href="ClearHistories">Clear Search History</a>
                
            
        </div>
    </center>  
    </body>
</html>
