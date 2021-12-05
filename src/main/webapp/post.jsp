<%@ page import="java.sql.Connection" %>
<%@ page import="com.mycompany.forum.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<html>

<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>

	<%
		PrintWriter posts = response.getWriter();
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
	<a href="/Forum">&larr; Back to home</a>
</div>


</div>
</body>
</html>