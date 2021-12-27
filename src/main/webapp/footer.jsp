<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer style="position: sticky;
    top: 100vh;" class="mt-auto bg-light text-center text-lg-start">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2021 Copyright:
        <span class="text-dark">Kucharek Szymon</span>
        <%if(userName != "")%><br><a href="userPanel.jsp">User Menu</a>
    </div>
</footer>