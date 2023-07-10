package com.example.sprint_task_jdbc.servlets;

import com.example.sprint_task_jdbc.models.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(value = "/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("currentUser");
        System.out.println(user.getFullName());
        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("profile.jsp").forward(request, response);

        }

    }


}
