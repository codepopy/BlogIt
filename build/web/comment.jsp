
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.entities.CategoryEntity"%>
<%@page import="com.blog.entities.UserEntity"%>
<%@page import="com.blog.entities.PostsEntity"%>
<%@page import="com.blog.entities.CommentEntity"%>
<%@page import="com.blog.DAO.commentDAO"%>
<%@page import="com.blog.DAO.PostDao" %>
<%@page import="com.blog.DAO.UserDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="java.lang.*" %>
<%@page import="com.blog.helper.ConnectionProvider" %>
<%@page errorPage="error_page.jsp" %>


<%
    int post_id = Integer.parseInt(request.getParameter("p_id"));
    commentDAO dao = new commentDAO(ConnectionProvider.getConnection());
    UserDao udao = new UserDao(ConnectionProvider.getConnection());
    List<CommentEntity> com = dao.getComments(post_id);
    
    for(CommentEntity c : com){
    UserEntity usr = udao.getUserByID(c.getUser_id());
%>
<div class="card container bg-transparent border-start mb-4">
    <div class="card-body">
    <div class="card-title text-light"><img src="images/<%= usr.getProfile_pic()%>" class="p-2" width="40px" height="40px" style="border-radius:50%;object-fit:contain"><%= usr.getUsername()%></div>
    <div class="fs-5 text-light card-text">
        <%=c.getComment_content()%>
    </div>
    </div>
    <span class=" text-light card-footer"><%=c.getComment_date()%></span>
</div>

<%
    }
%>