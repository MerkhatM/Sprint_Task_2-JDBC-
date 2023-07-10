<%@ page import="com.example.sprint_task_jdbc.models.User" %><%--
  Created by IntelliJ IDEA.
  User: merha
  Date: 09.07.2023
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <%@include file="assets/bootstrap.jsp" %>
</head>
<body>
<%
    User user = (User) request.getAttribute("user");
    if (user != null) {

%>
<nav class="navbar navbar-expand-lg bg-navbar mb-3 shadow p-3 mb-5 bg-body-tertiary rounded">
    <div class="container-fluid col-8 mx-auto" style="display: flex; justify-content: space-between">
        <div>
            <a class="navbar-brand fw-bold text-color fs=1" href="#">BITLAB SHOP</a>
        </div>
        <div style="display: flex;">
            <a class="nav-link active text-color me-3" aria-current="page" href="#">Top Sales</a>
            <a class="nav-link active text-color me-3" aria-current="page" href="#">New Sales</a>
            <a class="nav-link active text-color me-3" aria-current="page" href="#">By Category</a>
            <form action="/logout" method="post">
                <button class="btn btn-warning nav-link active text-color me-3 ">Logout</button>
            </form>
        </div>
    </div>
</nav>

<div class="col-4 mx-auto text-center">
    <h2>Hello <%=user.getFullName()%>
    </h2>
    <h5 style="color: grey">This is your profile page</h5>
</div>

<%
    }
%>
</body>
</html>
