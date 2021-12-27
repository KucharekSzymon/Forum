<html>
<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="login.css">
<body>
<div class="container">
        <div class="card card-container">
                <h1>Sign in</h1>
                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <p id="profile-name" class="profile-name-card"></p>
                <form class="form-signin" action="LoginServlet" method="post">
                        <span id="reauth-email" class="reauth-email"></span>
                        <input type="text" id="inputEmail" class="form-control" name="user" placeholder="Email address" required autofocus>
                        <input type="password" id="inputPassword" class="form-control" name="pwd" placeholder="Password" required>
                        <button class="btn btn-lg btn-primary btn-block btn-signin" value="Login" type="submit">Sign in</button>
                </form><!-- /form -->
        </div><!-- /card-container -->
</div><!-- /container -->
<%@ include file="/footer.jsp" %>
</body>
</html>