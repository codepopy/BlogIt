<%@page import="com.blog.entities.CategoryEntity"%>
<%@page import="com.blog.entities.UserEntity"%>
<%@page import="com.blog.entities.PostsEntity"%>
<%@page import="com.blog.DAO.PostDao" %>
<%@page import="com.blog.DAO.UserDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="java.lang.*" %>
<%@page import="com.blog.helper.ConnectionProvider" %>
<%@page errorPage="error_page.jsp" %>




<% 
    
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    UserEntity user = (UserEntity)session.getAttribute("user_entity");
    List<PostsEntity> posts = null;
    int categoryId = Integer.parseInt(request.getParameter("c_id"));
    
    if(categoryId==0){
        posts = d.getAllPost();
    }else{
        posts = d.getPostByCategoryId(categoryId);
    }
    if(posts.size()==0){
        out.println("<h3 class='text-center py-4'>No posts in this category</h3>");
        return;
    }

    for(PostsEntity p : posts){
            String s = p.getPost_content();
%>
<div class="card mb-3 bg-dark text-light">
    <div class="row g-0">

        <div class="col-md-8">
            <div class="card-body my-auto" style="min-height:200px">
                <%
                    int userId = p.getUser_id();
                    int catId = p.getCategory_id();
                    
                    UserDao a = new UserDao(ConnectionProvider.getConnection());
                    PostDao b = new PostDao(ConnectionProvider.getConnection());
                            
                    UserEntity usr  = a.getUserByID(userId);
                    String cat = b.getCategoryById(catId);
                    
                %>
                <div class="d-flex" >
                    <img src="images/<%= usr.getProfile_pic()%>" class="p-2" width="40px" height="40px" style="border-radius:50%;object-fit:contain">
                    <p class="card-text my-auto"><small class="text-tertiary"><%= usr.getUsername() %></small><span class="badge rounded-pill text-bg-success mx-3"> <%= cat %></span></p>
                </div>

                <h3 class="card-title serif_font display-6"><%= p.getPost_title() %></h3>
                <p class="card-text serif_para_font fs-5"><%= p.getPost_desc()%></p>
                <p class="card-text"><small class="text-white-50"><%= p.getPost_date()%></small></p>
                <div class="d-flex">
                    <a href="show_blog.jsp?post_id=<%= p.getPost_id() %>" class="btn btn-danger shadow glitch_font_text fs-5">Read More</a>
                    
                    <%
                        if(d.isPostSaved(p.getPost_id(),user.getUser_id())){
                    %>
                    <a href="#" class="link-danger ms-auto px-2 text-white-50 pt-2" onclick="deletePost(<%= p.getPost_id() %>)"><i class="fa-solid fa-bookmark text-danger"></i></a>
                    <%
                        }
                        else{
                    %>
                    <a href="#" class="link-danger ms-auto px-2 text-white-50 pt-2" onclick="savePost(<%= p.getPost_id() %>,this)"><i class="fa-regular fa-lg fa-bookmark"></i></a>
                        
                    
                    <%
                        }
                    %>
                    
                    
                    <%
                        if(d.isPostLikedByUser(p.getPost_id(),user.getUser_id())){
                        int pid = p.getPost_id();
                    %>
                    <a href="" class="link-danger ms-2 px-2 text-white-50 pt-2" onclick="unlikepost(<%=p.getPost_id()%>,this)"><i class="fa-solid fa-thumbs-up text-danger"></i></a><span class="pt-2 opacity-50"><%=d.getLikeCountByPostId(pid)%></span>
                    <%
                        }
                        else{
                        int pid = p.getPost_id();
                    %>
                    <a href="" class="link-danger ms-2 px-2 text-white-50 pt-2" onclick="likepost(<%=p.getPost_id()%>,this)"><i class="fa-regular fa-thumbs-up"></i></a><span class="pt-2 opacity-50" ><%=d.getLikeCountByPostId(pid)%></span>
                        
                    
                    <%
                        }
                    %>
                    
                    
                </div>

            </div>
        </div>
        <div class="col-md-4 my-auto d-flex justify-content-center">
            <img src="images\postImages\<%= p.getPost_pic() %>" class="img-fluid rounded-start p-3 my-auto mx-auto" alt="..." style="max-height:250px;object-fit:contain">
        </div>
    </div>
</div>

<% 
    }
%>
<script>

    function savePost(postId,obj) {

        $.ajax({
            url: "savePostServlet",
            type: "POST",
            data: {post_id: postId},
            success: function (data, textStatus, jqXHR) {
                if (data.trim() == "success") {
                    Swal.fire(
                            'post saved',
                            '',
                            'success'
                            )
                    $(obj).html("<i class='fa-solid fa-bookmark text-danger'></i>");
                    }
                    else{
                        Swal.fire(
                            'post saved',
                            '',
                            'success'
                            )
                    }
                

            },
            error: function (data, textStatus, jqXHR) {
                console.log(jqXHR);
            }
        });
    }
    
    
    function likepost(postid,obj){
        $.ajax({
            url:"likePostServlet",
            type:"POST",
            data:{post_id:postid,action:"like"},
            success: function (data, textStatus, jqXHR){
                console.log(data);
                $(obj).html("<i class='fa-solid fa-thumbs-up text-danger'></i>");
            },
            error: function(data, textStatus, jqXHR){
                console.log(jqXHR);
            }
            
        });
        
    }
    
    function unlikepost(postid,obj){
        $.ajax({
            url:"likePostServlet",
            type:"POST",
            data:{post_id:postid,action:"unlike"},
            success: function (data, textStatus, jqXHR){
                console.log(data);
                $(obj).html("<i class='fa-regular fa-thumbs-up'></i>");
            },
            error: function(data, textStatus, jqXHR){
                console.log(jqXHR);
            }
            
        });
        
    }
    
    
    
</script> 