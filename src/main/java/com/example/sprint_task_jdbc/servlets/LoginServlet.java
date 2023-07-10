package com.example.sprint_task_jdbc.servlets;

import com.example.sprint_task_jdbc.dbManager.DBManager;
import com.example.sprint_task_jdbc.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentUser");
        if (user == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        response.sendRedirect("/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DBManager.connect();
        User user = DBManager.getUserByEmailAndPassword(email, password);
        String redirect = "/login?error";
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            redirect = "/profile";
        }
        response.sendRedirect(redirect);

    }
}
