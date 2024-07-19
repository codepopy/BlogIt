
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
   UserEntity user = (UserEntity)session.getAttribute("user_entity");
   
   if(user==null){
    response.sendRedirect("index.jsp");
   }
   else{
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>your | Posts</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='CSS/style.css'>
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">
    </head>
    <body class="bg-dark">
        <nav class="navbar navbar-expand-lg navbar-dark border-bottom border-danger" id="mainNav">
            <div class="container-fluid">
                <a class="navbar-brand glitch_font_text text-danger" id="sitename" href="personal_home.jsp"><img src="images/icon.png" width="50px" height="50px" class="me-2">FSociety</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item mx-2">
                            <a class="nav-link active" aria-current="page" href="personal_home.jsp">Home</a>
                        </li>
                        <li class="nav-item  mx-2">
                            <a class="nav-link " href="saved_posts.jsp">Saved Posts</a>
                        </li>
                        <li class="nav-item  mx-2">
                            <a class="nav-link" href="create_post.jsp"><i class="fa-regular fa-pen-to-square"></i> Write</a>
                        </li>

                        <li class="nav-item  mx-2">
                            <a class="nav-link " href="personal_posts.jsp">Your Posts</a>
                        </li>
                    </ul>
                    <a class="nav-link text-light p-2 pe-4 nav-item" href="#"  data-bs-toggle="modal" data-bs-target="#exampleModal" id="modalToggle"><i class="fa-solid fa-user px-2"></i><%= user.getUsername() %></a>
                    <a href="logoutServlet" ><button class="btn btn-warning m-2 " style="box-shadow: 2px 2px 10px #3c0793;">Logout</button></a>
                    <button class="btn btn-dark" id="darkmodebtn"><i class="fa-regular fa-lightbulb text-white" id='modeIcon'></i></button>
                </div>
            </div>
        </nav>
        <!--navbar end-->

        <div class="modal fade" tabindex="-1" id="exampleModal">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title mx-auto" >Your Profile</h4>

                    </div>
                    <div class="modal-body">

                        <img src="images/<%= user.getProfile_pic()%>" class="d-block mx-auto" width="100px" height="100px" style="border-radius:50%;object-fit:contain" id="img">
                        <div class="text-center">
                            <h4><%=user.getUsername()%></h4>
                        </div>
                        <div id="profile_view" >
                            <table class="table">
                                <tr>
                                    <td>User ID</td>
                                    <td><%=user.getUser_id() %></td>
                                </tr>
                                <tr>
                                    <td>Name</td>
                                    <td><%=user.getUsername() %></td>
                                </tr>

                                <tr>
                                    <td>Email</td>
                                    <td><%=user.getEmail() %></td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td><%=user.getGender() %></td>
                                </tr>
                                <tr>
                                    <td>birthday</td>
                                    <td><%=user.getBirthday() %></td>
                                </tr>
                                <tr>
                                    <td>reg-date</td>
                                    <td><%=user.getReg_time() %></td>
                                </tr>
                                <tr>
                                    <td>profile Pic</td>
                                    <td><%=user.getProfile_pic() %></td>
                                </tr>
                            </table>
                        </div>
                        <div id="profile_edit" style="display:none">
                            <h4 class="text-center">Edit</h4>
                            <form action="EditServlet" method="POST" enctype="multipart/form-data" id="updateForm">
                                <table class="table table-borderless">
                                    <tr>
                                        <td>User ID</td>
                                        <td><%=user.getUser_id() %></td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td><input type="text" class="form-control" name="name" value="<%=user.getUsername() %>"></td>
                                    </tr>

                                    <tr>
                                        <td>Email</td>
                                        <td><%=user.getEmail() %></td>
                                    </tr>

                                    <tr>
                                        <td>Gender</td>
                                        <td><%=user.getGender() %></td>
                                    </tr>
                                    <tr>
                                        <td>birthday</td>
                                        <td><input type="date" class="form-control" name="bday" value="<%=user.getBirthday() %>"></td>
                                    </tr>
                                    <tr>
                                        <td>reg-date</td>
                                        <td><%=user.getReg_time() %></td>
                                    </tr>
                                    <tr>
                                        <td>profile Pic <br><span >(please select a square resolution)</span></td>
                                        <td><input type="file" class="form-control" name="file" id="customFile1" onchange="file_changed()"></td>
                                    </tr>
                                    <tr class="text-center">
                                        <td colspan="2"><button class=" btn btn-success btn-block" type="submit">Save</button></td>
                                    </tr>
                                </table>

                            </form>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="profile_toggle_btn">Edit</button>
                    </div>
                </div>
            </div>
        </div>   
        <div class="container w-75">
            <div class="text-danger display-4 py-2">Your Posts</div>

            <%
                PostDao dao = new PostDao(ConnectionProvider.getConnection());
                List<PostsEntity> posts = dao.getPostByUserId(user.getUser_id());
            
                for(PostsEntity p : posts){
                String s = p.getPost_content();
            %>
            <div class="card my-3 bg-dark text-light">
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
                                <a href="show_blog.jsp?post_id=<%= p.getPost_id() %>" class="btn btn-danger shadow glitch_font_text fs-5 mx-2">Read</a>
                                <a href="edit_post.jsp?post_id=<%= p.getPost_id() %>" class="btn btn-danger shadow glitch_font_text fs-5 mx-2">Edit</a>
                                <button class="btn btn-danger shadow glitch_font_text fs-5 mx-2" id="delButton" onclick="delpost(<%=p.getPost_id()%>)">Delete</button>

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
            <div class="text-center"><a href="create_post.jsp" class="btn btn-danger text-white glitch_font_text fs-3">Write more..</a></div>
        </div>
        <%@include file="importsFile.jsp"%>
        
        
        <script>
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
            
            
        </script>
        <script>
            $("#darkmodebtn").on("click", function () {

                if ($("#modeIcon").hasClass("fa-lightbulb")) {
                    $("#modeIcon").removeClass("fa-lightbulb text-white").addClass("fa-moon text-black");

                    $(".bg-dark").removeClass("bg-dark").addClass("bg-light");
                    $(".text-light").removeClass("text-light").addClass("text-dark");
                    $(".nav-link").addClass("text-dark");
                    $(".btn-dark").removeClass("btn-dark").addClass("btn-light");
                } else {
                    $("#modeIcon").removeClass("fa-moon text-black").addClass("fa-lightbulb text-white");
                    $(".bg-light").removeClass("bg-light").addClass("bg-dark");
                    $(".text-dark").removeClass("text-dark").addClass("text-light");
                    $(".nav-link").removeClass("text-dark");
                    $(".btn-light").removeClass("btn-light").addClass("btn-dark");
                }

            })
        </script>
        <script>

            function file_changed() {
                var selectedFile = document.getElementById('#customFile1').files[0];
                var img = document.getElementById('img')

                var reader = new FileReader();
                reader.onload = function () {
                    img.src = this.result
                }
                reader.readAsDataURL(selectedFile);
            }


            $(document).ready(function () {
                let showing_profile_view = true;
                $("#profile_toggle_btn").click(function () {
                    if (showing_profile_view) {
                        $("#profile_edit").show();
                        $("#profile_view").hide();
                        $(this).text("View");
                        showing_profile_view = false;
                    } else
                    {
                        $("#profile_edit").hide();
                        $("#profile_view").show();
                        $(this).text("Edit");
                        showing_profile_view = true;
                    }

                });
                $("#modalToggle").click(function () {
                    $("#profile_edit").hide();
                    $("#profile_view").show();
                    $("#profile_toggle_btn").text("Edit");
                    showing_profile_view = true;
                });
                $("#updateForm").on("submit", function (event) {
                    console.log("trying to update...");
                    event.preventDefault();
                    let frm = new FormData(this);
                    $.ajax({
                        url: "updateUserServlet",
                        type: 'POST',
                        data: frm,
                        success: function (data, textStatus, jqHXR) {
                            Swal.fire(
                                    'You have successfully updated your profile',
                                    'success'
                                    );
                        },
                        error: function (data, textStatus, jqXHR) {
                            console.log(jqXHR);
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'Something went wrong!',
                            });
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script> 
    </body>
</html>
<%
    }
%>