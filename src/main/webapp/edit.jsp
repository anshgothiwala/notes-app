<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<%@include file="allcssjs.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="navbar.jsp"%>
		<br>
		<h2>Edit Your Note</h2>

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());

		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, noteId);
		%>

		<form class="container-fluid" action="UpdateServlet" style="width: 80%;" method="post">
		
			<input value="<%= note.getId()%>" name="noteId" type="hidden">
			
			<div class="form-group">
				<label for="title">Note Title</label> <input name="title" required
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter Note Title"
					value="<%=note.getTitle()%>">

			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea name="content" required id="content"
					placeholder="Enter Note Content" class="form-control"
					style="height: 250px;"><%= note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>
		</form>


	</div>
</body>
</html>