
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

        
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='CSS/style.css'>
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">
    </head >
    <body class="bg-dark">



        <nav class="navbar navbar-expand-lg navbar-dark border-bottom border-danger sticky-top bg-dark" id="mainNav">
            <div class="container-fluid">
                <a class="navbar-brand glitch_font_text text-danger" id="sitename" href="admin_home.jsp"><img src="images/icon.png" width="50px" height="50px" class="me-2">FSociety</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#user-section" >Users</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#Posts-section">Posts</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#category-section">Category</a>
                        </li>
                    </ul>
                    <a class="nav-link text-light p-2 pe-4 nav-item" href="#"  data-bs-toggle="modal" data-bs-target="#exampleModal" id="modalToggle"><i class="fa-solid fa-user px-2"></i><%= user.getAdmin_username() %></a>
                    <a href="logoutServlet" ><button class="btn btn-warning m-2 " style="box-shadow: 2px 2px 10px #3c0793;">Logout</button></a>
                    <button class="btn btn-dark" id="darkmodebtn"><i class="fa-regular fa-lightbulb text-white" id='modeIcon'></i></button>
                </div>
            </div>
        </nav>

        <div class="container">
            <section id="user-section">
                <h1 class="text-center text-danger glitch_font_text py-3">Users</h1>
                <table class="table text-light border-danger">
                    <tr>
                        <th>user ID</th>
                        <th>username</th>
                        <th>email</th>
                        <th>birthday</th>
                        <th>gender</th>
                        <th>registration</th>
                        <th>profile pic</th>
                        <th>action</th>

                    </tr>
                    <%
                        UserDao usrdao = new UserDao(ConnectionProvider.getConnection());
                        ArrayList<UserEntity> usr = usrdao.getAllUser();
                        for(UserEntity u : usr){
                    %>
                    <tr class="text-white-50">
                        <th scope="row"><%=u.getUser_id()%></th>
                        <td><%=u.getUsername()%></td>
                        <td><%=u.getEmail()%></td>
                        <td><%=u.getBirthday()%></td>
                        <td><%=u.getGender()%></td>
                        <td><%=u.getReg_time()%></td>
                        <td><%=u.getProfile_pic()%></td>
                        <td><button type="button" class="btn btn-danger" onclick="delUser(<%=u.getUser_id()%>)">Remove user</button></td>

                    </tr>

                    <%
                        }
                    %>
                </table>
            </section>
        </div>

        <div class="container pt-3">
            <section id="Posts-section">
                <h1 class="text-center text-danger glitch_font_text py-3 pt-4">Posts</h1>
                <table class="table text-light border-danger">
                    <tr>
                        <th>category ID</th>
                        <th>post ID</th>
                        <th>user ID</th>
                        <th>post title</th>
                        <th>post pic</th>
                        <th>post date</th>
                        <th>action</th>

                    </tr>
                    <%
                        PostDao d = new PostDao(ConnectionProvider.getConnection());
                        List<PostsEntity> posts = d.getAllPost();
                        for(PostsEntity u : posts){
                    %>
                    <tr class="text-white-50">
                        <th scope="row"><%=u.getCategory_id()%></th>
                        <td><%=u.getPost_id()%></td>
                        <td><%=u.getUser_id()%></td>
                        <td><%=u.getPost_title()%></td>
                        <td><%=u.getPost_pic()%></td>
                        <td><%=u.getPost_date()%></td>
                        <td><a href="admin_postView.jsp?post_id=<%= u.getPost_id() %>" class="btn btn-danger mx-2">View Post</a><button onclick="delpost(<%=u.getPost_id()%>)" class="btn btn-danger">delete</button></td>

                    </tr>

                    <%
                        }
                    %>
                </table>
            </section>
        </div>

        <div class="container pt-3">
            <section id="category-section">
                <h1 class="text-center text-danger glitch_font_text py-3 pt-4">Categories</h1>
                <table class="table text-light border-danger">
                    <tr>
                        <th>
                            category ID
                        </th>
                        <th>
                            category name
                        </th>
                        <th>action</th>
                    </tr>
                    <%
                PostDao da = new PostDao(ConnectionProvider.getConnection());
                ArrayList<CategoryEntity> cats = da.getAllCategory();
                for(CategoryEntity u : cats){
                    %>
                    <tr class="text-white-50">
                        <th scope="row"><%=u.getCategory_id()%></th>
                        <td><%=u.getCategory_name()%></td>
                        <td><button type="button" class="btn btn-danger" onclick="catDel(<%=u.getCategory_id()%>)">Delete</button></td>

                    </tr>

                    <%
                        }
                    %>
                    <tr>
                        <td colspan="3" class="text-center"><button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#catModal"><i class="fa-regular fa-plus fa-beat px-2"></i></button></td>
                    </tr>
                </table>
            </section>>
        </div>
        <!-- category add modal -->
        <div class="modal fade" id="catModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title glitch_font_text text-center ms-auto">add new category</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <form action="addCategoryServlet" method="POST" id="category-form">
                            <input type="text" name="name" id="cat_name" class="form-control border-danger" placeholder="category Name.." >
                            <input class="btn btn-danger glitch_font_text fs-4 px-3 m-2" type="submit" id="addbtn" value="add">
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <%@include file="importsFile.jsp"%>
        
        <script>
            $("#darkmodebtn").on("click", function () {

                if ($("#modeIcon").hasClass("fa-lightbulb")) {
                    $("#modeIcon").removeClass("fa-lightbulb text-white").addClass("fa-moon text-black");

                    $(".bg-dark").removeClass("bg-dark").addClass("bg-light");
                    $(".text-light").removeClass("text-light").addClass("text-dark");
                    $(".nav-link").addClass("text-dark");
                    $(".btn-dark").removeClass("btn-dark").addClass("btn-light");
                    $(".text-white-50").removeClass("text-white-50").addClass("text-black-50");
                } else {
                    $("#modeIcon").removeClass("fa-moon text-black").addClass("fa-lightbulb text-white");
                    $(".bg-light").removeClass("bg-light").addClass("bg-dark");
                    $(".text-dark").removeClass("text-dark").addClass("text-light");
                    $(".nav-link").removeClass("text-dark");
                    $(".btn-light").removeClass("btn-light").addClass("btn-dark");
                    $(".text-black-50").removeClass("text-black-50").addClass("text-white-50");
                }

            })
        </script>
        
        <script>
            $(document).ready(function () {
            <%
                if(msg!=null&&msg.equals("success")){
            
            %>
                Swal.fire({
                    icon: 'success',
                    title: 'success',
                    text: 'new category added!'

                });
            <%
                session.removeAttribute("msg");
                }
            %>
            });
            
            
            function delpost(postId) {
                Swal.fire({
                    title: 'are you sure you want to delete this post?',
                    showDenyButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'yes',
                    denyButtonText: `no`
                }).then((result) => {

                    if (result.isConfirmed) {
                        console.log(postId);
                        $.ajax({
                            url: "deletePostServlet",
                            type: "POST",
                            data: {post_id: postId},
                            success: function (data, textStatus, jqXHR) {

                                if (data.trim() == "success") {
                                    Swal.fire(
                                            'done!',
                                            'your post was deleted!',
                                            'success'
                                            );
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Oops...',
                                        text: 'Something went wrong!',
                                        footer: 'Post was not deleted..'
                                    });

                                }

                            },

                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(jqXHR);
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: 'Something went wrong!',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                });

                            }
                            
                        });
                    } else if (result.isDenied)
                    {
                        Swal.fire('Changes are not saved', '', 'info');
                    }

                });
            }
            
            function delUser(userId) {
                Swal.fire({
                    title: 'are you sure you want to delete this user? it will also delete all related data!!',
                    showDenyButton: true,
                    showCancelButton: true,
                    confirmButtonText: 'yes',
                    denyButtonText: `no`
                }).then((result) => {

                    if (result.isConfirmed) {
                       
                        $.ajax({
                            url: "delUserServlet",
                            type: "POST",
                            data: {user_id: userId},
                            success: function (data, textStatus, jqXHR) {

                                if (data.trim() == "success") {
                                    Swal.fire(
                                            'done!',
                                            'The user was deleted!',
                                            'success'
                                            );
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Oops...',
                                        text: 'Something went wrong!',
                                        footer: 'User was not deleted..'
                                    });

                                }

                            },

                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(jqXHR);
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: 'Something went wrong!',
                                    footer: '<a href="">Why do I have this issue?</a>'
                                });

                            }
                            
                        });
                    } else if (result.isDenied)
                    {
                        Swal.fire('Changes are not saved', '', 'info');
                    }

                });
            }
            
            
            
            
            
            
            

            function catDel(id) {
                console.log(id)
                $.ajax({
                    url: "catDelServlet",
                    type: "POST",
                    data: {idNum: id},
                    success: function (data, textStatus, jqXHR) {
                        if (data.trim() == "success") {

                            Swal.fire({
                                icon: 'success',
                                title: 'success',
                                text: ' category deleted!'

                            }).then((result) => {
                                if (result.isConfirmed) {
                                    location.reload();
                                }
                            });
                        } else {
                            location.reload();
                            Swal.fire({
                                icon: 'error',
                                title: 'failed',
                                text: ' category not deleted!'

                            }).then((result) => {
                                if (result.isConfirmed) {
                                    location.reload();
                                }
                            });
                        }
                        console.log(data);

                    }


                })

            }
        </script>




    </body>
</html>
<%
    }
%>
