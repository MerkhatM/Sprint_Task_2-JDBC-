package com.example.sprint_task_jdbc.servlets;

import com.example.sprint_task_jdbc.dbManager.DBManager;
import com.example.sprint_task_jdbc.models.Item;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBManager.connect();
        ArrayList<Item> items = DBManager.getItems();
        request.setAttribute("items", items);
        for (Item i :
                items) {
            System.out.println(i.getName());
        }
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }


}
