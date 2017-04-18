<%--
  Created by IntelliJ IDEA.
  User: defin
  Date: 18.04.2017
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Success Page</title>
</head>
<body>
<%
    String userName = null;
//allow access only if session exists
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.html");
    } else userName = (String) session.getAttribute("user");
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) userName = cookie.getValue();
        }
    }
%>
<h3>Hi <%=userName %>, do the checkout.</h3>
<br>
<form action="<%=response.encodeURL("LogoutServlet") %>" method="post">
    <input type="submit" value="Logout">
</form>
</body>
</html>