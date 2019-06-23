<%-- 
    Document   : Account
    Created on : 17 Apr, 2017, 10:23:45 PM
    Author     : rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%
    String username = session.getAttribute("username").toString();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
    </head>
    <body>
        
        <jsp:include page="header.jsp"></jsp:include>
    <center>
        <div class="container">
            <div class="jumbotron">
                
                <div>
                    <h3>Update Password</h3><br>
                    Old Password : <input type="password" id="oldpassword" value=""><br>
                    New Password : <input type="password" id="newpassword" value=""><br>
                    <button id="updatePasswordBtn">Update Password</button><br>
                    <div id="updatePasswordLocation"></div><br>
                </div><br>
                <div>
                    <h3>Number of Suggestions : <input type="text" id="nosuggestion" value=""></h3><br>
                    <button id="updateNoSuggestionBtn">Update</button><br>
                    <div id="updateNoSuggestionLocation"></div><br>
                </div>
            </div>
        </div>
    </center>    
        <script>
                $(document).ready(function(){
                    $("#updatePasswordBtn").click(function(){
                    
                    var username = "<%= username%>";
                    var oldpassword=$("#oldpassword").val();
                    var newpassword=$("#newpassword").val();
                
                        $.ajax({
                            type:"POST",
                            url:"UpdatePasswordServlet",
                            data:{
                                username:username,
                                oldpassword:oldpassword,
                                newpassword:newpassword
                            },
                            success:processresponse
                        });
                    function processresponse(data)
                    {
                        $("#updatePasswordLocation").text("Password Updated Successfully");
                    }

                });
            });
            
            $("#updateNoSuggestionBtn").click(function(){
                    
                    var nosuggestion=$("#nosuggestion").val();
                
                        $.ajax({
                            type:"POST",
                            url:"UpdateNoOfSuggestion",
                            data:{
                                numOfSuggestions:nosuggestion
                            },
                            success:processresponse1
                        });
                    function processresponse1(data)
                    {
                        $("#updateNoSuggestionLocation").text("Updation Successful");
                    }

                });
            
        </script>
        
    </body>
</html>
