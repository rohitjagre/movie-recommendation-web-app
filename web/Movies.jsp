<%-- 
    Document   : Movies
    Created on : 11 Apr, 2017, 1:58:52 AM
    Author     : rohit
--%>

<%@page import="java.util.Collections"%>
<%@page import="com.dto.MovieInfo"%>
<%@page import="com.dto.Movies"%>
<%@page import="org.apache.mahout.cf.taste.recommender.RecommendedItem"%>
<%@page import="org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender"%>
<%@page import="com.predict.items.ItemRecommender"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%
    String reqId = request.getParameter("id");
    List<String> searches = (List<String>)session.getAttribute("searches");
    Collections.reverse(searches);
    searches.add(reqId);
    session.setAttribute("searches", searches);
    session.setAttribute("id", reqId);
    int numOfSuggestions = (int) session.getAttribute("numOfSuggestions");
    Map<Long,Movies> allRecords = (Map<Long,Movies>) session.getAttribute("allRecords");
    Map<Long,MovieInfo> movieInfo = (Map<Long,MovieInfo>) session.getAttribute("movieInfo");
    GenericItemBasedRecommender recommender = ItemRecommender.getRecommender();
    List<RecommendedItem> items = recommender.mostSimilarItems(Integer.parseInt(reqId), numOfSuggestions);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Recommender</title>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <style>
            
        </style>
    </head>
    <body style=" background-color: #EEEEEE">

        <jsp:include page="header.jsp"></jsp:include>
        

        <div class="container">
            <div class="row">
            <div class="col-xs-6">
                <div class="row" style="display:flex; flex-wrap: wrap;">
                <%
                    
                    for (RecommendedItem item : items) {
                        Movies movie = allRecords.get(item.getItemID());
                        Long id = movie.getId();
                        String name = movie.getName();
                        String genre = movie.getGenre();
                        MovieInfo movieinfo = movieInfo.get(item.getItemID());
                        String imdb = movieinfo.getImdbid();
                %>

                <div class="col-xs-6 text-center">
                    <a href="Movies.jsp?id=<%= id%>">
                        <div class="thumbnail col-xs-12">
                            <img src="images/<%= id%>.jpg" alt="<%= name%>" class="img-rounded">
                            <div class="caption">
                                <h4><%= name%></h4>
                                <p><%= genre%></p>
                                <p>
                                    <a href="https://www.imdb.com/title/tt<%= imdb %>" class="btn btn-primary">More Information on IMDB</a>
                                    <a href="https://www.imdb.com/title/tt<%= imdb %>/videogallery" target="popup" class="btn btn-primary">Watch Trailer</a>
                                </p>
                            </div>
                        </div>
                    </a>
                </div>

                <%
                    }
                %>
                </div>
            </div>
                
        
        <%
            Movies m1 = allRecords.get(Long.parseLong(reqId));
            MovieInfo movieinfo = movieInfo.get(m1.getId());
            String imdb = movieinfo.getImdbid();
            String name = movieinfo.getName();
            String info = movieinfo.getInfo();
            float rating = movieinfo.getRating();
            int runtime = movieinfo.getRuntime();
        %>
        <div class="col-xs-6 text-center">
            <div class="affix">
                <!--<div class="jumbotron col-xs-11">-->
                    <img src="images/<%= m1.getId()%>.jpg" class="img-thumbnail img-responsive" alt="<%= name%>" width="30%">
                    <div class="caption">
                        <h2><%= name%></h2>
                        <p><%= m1.getGenre()%></p>
                        <p><%= info %></p>
                        <p>Rating : <%= rating %></p>
                        <p>Runtime : <%= runtime %> Minutes</p>
                        
                        <p>
                            <a href="https://www.imdb.com/title/tt<%= imdb %>" class="btn btn-primary">More Information on IMDB</a>
                            <a href="https://www.imdb.com/title/tt<%= imdb %>/videogallery" target="popup" class="btn btn-primary">Watch Trailer</a>
                        </p>
                    </div>
                <!--</div>-->
            </div>
        </div>
        
                                
<!--                        </div>
                    </div>-->
                
            </div>
        </div>
    </body>
</html>
