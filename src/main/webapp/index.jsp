<%
    if(session.getAttribute("current-user") == null){
        response.sendRedirect("Login.html");
        return;
    }
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Note Keeper</title>
    
	<%@include file="allcssjs.jsp" %>
	    
  </head>
  <body>
    
    <div class="container-fluid">
    	<%@include file="navbar.jsp" %>
    <br>
    <h2>Start making your Notes now by clicking the button below</h2>
    <br>
    <a href="addNotes.jsp"><button class="btn btn-primary">Create Note</button></a>
    </div>
    
  </body>
</html>