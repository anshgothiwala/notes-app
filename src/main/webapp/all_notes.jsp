<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes</title>
<%@include file="allcssjs.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="navbar.jsp"%>
		<br>
		<h2>Your Notes</h2>

		<div class="row">
			<div class="col-12">
				<%
				// 1. Get current user from session
				Register currentUser = (Register) session.getAttribute("current-user");
				if (currentUser == null) {
					response.sendRedirect("Login.html");
					return;
				}

				// 2. Hibernate session
				Session s = FactoryProvider.getFactory().openSession();

				// 3. Query for current user's notes
				Query<Note> q = s.createQuery("from Note where user.id = :uid", Note.class);
				q.setParameter("uid", currentUser.getId());
				List<Note> list = q.list();

				for (Note note : list) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-4" style="max-width: 60px" src="images/notepad.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%= note.getTitle() %></h5>
						<p class="card-text">
							<%= note.getContent() %>
						</p>
						<a href="edit.jsp?note_id=<%= note.getId()%>" class="btn btn-primary mt-4">Edit</a>
						<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger mt-4">Delete</a>
						<p class="text-primary" style="text-align: right;">Date Added: <%= note.getAddedDate() %></p>
					</div>
				</div>
				<%
				}
				s.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>
