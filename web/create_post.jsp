
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.entities.UserEntity" %>
<%@page import="com.blog.entities.CategoryEntity" %>
<%@page import="com.blog.DAO.PostDao" %>
<%@page import="java.util.ArrayList" %>
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
        <title>New | Post</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='CSS/style.css'>
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">
      

        <style>
            .plc::-webkit-input-placeholder {
                color: #939694;
            }
        </style>

    </head>
    <body class="bg-dark">
        <nav class="navbar navbar-expand-lg navbar-dark border-bottom border-danger">
            <div class="container w-75">
                <a class="navbar-brand glitch_font_text text-danger" id="sitename" href="personal_home.jsp"><img src="images/icon.png" width="50px" height="50px" class="me-2">FSociety</a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav  ms-auto ps-5">
                        <li class="nav-item mx-1">
                            <a class="nav-link text-light  mt-2"  href="personal_home.jsp">Home</a>
                        </li>

                        <li class="nav-item dropdown-center text-light ">
                            <a class="nav-link dropdown-toggle"  href="#" data-bs-toggle="dropdown" aria-expanded="false"><img src="images/<%= user.getProfile_pic()%>" height="40px" width="40px" style="border-radius:50%;object-fit:contain"> </a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-lg-start px-4 fs-6 " style="font-size: 0.5em" >
                                <li class="fs-5 py-2 text-center"><b><%= user.getUsername() %></b></li>
                                <li class="fs-6 py-2"><%= user.getEmail() %></li>
                                <li class="py-2">Settings</li>
                                <li class="py-2">Membership</li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item py-2 text-center" href="logoutServlet">Sign Out</a></li>
                            </ul>
                        </li>
                        <li><button class="btn btn-dark mt-2" id="darkmodebtn"><i class="fa-regular fa-lightbulb text-white" id='modeIcon'></i></button></li>
                    </ul>
                </div>        
            </div>
        </nav>
        <!--navbar end-->


        <div class="container w-75 pt-3" >




            <form id="addPostForm" action="AddPostServlet" method="POST">
                <div class="mb-3">

                    <select class="form-select scroll-bar text-light bg-dark border-danger" name="category_id">
                        <option select diabled>---select a category---</option>
                        <% 
                            PostDao dao = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<CategoryEntity> list = dao.getAllCategory();
                            for(CategoryEntity c : list){
                        %>

                        <option class="py-2" value="<%= c.getCategory_id() %>"><%= c.getCategory_name() %></option>

                        <% 
                            }
                        %>
                    </select>

                </div>
                <div class="mb-3">

                    <input name="post_title" type="text" autocomplete="off" class="form-control form-control-lg fs-1 serif_font bg-dark text-light border-0 plc" id="PostTitle" placeholder="Title">

                </div>
                <div class="mb-3">

                    <input name="post_description" autocomplete="off" type="text" class="form-control form-control-lg fs-3 serif_font bg-dark text-light border-0 plc" id="PostDesc" placeholder="Description..">

                </div>
                <div class="mb-3">

                    <div class="mb-4 d-flex justify-content-center">
                        <img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg" class="rounded"
                             alt="example placeholder" id="img" style="width: 400px; height: 400px;" />
                    </div>
                    <div class="d-flex justify-content-center">
                        <div class="btn btn-danger btn-rounded">
                            <label class="form-label text-white m-1" for="customFile1">add image</label>
                            <input type="file" class="form-control d-none " name="post_pic" onchange="file_changed()" id="customFile1" />
                        </div>
                    </div>

                    <!--                    <label for="formFile" class="form-label text-secondary">Images make great blogs!</label>
                                        <input name="post_pic" class="form-control" type="file" id="formFile" >-->
                </div>
                <div class="mb-3 serif_para_font">

                    <textarea name="post_content" type="textarea" class="form-control fs-4 bg-dark text-light border-0 plc" id="exampleInputPassword1" placeholder="Tell your story..." style="height:400px;font-family: 'PT Serif', serif"></textarea>
                </div>
                <div class="text-center">

                    <button type="submit" class="btn btn-danger mb-3 glitch_font_text fs-2">Publish</button>
                </div>
            </form>
        </div>


        <%@include file="importsFile.jsp"%>
        
        <script>
                $("#darkmodebtn").on("click", function (){
                    
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
                var selectedFile = document.getElementById('customFile1').files[0];
                var img = document.getElementById('img')

                var reader = new FileReader();
                reader.onload = function () {
                    img.src = this.result
                }
                reader.readAsDataURL(selectedFile);
            }


            $(document).ready(function () {

                $("#addPostForm").on("submit", function (event) {
                    event.preventDefault();
                    console.log("clicked on submit..")
                    var a = $("#exampleInputPassword1").val();
                    $("#exampleInputPassword1").val(processContent(a));
                    Swal.fire({
                        title: 'Do you want to save the changes?',
                        showDenyButton: true,
                        showCancelButton: true,
                        confirmButtonText: 'Save',
                        denyButtonText: `Don't save`,
                    }).then((result) => {

                        if (result.isConfirmed) {
                            let form = new FormData(this);

                            $.ajax({
                                url: "AddPostServlet",
                                type: "POST",
                                data: form,
                                success: function (data, textStatus, jqXHR) {
                                    Swal.fire(
                                            'Good job!',
                                            'You just posted a new blog!',
                                            'success'
                                            )
                                    $("#addPostForm").trigger("reset");
                                    $("#img").attr("src","https://mdbootstrap.com/img/Photos/Others/placeholder.jpg");

                                },

                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.log(jqXHR);
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Oops...',
                                        text: 'Something went wrong!',
                                        footer: '<a href="">Why do I have this issue?</a>'
                                    })

                                },
                                processData: false,
                                contentType: false

                            })
                        } else if (result.isDenied) {
                            Swal.fire('Changes are not saved', '', 'info')
                        }
                    })









                })

            })


        </script>
           
        <script>
             function processContent(content){
                return content.split('\n').join('<br>');
            }
        </script>
            
    </body>
</html>
<% } %>
