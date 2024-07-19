/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlets;

import com.blog.DAO.UserDao;
import com.blog.entities.UserEntity;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.encrypt;
import com.blog.helper.helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            //getting user and otp object from session
            HttpSession s = request.getSession();
            UserEntity user = (UserEntity) s.getAttribute("user_entity");
            int actualOtp = (Integer) s.getAttribute("otp");
            //System.out.println(user);

            //get user given otp from form
            int userGivenOtp = Integer.parseInt(request.getParameter("OTP"));

            

            //check if OTP matches if true then push to DB else show error cancel session
            if (actualOtp == userGivenOtp) {
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                if (dao.saveUser(user)) {
                    
                    UserEntity userFromDB = dao.getUserEntityByEmailAndPassword(user.getEmail(),user.getPassword());
                    
                    out.println("success");
                     s.removeAttribute("user_entity");
                    s.removeAttribute("otp");
                    s.removeAttribute("image");
                    s.setAttribute("user_entity", userFromDB);
                    response.sendRedirect("personal_home.jsp");
                    
                } else {
                    out.println("error");
                    s.removeAttribute("user_entity");
                    s.removeAttribute("otp");
                    s.removeAttribute("image");
                    response.sendRedirect("index.jsp");
                }

            } else {
                out.println("error");
                s.removeAttribute("user_entity");
                s.removeAttribute("otp");
                s.removeAttribute("image");
                response.sendRedirect("index.jsp");
            }

            //pushing to database
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
