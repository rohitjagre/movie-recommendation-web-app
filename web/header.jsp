<%
    String id = session.getAttribute("id").toString();
%>
<script src="js/typeahead.bundle.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
    // Sonstructs the suggestion engine
    var countries = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                // The url points to a json file that contains an array of country names
                prefetch: 'http://localhost:8084/MahoutRecommEngine/Moviesname.json'
            });

            // Initializing the typeahead with remote dataset
            $('.typeahead').typeahead(null, {
                name: 'countries',
                source: countries,
                limit: 5 /* Specify maximum number of suggestions to be displayed */
            });
    });
</script>
<style type="text/css">
.bs-example {
        font-family: sans-serif;
        position: relative;
        margin: 100px;
}
.typeahead, .tt-query, .tt-hint {
        border: 2px solid #CCCCCC;
        border-radius: 8px;
        font-size: 22px; /* Set input font size */
        height: 30px;
        line-height: 30px;
        outline: medium none;
        padding: 8px 12px;
        width: 396px;
}
.typeahead {
        background-color: #FFFFFF;
}
.typeahead:focus {
        border: 2px solid #0097CF;
}
.tt-query {
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
}
.tt-hint {
        color: #999999;
}
.tt-menu {
        background-color: #FFFFFF;
        border: 1px solid rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        margin-top: 12px;
        padding: 8px 0;
        width: 422px;
}
.tt-suggestion {
        font-size: 22px;  /* Set suggestion dropdown font size */
        padding: 3px 20px;
}
.tt-suggestion:hover {
        cursor: pointer;
        background-color: #0097CF;
        color: #FFFFFF;
}
.tt-suggestion p {
        margin: 0;
}
</style>

<div class="container-fluid" style="margin-bottom: 60px">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                </button>
                <a class="navbar-brand">Recommendation Engine</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="Movies.jsp?id=<%= id %>">Home</a></li>
                    <li><a href="Profile.jsp">Profile</a></li>
                    <li><a href="Account.jsp">Account</a></li> 
                    <li><a href="History.jsp">History</a></li> 
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <form class="navbar-form navbar-left" method="POST" action="Search">
                        <div class="input-group">
                            <input type="text" name="MovieName" class="typeahead tt-query form-control" autocomplete="off" spellcheck="false" placeholder="Search">
                          
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<!-- End of Navbar -->