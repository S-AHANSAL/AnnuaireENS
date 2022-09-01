/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ens.servlets;

import com.octest.bdd.DepartementBdd;
import com.octest.bdd.EtudiantBdd;
import com.octest.beans.Etudiant;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ahansal
 */
@WebServlet(name = "AdminEtudiant", urlPatterns = {"/AdminePage/Administration/Etudiant"})
public class AdminEtudiant extends HttpServlet {

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
            out.println("<title>Servlet AdminEtudiant</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>a</h1>");
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
        DepartementBdd tableNoms = new DepartementBdd();
        request.setAttribute("departements", tableNoms.recupererUtilisateurs());
        this.getServletContext().getRequestDispatcher("/AdminEtudiant.jsp").forward(request, response);
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
        Etudiant etudiant = new Etudiant();
        etudiant.setCne(request.getParameter("cne"));
        etudiant.setNom(request.getParameter("nom"));
        etudiant.setPrenom(request.getParameter("prenom"));
        etudiant.setTelephone(request.getParameter("telephone"));
        etudiant.setIdf(Integer.parseInt(request.getParameter("filiere")));
        EtudiantBdd tableNoms = new EtudiantBdd();
        tableNoms.ajouterUtilisateur(etudiant);

        DepartementBdd dep = new DepartementBdd();
        request.setAttribute("departements", dep.recupererUtilisateurs());
        this.getServletContext().getRequestDispatcher("/AdminEtudiant.jsp").forward(request, response);
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
