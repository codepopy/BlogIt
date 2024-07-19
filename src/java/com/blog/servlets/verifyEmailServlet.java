package com.blog.servlets;

import com.blog.entities.UserEntity;
import com.blog.helper.encrypt;
import com.blog.helper.helper;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@MultipartConfig
public class verifyEmailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String user_name = request.getParameter("user_name");
            String birthday = request.getParameter("b_date");
            String email = request.getParameter("email");
            String unHashedPass = request.getParameter("pass");
            String hashPass = encrypt.generateHash(unHashedPass); //storing the hash of the password

            String gender = request.getParameter("gender");

            String sec_q_no = request.getParameter("sec-q");
            String ans = request.getParameter("ans");

            //creating user object
            UserEntity user = new UserEntity(user_name, birthday, email, hashPass, gender, sec_q_no, ans);

            int OTPcode = helper.createOTP();

            String to = email;
            String subject = "email verification";
            String text = "Your OTP for Signing up to FSociety is " + OTPcode;

            boolean a = helper.sendEmail(to, subject, text);
            if (a) {
                System.out.println("Email sent successfully");
            } else {
                System.out.println("email not sent error!");
            }

            HttpSession s = request.getSession();
            s.setAttribute("user_entity", user);
            s.setAttribute("otp", OTPcode);

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
