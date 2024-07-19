
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
   
        int postId = Integer.parseInt(request.getParameter("post_id"));
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        PostsEntity p = d.getPostByPostId(postId);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>personal | home</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='CSS/style.css'>
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">

        <style>
            .scroll-bar::-webkit-scrollbar {
                width: 10px;
                height: 6px;


            }
            .scroll-bar:hover::-webkit-scrollbar {
                width: 10px;
                height: 8px;

            }

            /* Track */
            .scroll-bar::-webkit-scrollbar-track {
                padding: 8px;
                border-radius: 6px;
                visibility: hidden;

            }

            /* Handle */
            .scroll-bar::-webkit-scrollbar-thumb {
                /*                background: radial-gradient(circle, rgba(242,16,100,0.7008053221288515) 0%, rgba(102,16,242,0.6755952380952381) 100%);*/
                background:red;
                border-radius: 10px;
                visibility: hidden;
                transition: visibility 2s;
            }
            .scroll-bar:hover::-webkit-scrollbar-thumb {

                visibility: visible;
            }



        </style>
    </head>
    <body class="bg-dark">
        <nav class="navbar navbar-expand-lg navbar-dark border-bottom border-danger sticky-top bg-dark" id="mainNav">
            <div class="container w-75">
                <a class="navbar-brand glitch_font_text text-danger" id="sitename" href="personal_home.jsp"><img src="images/icon.png" width="50px" height="50px" class="me-2">FSociety</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item px-2">
                            <a class="nav-link active" aria-current="page" href="personal_home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="create_post.jsp"><i class="fa-regular fa-pen-to-square"></i> Write</a>
                        </li>

                        <li class="nav-item dropdown text-light px-2">
                            <a class="nav-link dropdown-toggle"  href="#" data-bs-toggle="dropdown" aria-expanded="false"><img src="images/<%= user.getProfile_pic()%>" height="30px" width="30px" style="border-radius:50%;object-fit:contain"> </a>
                            <ul class="dropdown-menu dropdown-menu-lg-start px-4 fs-6 z-0 " style="font-size: 0.5em" >
                                <li class="fs-5 py-2 text-center"><b><%= user.getUsername() %></b></li>
                                <li class="fs-6 py-2"><%= user.getEmail() %></li>
                                <li class="py-2">Settings</li>
                                <li class="py-2">Membership</li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item py-2 text-center" href="logoutServlet">Sign Out</a></li>
                            </ul>
                        </li>
                        <li><button class="btn btn-dark" id="darkmodebtn"><i class="fa-regular fa-lightbulb text-white" id='modeIcon'></i></button></li>
                    </ul>


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
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
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
                        
                        <h1 class="rubik-font display-6 serif_font"><%= p.getPost_title() %></h1>
                        <p class="fs-4 serif_para_font opacity-50"><%= p.getPost_desc() %></p>
                        
                        <div class="d-flex py-3">
                            <img src="images/<%= usr.getProfile_pic()%>" class="p-2" width="60px" height="60px" style="border-radius:50%;object-fit:contain">
                            <div class="px-2">
                                <p class="" style="margin-bottom: 0;font-size: 1.2em ">
                                    <%= usr.getUsername()%> 
                                </p>
                                <p class="text-light">
                                    published on : <%= p.getPost_date() %>
                                </p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-start">
                            <img src="images\postImages\<%= p.getPost_pic() %>" class="img-fluid rounded-start py-3 my-auto mx-auto" alt="..." style="max-height:500px;object-fit:contain">
                        </div>
                        <div class="" style="line-height:2.5em; letter-spacing: 0.09em;">
                            <p class="serif_para_font" style="font-size:1.3rem;"> <%= p.getPost_content() %> </p>
                        </div>
                    </div>

                    <div class="container border-top border-danger py-4 " id="comment-section">
                        <h4>Comments</h4>
                        
                        <div id="all-comments" class="py-4">

                        </div>

                        <input type="text" class="form-control bg-dark text-light" id="comnt" placeholder="add a comment..."/>
                        <div class="text-center"><button class="btn btn-danger my-2 " id="cmnt-btn">comment</button></div>
                        
                    </div>

                </div>

                

            </div>
        </div>

        <div class="py-2">

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
                } else {
                    $("#modeIcon").removeClass("fa-moon text-black").addClass("fa-lightbulb text-white");
                    $(".bg-light").removeClass("bg-light").addClass("bg-dark");
                    $(".text-dark").removeClass("text-dark").addClass("text-light");
                    $(".nav-link").removeClass("text-dark");
                    $(".btn-light").removeClass("btn-light").addClass("btn-dark");
                }

            });
            
            $("#cmnt-btn").on("click", function(){
                console.log("trying..")
                var comment = $("#comnt").val();
                $.ajax({
                    url:"addCommentServlet",
                    type:"POST",
                    data:{comment:comment,post_id:<%=postId%>},
                    success: function (data, textStatus, jqXHR) {
                       if(data.trim() === "success")
                           alert("comment added");
                       else
                           alert("comment not added");
                    },
                    error:function (data, textStatus, jqXHR) {
                        console.log(jqXHR);
                    }
                    
                });
            });
            
            
            $(document).ready(function (){
                
                $.ajax({

                    url: "comment.jsp",
                    data: {p_id: <%=postId%>},
                    success: function (data, textStatus, jqXHR) {
                        
                        $('#all-comments').html(data);
                    }
                })
                
                
            })



        </script>

        <script>

            function file_changed() {
                var selectedFile = document.getElementById('customFile1').files[0];
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

            });
        </script> 

    </body>
</html>
<% }%>
