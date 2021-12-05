<html>
<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="login.css">
<body>
<div class="container">
        <div class="card card-container">
                <h1>Create a post</h1>
                    <form class="form-signin" action="/Forum/createPost" method="post">
                        <input type="text" name="user" value="<%=userName%>" style="display: none;">
                        <input type="text" id="inputTitle" class="form-control" name="inputTitle" placeholder="Post Title" required autofocus>
                        <textarea class="form-control" id="inputPost" name="inputPost" rows="3"></textarea><br>
                        <button class="btn btn-lg btn-primary btn-block btn-signin" value="Login" type="submit">Add post</button>
                    </form>
        </div>
</div>
</body>
</html>