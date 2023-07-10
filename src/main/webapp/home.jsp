<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.sprint_task_jdbc.models.Item" %>
<%@ page import="com.example.sprint_task_jdbc.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bitlab_shop</title>
    <%@include file="assets/bootstrap.jsp" %>
</head>
<body>
<%
    User user = (User) request.getSession().getAttribute("currentUser");
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
<%
} else {
%>
<%@include file="assets/navbar.jsp" %>
<%
    }
%>
<header class="mx-auto ">
    <h1 class="text-center">Welcome to BITLAB SHOP</h1>
    <h4 class="text-center" style="color: gray">Electronic devices with high quality and service</h4>
</header>
<div class="container mt-5 col-8 mx-auto d-flex flex-wrap ">

    <%
        ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
        for (Item i : items) {
    %>

    <div class="col-md-4 pb-2 pe-4 text-center">
        <div class="card mb-4 shadow-sm">
            <div class="card-header">
                <h4 class="my-0 font-weight-normal"><%=i.getName()%>
                </h4>
            </div>
            <div class="card-body">
                <h2 class="card-title pricing-card-title text-success">$<%=i.getPrice()%>
                </h2>
                <%
                    String[] words = i.getDescription().split(" ");
                    String paragraphThree = "";
                    for (int j = 6; j < words.length; j++) {
                        paragraphThree += words[j] + " ";
                    }
                %>
                <p class="mx-auto"><%=words[0] + " " + words[1] + " " + words[2]%>
                </p>
                <p class="mx-auto"><%=words[3] + " " + words[4] + " " + words[5]%>
                </p>
                <p class="mx-auto"><%=paragraphThree%>
                </p>
                <button type="button" class="btn btn-lg btn-block bg-success container-fluid px-2"
                        style="color: white">Buy now
                </button>
            </div>
        </div>
    </div>
    <%
        }
    %>

</div>
</body>
</html>