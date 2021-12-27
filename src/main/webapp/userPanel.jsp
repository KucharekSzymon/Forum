<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ include file="/header.jsp" %>
<body>
<div class="main">
    <div class="card mb-3">
        <div class="card-header pl-0 pr-0">
            <div class="row no-gutters w-100 align-items-center">
                <div class="col ml-3">All posts</div>
                <div class="col-4 text-muted">
                </div>
            </div>
        </div>
        <%
            Connection con = DatabaseConnection.initializeDatabase();

            String query = "select * from Posts where Posts.Author_ID = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,userID);
            ResultSet rs = ps.executeQuery();

            Integer init=Integer.parseInt(application.getInitParameter("posts"));
            for(int i = 0; i < init; i++){
                if(rs.isLast())
                    break;
                rs.next();
                String postID = rs.getString("Post_ID");
                String tytul = rs.getString("Post_Title");
                String Date = rs.getString("Date");
        %>
        <div class="card-body py-3">
            <div class="row no-gutters align-items-center">
                <div class="col"> <a href="/Forum/post.jsp?post=<%=postID%>" class="text-big" data-abc="true"> <%=tytul %>
                    <div class="text-muted small mt-1">Started: <%=Date%> &nbsp;·&nbsp; <a href="javascript:void(0)" class="text-muted" data-abc="true"></a></div>
                </div>

            </div>
        </div>
        <% } %>
        <hr class="m-0">
    </div>
</div>
<div class="main">
    <div class="card mb-3">
        <div class="card-header pl-0 pr-0">
            <div class="row no-gutters w-100 align-items-center">
                <div class="col ml-3">All replies</div>
                <div class="col-4 text-muted">
                </div>
            </div>
        </div>
        <%

            String relies = "select * from Relies where Relies.User_ID = ?";
            PreparedStatement psrelies = con.prepareStatement(relies);
            psrelies.setString(1,userID);
            ResultSet rsrelies = psrelies.executeQuery();

            for(int i = 0; i < init; i++){
                if(rsrelies.isLast())
                    break;
                rsrelies.next();
                String postID = rsrelies.getString("Post_ID");
                String tytul = rsrelies.getString("Reply");
                String Date = rsrelies.getString("Date");
        %>
        <div class="card-body py-3">
            <div class="row no-gutters align-items-center">
                <div class="col"> <a href="/Forum/post.jsp?post=<%=postID%>" class="text-big" data-abc="true"> <%=tytul %>
                    <div class="text-muted small mt-1">Started: <%=Date%> &nbsp;·&nbsp; <a href="javascript:void(0)" class="text-muted" data-abc="true"></a></div>
                </div>

            </div>
        </div>
        <% } %>
        <hr class="m-0">
    </div>
</div>



<%@ include file="/footer.jsp" %>
</body>
</html>
