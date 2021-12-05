<%@ page import="java.sql.Connection" %>
<%@ page import="com.mycompany.forum.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>

	<%
		String post_ID = request.getParameter("post");

		Connection con = DatabaseConnection.initializeDatabase();
		String query  = "SELECT Posts.Post_Title,Users.Username,Posts.Date,Posts.Post from Posts INNER join Users on Posts.Author_ID = Users.User_ID where Posts.Post_ID = ?;";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1,post_ID);
		ResultSet rs = ps.executeQuery();
		rs.next();

			String tytul = rs.getString("Post_Title");
			String Username = rs.getString("Username");
			String Date = rs.getString("Date");
			String Post = rs.getString("Post");
	%>

<div style="padding: 10px;">
	<h1><%=tytul%></h1>
	<h3><%=Username%></h3>
	<br>
	<hr>
	<div>
		<%=Post%>
	</div>
	<%if (userName != ""){%>
	<div class="input-group">
		<form method="post" action="/Forum/newComment">
			<div class="input-group">
				<input name="Post_ID" type="text" style="display: none;" value="<%=post_ID%>">
				<input name="User_ID" type="text" style="display: none;" value="<%=userID%>">
				<input name="Reply" type="text" class="form-control" placeholder="Write a replay..">
				<div class="input-group-append">
					<input  class="btn btn-outline-secondary" type="submit">
				</div>
			</div>
		</form>

	</div>
	<%}%>
	<div style="padding: 10px;">
	<%
		query = "SELECT Relies.User_ID,Relies.Reply,Relies.Date,Users.User_ID,Users.Username FROM Relies INNER join Users ON Relies.User_ID = Users.User_ID WHERE Relies.Post_ID = ?;";
		PreparedStatement ps1 = con.prepareStatement(query);
		ps1.setString(1,post_ID);
		ResultSet rs1 = ps1.executeQuery();
		while (rs1.next()){
			String name = rs1.getString("Username");
			String Reply = rs1.getString("Reply");
			String Data = rs1.getString("Date");

		%>
		<div>
			<div>
				<div>
					<h5>
						<%=name%>
					</h5>
				</div>
				<%=Reply%>
			</div>
			<span>
        <%=Data%>
    </span>
			<hr>
		</div>
	<%
		}
	%>
	</div>

	<a href="/Forum">&larr; Back to home</a>
</div>


</div>
</body>
</html>
