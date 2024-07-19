/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlets;

import com.blog.DAO.UserDao;
import com.blog.entities.UserEntity;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.encrypt;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import oracle.jdbc.driver.Message;

/**
 *
 * @author belu and riju
 */
public class loginServlet extends HttpServlet {

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
            
            //fetch the user credentials
            String userEmail = request.getParameter("user_email");
            String userPassHash = encrypt.generateHash(request.getParameter("user_password"));
            
            //get the user entity
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            UserEntity user = dao.getUserEntityByEmailAndPassword(userEmail, userPassHash);
            
            if (user == null) {
                //login error show error page
                out.println("<h1>u have entered wrong details</h1>");
//                Message msg = new Message("invalid details try again!", "error", "alert alert-danger");
//                HttpSession s = request.getSession();
//                s.setAttribute("msg", msg);
                response.sendRedirect("index.jsp");
                
            } else {
                //save data in session
                HttpSession session = request.getSession();
                session.setAttribute("user_entity", user);
                response.sendRedirect("personal_home.jsp");
                 //out.println(user);
                
            }
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
        processRequest(request, response);
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
