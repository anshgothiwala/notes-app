<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="allcssjs.jsp" %>
</head>
<body>
	<div class="container-fluid">
    	<%@include file="navbar.jsp" %>
    </div>
    <br>
    <h2 class="container-fluid">Write your Note</h2>
    <br>
    <!-- This is add form -->
    <form class="container" style="width: 80%;" action="SaveNoteServlet" method="post">
  	<div class="form-group">
    	<label for="title">Note Title</label>
    	<input 
    		name="title"
    		required
    		type="text" 
    		class="form-control" 
    		id="title" 
    		aria-describedby="emailHelp" 
    		placeholder="Enter Note Title">
    	
  	</div>
  	<div class="form-group">
    	<label for="content">Note Content</label>
    	<textarea
    		name="content"
    		required 
    		id="content" 
    		placeholder="Enter Note Content"
    		class="form-control"
    		style="height:250px;"></textarea>
  	</div>
  	<div class="container text-center">
  		<button type="submit" class="btn btn-primary">Add Note</button>
  	</div>
</form>
</body>
</html>