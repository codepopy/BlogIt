/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlets;

import com.blog.DAO.PostDao;
import com.blog.entities.PostsEntity;
import com.blog.entities.UserEntity;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.helper;
import jakarta.servlet.ServletContext;
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

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int cId = Integer.parseInt(request.getParameter("category_id"));
            
            String pTitle = request.getParameter("post_title");
            String pDesc = request.getParameter("post_description");
            String pContent = request.getParameter("post_content");
            Part part = request.getPart("post_pic");
            String pPic = part.getSubmittedFileName();

            HttpSession s = request.getSession();
            UserEntity user = (UserEntity) s.getAttribute("user_entity");

            int userId = user.getUser_id();

            PostsEntity post = new PostsEntity(cId, userId, pTitle, pPic, pDesc, pContent);
            System.out.println(post);
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            if (dao.savePost(post)) {
                ServletContext context = request.getServletContext();
                String realpath = context.getRealPath("/images/postImages");
                String path = realpath + File.separator + post.getPost_pic();
                if (helper.saveFile(part.getInputStream(), path)) {
                    System.out.println("photo updated successfully");
                } else {
                    System.out.println("file not saved");
                }
            } else {
                System.out.println("error occured");
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
