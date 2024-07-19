<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
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
    
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    List<PostsEntity> posts = d.getAllPost();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>fsociety</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='CSS/style.css'>
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">
        <style>
            .button-red-hover:hover{
                background: rgb(202,34,34);
                transition: 0.3s;
            }

            .form-control::-webkit-input-placeholder {
                color: #9fa19f;
            }
        </style>
    </head>

    <body class="bg-dark">
        <!--website coding start-->
        <!--navbar-->



        <!--        banner-->
        <div class="container-fluid bg-dark" >
            <div class="p-5 "> 
                <div class="container-fluid text-light text-center text-danger">
                    <h1 class="display-2 glitch_font txt-red ">FSociety</h1>
                    <h2 class="display-6 glitch_font_text txt-red ">Share your mind without any restraint</h2>
                    <p class="glitch_font_text fs-3 text-center">
                        The enemy is self-censorship. In a free society the biggest danger is that you're afraid to the point where you censor yourself.
                    </p>
                    <a href="register_page.jsp"><button class="btn btn-warning m-2 m-" ><i class="fa fa-user-plus fa-fade px-2"></i>get started</button></a>
                    <button class="btn btn-warning "  data-bs-toggle="modal" data-bs-target="#loginModal"><i class="fa fa-user-circle-o fa-bounce px-2"></i>login</button>
                </div>
            </div>
        </div>

        <!--        navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark border-top border-bottom border-danger sticky-top bg-dark" id="mainNav">
            <div class="container">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                        <li class="nav-item px-4">
                            <a class="button-red-hover nav-link active rounded" aria-current="page" href="#" >Home</a>
                        </li>
                        <li class="nav-item px-4 ">
                            <a class="nav-link button-red-hover rounded" href="#contactUs">Contact Us</a>
                        </li>
                        <li class="nav-item px-4">
                            <a class="nav-link button-red-hover rounded" href="#aboutUs">About Us</a>
                        </li>

                    </ul>
                    <button class="btn btn-dark" id="darkmodebtn"><i class="fa-regular fa-lightbulb text-white" id='modeIcon'></i></button>
                </div>
            </div>
        </nav>

        <!--        cards-->
        <div class="container">
            <div class="text-danger display-6 ms-2 mt-2">trending..</div>
            <div class="row">
                <%
                    PostsEntity p = null;
                    
                    for(int i=0;i<3;i++){
                      p = posts.get(i); 
                      String desc = p.getPost_desc();
                      if(desc.length() > 70)
                            desc = desc.substring(0,70);
                %>
                <div class="col-md-4">
                    <div class="card my-2 bg-dark text-light border-0" >
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getPost_title() %></h5>
                            <p class="card-text" ><%= desc %> . . .</p>
                            <a href="#" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#loginModal">Read more..</a>
                        </div>
                    </div>
                </div>
                <%
                    
                    }
                %>

                <div class="row">
                    <%
                    
                    
                        for(int i=3;i<6;i++){
                          p = posts.get(i);  
                          String desc = p.getPost_desc();
                          if(desc.length() > 70)
                                desc = desc.substring(0,70);
                    %>
                    <div class="col-md-4">
                        <div class="card my-2 bg-dark text-light border-0" >
                            <div class="card-body">
                                <h5 class="card-title"><%= p.getPost_title() %></h5>
                                <p class="card-text" ><%= desc %>. . .</p>
                                <a href="#" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#loginModal">Read more..</a>
                            </div>
                        </div>
                    </div>
                    <%
                    
                        }
                    %>

                </div>        

            </div>
        </div>


        <!--        login modal-->
        <div class="modal fade" id="loginModal">
            <div class="modal-dialog">
                <div class="modal-content p-5 container">
                    <!--                    login module code-->

                    <div class="fs-4 mx-auto mb-4 glitch_font" 
                         >Welcome back</div>
                    <%@include file="login.jsp"%>  <%-- login module included --%>
                </div>
            </div>
        </div>


        <section class="mb-4 border-top border-danger mt-5 container" id="contactUs">

            <!--Section heading-->
            <h2 class="h1-responsive font-weight-bold text-center text-danger my-4">Contact us</h2>
            <!--Section description-->
            <p class="text-center w-responsive mx-auto mb-5 text-light">Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within
                a matter of hours to help you.</p>

            <div class="row text-light">

                <!--Grid column-->
                <div class="col-md-9 mb-md-0 mb-5">
                    <form id="contact-form" name="contact-form" action="ContactServlet" method="POST">

                        <!--Grid row-->
                        <div class="row">

                            <!--Grid column-->
                            <div class="col-md-6 p-4">
                                <div class="md-form mb-0">
                                    <input type="text" id="name" name="name" class="form-control bg-dark border border-danger text-light p-3" placeholder="Your Name">

                                </div>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-md-6 p-4">
                                <div class="md-form mb-0">
                                    <input type="text" id="email" name="email" class="form-control bg-dark border border-danger text-light p-3" placeholder="Email">

                                </div>
                            </div>
                            <!--Grid column-->

                        </div>
                        <!--Grid row-->

                        <!--Grid row-->
                        <div class="row">
                            <div class="col-md-12 p-4">
                                <div class="md-form mb-0">
                                    <input type="text" id="subject" name="subject" class="form-control bg-dark border border-danger text-light p-3" placeholder="Subject">

                                </div>
                            </div>
                        </div>
                        <!--Grid row-->

                        <!--Grid row-->
                        <div class="row">

                            <!--Grid column-->
                            <div class="col-md-12 p-4">

                                <div class="md-form">
                                    <textarea type="text" id="message" name="message" rows="2" class="form-control md-textarea bg-dark border border-danger text-light p-3" placeholder="Your Message"></textarea>

                                </div>

                            </div>
                        </div>
                        <!--Grid row-->

                    </form>

                    <div class="text-center text-md-left">
                        <a class="btn btn-danger fs-6 px-4" onclick="document.getElementById('contact-form').submit();">Send</a>
                    </div>
                    <div class="status"></div>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-3 text-center">
                    <ul class="list-unstyled mb-0">
                        <li><i class="fas fa-map-marker-alt fa-2x"></i>
                            <p class="text-danger">San Francisco, CA 94126, USA</p>
                        </li>

                        <li><i class="fas fa-phone mt-4 fa-2x"></i>
                            <p class="text-danger">+ 01 234 567 89</p>
                        </li>

                        <li><i class="fas fa-envelope mt-4 fa-2x"></i>
                            <p class="text-danger">contact@fsociety.com</p>
                        </li>
                    </ul>
                </div>
                <!--Grid column-->

            </div>

        </section>

        <section class="mb-4 border-top border-danger mt-5 container text-center" id="aboutUs">
            <div class="fs-1 font-weight-bold text-danger pt-4">About Us</div>
            <div class="fs-2 pb-3 text-danger">
                Welcome to fsociety: Where Freedom of Expression Reigns!
            </div>
            <div class=" fs-4 text-light">
                At fsociety, we believe in the power of unrestricted thought and the inherent right to express oneself freely. Our mission is to create a platform where individuals can share their ideas, opinions, and perspectives without fear of censorship or barriers. We envision a world where every voice matters, where diversity thrives, and where ideas flourish.
            </div>

            <div class="fs-2 pb-3 text-danger pt-5">
                Our Team
            </div>
            <div id="teamImages " class=" d-flex flex-row text-light">

                <div><img src="images/teamMembers/GOD.jpg" class="me-3 border border-danger" width="150px" height="150px" style="border-radius:50%;object-fit:contain"><span class="opacity-50">Debojyoti <br>Bhattacharya<br>(Team Lead)</span></div>
                <div><img src="images/teamMembers/anu.jpg" class="me-3" width="150px" height="150px" style="border-radius:50%;object-fit:contain"><span class="opacity-50">Anuradha<br>Saha</span></div>
                <div><img src="images/teamMembers/abhik.jpg" class="me-3" width="150px" height="150px" style="border-radius:50%;object-fit:contain"><span class="opacity-50">Abhik<br>Mandal</span></div>
                <div><img src="images/teamMembers/ayantika.jpg" class="me-3" width="150px" height="150px" style="border-radius:50%;object-fit:contain"><span class="opacity-50">Ayantika<br>Saha</span></div>
                <div><img src="images/teamMembers/aftab.jpg" class="me-3" width="150px" height="150px" style="border-radius:50%;object-fit:contain"><span class="opacity-50">Aftabuddin<br>Sarkar</span></div>
                <div><img src="images/teamMembers/argha.jpg" class="me-3" width="150px" height="150px" style="border-radius:50%;object-fit:contain"><span class="opacity-50">Arghadeep<br>Kundu</span></div>
            </div>
            <div class=" fs-6 text-light pt-5">
                In a time when the digital landscape is plagued by surveillance, control, and limited expression, fsociety stands as a beacon of hope. We strive to be a sanctuary for those seeking a space to articulate their thoughts, engage in meaningful conversations, and challenge the status quo. Our blog site is dedicated to providing an inclusive environment that encourages open dialogue, empowers individuals, and sparks intellectual curiosity.
            </div>
            <div class="fs-2 pb-3 text-danger pt-5">
                Where it all Started
            </div>
            <div class=" d-flex flex-row text-light justify-content-between">
                <div class="ms-6"><img src="images/teamMembers/clg.jpg" class="me-3 rounded" width="500px" height="400px" ><span class="mt-3 opacity-50">Techno Main, Saltlake</span></div>
                <div class="px-5 pt-4 fs-5">In the realm of university life, a project marks the exhilarating beginning. Ideas ignite, creativity flourishes, and knowledge takes flight. Within universities' vibrant ecosystem, dreams are shaped and transformed into reality. Reflect on the origins of your idea and cherish the spark that ignited your imagination. Embrace the process, surround yourself with a supportive team, and stay true to your vision. As you stand at the starting line, breathe in the possibilities that lie ahead. Trust in your abilities, seize every opportunity, and let this project define your university experience. Embrace the challenge, embrace the journey.</div>
            </div>
        </section>

        <footer class=" text-center text-light border-top border-danger pt-3 mt-5">
            © www.fsociety.com 2023
            All rights reserved.

            <p class="opacity-50">  The content, images, and design of this website are protected by copyright laws and international treaties. Unauthorized reproduction, distribution, or modification of any portion of this website may result in severe civil and criminal penalties.</p>
            <p class="opacity-50">For permissions or inquiries, please contact fsociety at +91 6291 234 906.</p>
        </footer>






        <!--        website coding end-->

        <!--        imports from the importsFile.jsp-->
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

            })
        </script>
    </body>
</html>
