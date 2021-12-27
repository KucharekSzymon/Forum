<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer <%--style="position: absolute; bottom: 0; width: 100%; left: 0;"--%> class="bg-light text-center text-lg-start mt-auto">
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2021 Copyright:
        <a class="text-dark" href="https://mdbootstrap.com/">Kucharek Szymon</a>
        <%if(userName != "")%><br><a href="userPanel.jsp">User Menu</a>
    </div>
</footer>