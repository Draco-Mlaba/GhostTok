/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package tut.web;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tut.ejb.bl.ConfessionFacadeLocal;
import tut.entities.Confession;

/**
 *
 * @author musaw
 */
public class ConfessionServlet extends HttpServlet {
    @EJB private ConfessionFacadeLocal cb;
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Confession> confessions = cb.getAllConfessions();
        request.setAttribute("confessions", confessions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("confession.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("message");
        String username = "Anonymous";

        if (username != null && message != null && !message.isEmpty()) {
            cb.saveConfession(username, message);
        }

       request.getRequestDispatcher("confession.jsp").forward(request, response);
    }
}

