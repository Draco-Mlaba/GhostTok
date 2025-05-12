/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package tut.web;

import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Mpashi Makgabo
 */
public class ViewPostServlet extends HttpServlet {

    @EJB
    private ConfessionFacadeLocal cfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Confession> confessions = cfl.getAllConfessions();
        request.setAttribute("confessions", confessions);
        RequestDispatcher disp = request.getRequestDispatcher("viewPosts.jsp");
        disp.forward(request, response);
    
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


}
