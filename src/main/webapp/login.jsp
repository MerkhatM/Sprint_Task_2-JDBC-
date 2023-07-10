<%--
  Created by IntelliJ IDEA.
  User: merha
  Date: 09.07.2023
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Sign-in</title>
    <%@include file="assets/bootstrap.jsp" %>
</head>
<body>
<%@include file="assets/navbar.jsp" %>
<%
    String error = request.getParameter("error");
    if (error != null) {
%>
<div class="alert alert-danger alert-dismissible fade show col-8 mx-auto d-flex justify-content-between" role="alert">
    <div>
        Incorrect <strong>email</strong> or <strong>password</strong>
    </div>
    <button type="button" class="close" data-bs-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    }
%>
<div class=" col-8 mx-auto shadow ">
    <div class="col-12 bg-body-tertiary ps-2 mb-4" style="height: 50px">
        <h2>Login Page</h2>
    </div>
    <form action="/login" method="post">
        <div class="form-group row mb-2 ps-2">
            <label for="exampleInputEmail1" class="col-2">Email </label>
            <div class="col-9">
                <input type="text" class="form-control" id="exampleInputEmail1" name="email">
            </div>
        </div>
        <div class="form-group row mb-2 ps-2">
            <label for="exampleInputPassword" class="col-2">Password</label>
            <div class="col-9">
                <input type="password" class="form-control" id="exampleInputPassword" name="password">
            </div>
        </div>
        <button type="submit" class="btn btn-success ms-2 mb-4">Login</button>
    </form>
</div>

</body>
</html>
