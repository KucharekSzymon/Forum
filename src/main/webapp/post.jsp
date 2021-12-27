<%@ page import="java.sql.Connection" %>
<%@ page import="com.mycompany.forum.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.math.RoundingMode" %>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!--Rating-->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js' type="text/javascript"></script>
	<script src='starsRating/jquery.MetaData.js' type="text/javascript" language="javascript"></script>
	<script src='starsRating/jquery.rating.js' type="text/javascript" language="javascript"></script>
	<link href='starsRating/jquery.rating.css' type="text/css" rel="stylesheet"/>
</head>

<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>

	<%
		String post_ID = request.getParameter("post");
		request.setCharacterEncoding("UTF-8");
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
					<input  class="btn btn-outline-secondary" value="Submit" type="submit">
				</div>
			</div>
		</form>

	</div>
	<%}%>
	<div style="padding: 10px;">
		<link rel="stylesheet" href="starRating.css">
		<%
		query = "SELECT Relies.Reply_ID,Relies.User_ID,Relies.Reply,Relies.Date,Users.User_ID,Users.Username FROM Relies INNER join Users ON Relies.User_ID = Users.User_ID WHERE Relies.Post_ID = ? order by Relies.Date DESC;";
		PreparedStatement ps1 = con.prepareStatement(query);
		ps1.setString(1,post_ID);
		ResultSet rs1 = ps1.executeQuery();
		while (rs1.next()){
			String name = rs1.getString("Username");
			String Reply = rs1.getString("Reply");
			String Data = rs1.getString("Date");
			String rReply_ID = rs1.getString("Reply_ID");
		%>
		<div>
			<div>
				<div>
					<h5>
						<%=name%>
					</h5>
				</div>
				<%=Reply%>
				<%if(userName != ""){ %>
				<%
					String qusrRating = "Select * from Rating where User_ID = ? AND Reply_ID = ?;";
					PreparedStatement psUsrRating =  con.prepareStatement(qusrRating);
					psUsrRating.setString(1,userID);
					psUsrRating.setString(2,rReply_ID);
					ResultSet rsUsrRating = psUsrRating.executeQuery();
					if(rsUsrRating.next() == false){
				%>
				<jsp:element name="form">
					<jsp:attribute name="action">
						<%="/Forum/addRating"%>
					</jsp:attribute>
					<jsp:attribute name="method">
						<%="post"%>
					</jsp:attribute>
					<jsp:body>
						<jsp:element name="input">
							<jsp:attribute name="name">
								<%="Reply_ID"%>
							</jsp:attribute>
							<jsp:attribute name="type">
								<%="text"%>
							</jsp:attribute>
							<jsp:attribute name="style">
								<%="display:none;"%>
							</jsp:attribute>
							<jsp:attribute name="value">
								<%=rReply_ID%>
							</jsp:attribute>
						</jsp:element>

						<input name="User_ID" type="text" style="display: none" value="<%=userID%>"/>
						<input name="star1" type="radio" value="1" class="star"/>
						<input name="star1" type="radio" value="2"  class="star"/>
						<input name="star1" type="radio" value="3"  class="star"/>
						<input name="star1" type="radio" value="4"  class="star"/>
						<input name="star1" type="radio" value="5"  class="star"/>
						<input type="submit" class="btn btn-outline-secondary" value="Rate">
					</jsp:body>
				</jsp:element>

				<br>
				<%}}%>
				<div>
					<%
						String qRating = "SELECT AVG(Stars) as AVG FROM Rating WHERE Reply_ID = ?";
						PreparedStatement psRating = con.prepareStatement(qRating);
						psRating.setString(1,rReply_ID);

						ResultSet rsRating = psRating.executeQuery();
						while (rsRating.next()) {

							BigDecimal bd = new BigDecimal(rsRating.getDouble("AVG")).setScale(2, RoundingMode.HALF_UP);
							Double avg = (bd.doubleValue());
							if(avg >0){

								String proc = String.format("%.0f", avg/5*100);
					%>
					<ul style="margin-left: -50px;">
						<li><div class="stars"><div class="percent" style="width: <%=proc%>%"></div></div></li>
					</ul>
					<%}}%>
				</div>
			</div>
			<span><%=Data%></span>
			<hr>
		</div>
	<%
		}
	%>
	</div>

	<a href="/Forum">&larr; Back to home</a>
</div>


</div>
	<%@ include file="/footer.jsp" %>
</body>
</html>
