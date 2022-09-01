/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ens.servlets;

import com.octest.bdd.UserBdd;
import com.octest.beans.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ahansal
 */
@WebServlet(name = "Connecter", urlPatterns = {"/Connecter"})
public class Connecter extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Connecter</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Connecter at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         List<User> users = new ArrayList<User>();
        UserBdd tableNoms = new UserBdd();
        String a =request.getParameter("user") ;
        String b =request.getParameter("password");
        users = tableNoms.recupererUtilisateurs(a,b);

      /* response.setContentType("text/html;charset=UTF-8");
         try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<h1>" + a + "</h1>");
            out.println("<h1>" + b + "</h1>");
            for (User user : users) {
                out.println("<h1>" + user.getUser() + "</h1>");
            }
        }*/
        if (users.isEmpty()) {
           this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
        } else {
           // HttpSession session = request.getSession();
           // session.setAttribute("autorisation", "oui");
            this.getServletContext().getRequestDispatcher("/UtilEtudiant.jsp").forward(request, response);
            //response.sendRedirect("AdminePage/Utilisation/Etudiant");
            /*try ( PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html>");
                for (User user : users) {
                    out.println("<h1>" + user.getUser() + "</h1>");
                }
            }*/
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
