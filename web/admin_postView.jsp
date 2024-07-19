
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.entities.AdminEntity"%>
<%@page import="com.blog.entities.CategoryEntity"%>
<%@page import="com.blog.entities.UserEntity"%>
<%@page import="com.blog.entities.PostsEntity"%>
<%@page import="com.blog.DAO.PostDao" %>
<%@page import="com.blog.DAO.UserDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="java.lang.*" %>
<%@page import="com.blog.helper.ConnectionProvider" %>

<%   
   AdminEntity user = (AdminEntity)session.getAttribute("admin_entity");
   String msg = (String)session.getAttribute("msg");
   if(user==null){
    response.sendRedirect("index.jsp");
   }
   else{
        int postId = Integer.parseInt(request.getParameter("post_id"));
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        PostsEntity p = d.getPostByPostId(postId);
        
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | view</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='CSS/style.css'>
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">
    </head>
    <body class="bg-dark">
        <div class="container  ">
            <div class="row">
                <div class="container-fluid text-light col-md-8 rounded bg-dark" >


                    <%
                     int userId = p.getUser_id();
                    UserDao a = new UserDao(ConnectionProvider.getConnection());
                    UserEntity usr  = a.getUserByID(userId);   
                    %>


                    <div class="container w-75 py-3" id="post-container">
                        <!--main post card included from load_post file-->
                        <div class="d-flex py-3">
                            <img src="images/<%= usr.getProfile_pic()%>" class="p-2" width="55px" height="55px" style="border-radius:50%;object-fit:contain">
                            <div class="px-2">
                                <p class="" style="margin-bottom: 0;font-weight:bold;font-size: 1.2em ">
                                    <%= usr.getUsername()%> 
                                </p>
                                <p class="text-white-50">
                                    <%= p.getPost_date() %>
                                </p>
                            </div>
                        </div>
                        <h1 class="rubik-font display-6 serif_font"><%= p.getPost_title() %></h1>
                        <p class="fs-4 serif_para_font"><%= p.getPost_desc() %></p>
                        <div class="d-flex justify-content-start">
                            <img src="images\postImages\<%= p.getPost_pic() %>" class="img-fluid rounded-start py-3 my-auto mx-auto" alt="..." style="max-height:500px;object-fit:contain">
                        </div>
                        <div class="" style="line-height:2.5em; letter-spacing: 0.09em;">
                            <p class="serif_para_font" style="font-size:1.3rem;"> <%= p.getPost_content() %> </p>
                        </div>
                    </div>


                </div>

                
        </div>

        <div class="py-2">

        </div>
        <%@include file="importsFile.jsp"%>
    </body>
</html>
<%
    }
%>