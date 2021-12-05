<%@ page import="java.sql.Connection" %>
<%@ page import="com.mycompany.forum.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<html>

<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
<div class="container-fluid mt-100">
	<div class="d-flex flex-wrap justify-content-between">
		<div> <button type="button" class="btn btn-shadow btn-wide btn-primary"> <span class="btn-icon-wrapper pr-2 opacity-7"> <i class="fa fa-plus fa-w-20"></i> </span> New thread </button> </div>
		<div class="col-12 col-md-3 p-0 mb-3"> <input type="text" class="form-control" placeholder="Search..."> </div>
	</div>
	<div class="card mb-3">
		<div class="card-header pl-0 pr-0">
			<div class="row no-gutters w-100 align-items-center">
				<div class="col ml-3">Topics</div>
				<div class="col-4 text-muted">
					<div class="row no-gutters align-items-center">
						<div class="col-4">Replies</div>
						<div class="col-8">Last update</div>
					</div>
				</div>
			</div>
		</div>
	<%
		String x = "asd";
		PrintWriter posts = response.getWriter();

		Connection con = DatabaseConnection.initializeDatabase();
	String query  = "SELECT Post_ID,Posts.Post_Title,Users.Username,Posts.Date,Posts.Post from Posts INNER join Users on Posts.Author_ID = Users.User_ID;\n";
		PreparedStatement ps = con.prepareStatement(query);
		ResultSet rs = ps.executeQuery();

		Integer init=Integer.parseInt(application.getInitParameter("posts"));
		for(int i = 0; i < init; i++){
			rs.next();
			String postID = rs.getString("Post_ID");
			String tytul = rs.getString("Post_Title");
			String Username = rs.getString("Username");
			String Date = rs.getString("Date");
	%>


		<div class="card-body py-3">
			<div class="row no-gutters align-items-center">
				<div class="col"> <a href="/Forum/post.jsp?post=<%=postID%>" class="text-big" data-abc="true"> <%=tytul %>
					<div class="text-muted small mt-1">Started: <%=Date%> &nbsp;·&nbsp; <a href="javascript:void(0)" class="text-muted" data-abc="true"></a></div>
				</div>
				<div class="d-none d-md-block col-4">
					<div class="row no-gutters align-items-center">
						<div class="col-4">0</div>
						<div class="media col-8 align-items-center"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583246/AAA/2.jpg" alt="" class="d-block ui-w-30 rounded-circle">
							<div class="media-body flex-truncate ml-2">
								<div class="line-height-1 text-truncate">1 day ago</div> <a href="javascript:void(0)" class="text-muted small text-truncate" data-abc="true">by <%=Username%></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<% } %>
		<hr class="m-0">
	</div>
	<nav>
		<ul class="pagination mb-5">
			<li class="page-item disabled"><a class="page-link" href="javascript:void(0)" data-abc="true">«</a></li>
			<li class="page-item active"><a class="page-link" href="javascript:void(0)" data-abc="true">1</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0)" data-abc="true">2</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0)" data-abc="true">3</a></li>
			<li class="page-item"><a class="page-link" href="javascript:void(0)" data-abc="true">»</a></li>
		</ul>
	</nav>
</div>
</body>
</html>