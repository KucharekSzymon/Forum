<html>
<%@ include file="/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="login.css">
<body>
<div class="container">
        <div class="card card-container">
                <h1>Sign up</h1>
                    <form class="form-signin" action="InsertData" method="post">
                        <span id="reauth-email" class="reauth-email"></span>
                        <input type="text" id="inputEmail" class="form-control" name="user" placeholder="Email address" required autofocus>
                        <input type="password" id="inputPassword" class="form-control" name="pwd" placeholder="Password" required>
                        <button class="btn btn-lg btn-primary btn-block btn-signin" value="Login" type="submit">Sign in</button>
                    </form><!-- /form -->
        </div><!-- /card-container -->
</div><!-- /container -->
</body>
</html>