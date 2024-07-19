
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
        <nav class="navbar navbar-expand-lg navbar-dark border-bottom border-danger" id="mainNav">
            <div class="container-fluid">
                <a class="navbar-brand glitch_font_text text-danger" id="sitename" href="personal_home.jsp"><img src="images/icon.png" width="50px" height="50px" class="me-2">FSociety</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item mx-2">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
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
                            <form action="updateUserServlet" method="POST" enctype="multipart/form-data" id="updateForm">
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


        <div class="container  mt-4">
            <div class="row">
                <div class="container-fluid bg-dark col-md-8 rounded">
                    <!--                   category menu-->
                    <div class="navbar mx-auto my-4  shadow-lg px-3 sticky-top bg-dark" style="border-radius: 15px;">


                        <ul class="nav d-flex flex-nowrap overflow-x-scroll scroll-bar" >
                            <li class="nav-item" ><a class="nav-link btn btn-light c-link active" onclick="getPost(0, this)" href="#">All</a></li>
                                <% 
                                    UserDao uDao = new UserDao(ConnectionProvider.getConnection());
                                    PostDao dao = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<CategoryEntity> list = dao.getAllCategory();
                                     for(CategoryEntity c : list){
                                %>

                            <li class="nav-item pb-2"  ><a class=" btn btn-dark c-link text-danger" onclick="getPost(<%= c.getCategory_id() %>, this)" href="#"><%= c.getCategory_name() %></a></li>

                            <% 
                                }
                            %>
                        </ul>

                    </div>
                    <div  class="d-flex justify-content-center p-4" id="loader-container" >
                        <div class="spinner-border text-primary shadow-lg" id="loader" style="width: 3rem; height: 3rem;" role="status">

                        </div>
                    </div>

                    <div class="text-light" id="post-container">
                        <!--main post card included from load_post file-->

                    </div>


                </div>
                <%
                    List<PostsEntity> p = dao.getAllPost();
                    int min=0;
                    int max= p.size()-1;
                      
                %>
                <div class="container-fluid bg-dark col-md-4 sticky-top text-light border-start border-danger" style="height:100%">
                    <div class="border-bottom border-danger">
                        <div class="fs-1 py-5 pb-2 ps-2 text-danger glitch_font_text">Staff picks</div>
                        <%
                            for(int i=0; i<4;i++){
                            int b = (int)(Math.random()*(max-min+1)+min);
                            PostsEntity post = p.get(b);
                            int userId = post.getUser_id();
                            UserEntity usr = uDao.getUserByID(userId);
                        %>
                        <a href="show_blog.jsp?post_id=<%= post.getPost_id() %>" class="py-3" style="text-decoration:none"> 
                            <div class="card bg-dark border-0" >
                                <div class="card-body">

                                    <h6 class="card-subtitle mb-2 glitch_font_text fs-6 text-light"><img src="images/<%= usr.getProfile_pic()%>" class="me-2" width="25px" height="25px" style="border-radius:50%;object-fit:contain"><%=usr.getUsername()%></h6>
                                    <h6 class="card-title text-light fs-5 bold"><%= post.getPost_title()%></h6>

                                </div>
                            </div></a>
                            <%
                                }
                            %>
                    </div>

                    <div class="p-3">
                        <h5 class="text-danger glitch_font_text fs-2">Recommended topics</h5>
                        <%
                            int minC = 0;
                            int maxC = list.size()/2;
                            int b = (int)(Math.random()*(maxC-minC+1)+minC);
                            for(int i=0;i<2;i++){
                            
                        %>

                        <%
                            for(int j=0;j<3;j++){
                                    
                            CategoryEntity c = list.get(b);
                        %>
                        <button type="button" class="btn btn-danger rounded-pill py-2 my-2" onclick="getPost(<%= c.getCategory_id() %>, this)"><%=c.getCategory_name()%></button>


                        <%b++;
                            } 
                                
                        %>




                        <%
                            }
                        %>
                    </div>

                    <div class="py-2 border-top border-danger text-center">
                        <div class="text-white-50">follow us on</div>
                        <div class="py-2 text-danger">
                            <a href="https://www.twitter.com" target="_blank"><i class="fa-brands fa-twitter fa-lg px-3"></i></a>
                            <a href="https://www.facebook.com" target="_blank"><i class="fa-brands fa-facebook fa-lg px-3"></i></a>
                            <a href="https://www.instagram.com" target="_blank"><i class="fa-brands fa-instagram fa-lg px-3"></i></a>
                            <a href="https://www.linkedin.com" target="_blank"><i class="fa-brands fa-linkedin fa-lg px-3"></i></a>
                            <a href="https://www.youtube.com" target="_blank"><i class="fa-brands fa-youtube fa-lg px-3"></i></a>
                        </div>
                        <div class="text-white-50" style="font-size: 12px">
                        © fsociety.com 2023
                        All rights reserved.<br>
                        By accessing and using this website, you agree to abide by all copyright notices and restrictions.<br> Thank you for respecting our intellectual property.
                        </div>
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
        <script>
            function getPost(catId, ob) {
                $(".c-link").removeClass("active")
                $(ob).addClass('active');
                $.ajax({

                    url: "load_post.jsp",
                    data: {c_id: catId},
                    success: function (data, textStatus, jqXHR) {

                        $('#loader-container').removeClass("p-4");
                        $('#loader').hide();
                        $('#post-container').html(data);
                    }
                })


            }
            $(document).ready(function () {
                let allPostRef = $('.c-link')[0]
                getPost(0, allPostRef)
            })
        </script>



    </body>
</html>
<% }%>
