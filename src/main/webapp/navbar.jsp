<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

	<a class="navbar-brand" href="index.jsp">Note Keeper</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="addNotes.jsp" style="color: white;">Add
					Note</a></li>
			<li class="nav-item"><a class="nav-link" href="all_notes.jsp" style="color: white;">Show
					Notes</a></li>
		</ul>
		<form action="LogoutServlet" method="post"
			class="form-inline my-2 my-lg-0">
			<button class="btn btn-danger my-2 my-sm-0" type="submit">Logout</button>
		</form>

	</div>
</nav>