<%-- 
    Document   : Profile
    Created on : 17 Apr, 2017, 12:03:42 AM
    Author     : rohit
--%>
<%
    String username = session.getAttribute("username").toString();
    if(username == null)
        response.sendRedirect("error.jsp");
%>
<%@page import="com.database.GetPersonalDetails"%>
<%@page import="com.dto.PersonalDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%
    PersonalDetails pd = GetPersonalDetails.getDetails(username);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
        
        <jsp:include page="header.jsp"></jsp:include>
        
        <div class="container">
            <div class="jumbotron">
                <center>
                    
                    Full Name : <input type="text" id="realname" value="<%= pd.getRealName()%>"><br>
                Age : <input type="text" id="age" value="<%= pd.getAge()%>"><br>
                Gender : <select id="gender" >
                    <option value="Male">Male</option><option value="Female">Female</option>
                </select>
                Email : <input type="text" id="email" value="<%= pd.getEmail()%>"><br>
                Contact No : <input type="text" id="contactNo" value="<%= pd.getContactNo()%>"><br>
                <button id="btn">Update</button><br>
                <div id="location"></div>
                    
                </center>
            </div>
        </div>
        
        <script>
                $(document).ready(function(){
                    $("#btn").click(function(){
                    
                    var username = "<%= username%>";
                    var realname=$("#realname").val();
                    var age=$("#age").val();
                    var gender=$("#gender").val();
                    var contactNo=$("#contactNo").val();
                    var email=$("#email").val();
                
                        $.ajax({
                            type:"POST",
                            url:"UpdateProfile",
                            data:{
                                username:username,
                                realname:realname,
                                age:age,
                                gender:gender,
                                contactNo:contactNo,
                                email:email
                            },
                            success:processresponse
                        });
                    function processresponse(data)
                    {
                        $("#location").text("Profile Updated");
                    }

                        });
                    });
        </script>
    </body>
</html>
