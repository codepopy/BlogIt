
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.blog.entities.UserEntity" %>
<%   
   UserEntity user = (UserEntity)session.getAttribute("user"); 
   
   if(user==null || session.getAttribute("otp")==null ){
    response.sendRedirect("index.jsp");
   }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>verification</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="CSS/style.css"  />
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">
    </head>
    <body >

        <section class="vh-100 gradient-custom">

            <div class="container py-4 h-100">

                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-lg card-registration border border-danger" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="pb-2 pb-md-0 mb-md-3 text-center glitch_font txt-red">Verify your Email</h3>
                                <div class=" mb-md-3 text-center glitch_font_text fs-3">check your email for your OTP </div>
                                <form action="updatePasswordServlet" method="POST" id="fp-form">

                                    <div class="row">
                                        <div class="col-md-6 offset-3 mb-4">

                                            <div class="form-outline">
                                                <input type="tel" id="OTP" name="OTP" class="form-control form-control-lg text-center" />
                                                <label class="form-label" for="OTP">otp</label>
                                            </div>
                                            <div class="form-outline">
                                                <input type="password" id="pass" name="pass" class="form-control form-control-lg" />
                                                <label class="form-label" for="pass">Password</label>
                                            </div>
                                            <div class="form-outline">
                                                <input type="password" id="Conpass" name="Conpass" class="form-control form-control-lg" />
                                                <label class="form-label" for="Conpass">Confirm Password</label>
                                            </div>
                                            <div id='passmsg'></div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="text-center mb-4">
                                            <input class="btn btn-danger btn-lg  glitch_font" type="submit" value="Submit" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <%@include file="importsFile.jsp"%>
        <script>
            $(document).ready(function () {
                console.log("loaded..");
                $("#Conpass").on('keyup', function () {
                    console.log("works..");
                    var password = $("#pass").val();
                    var conpass = $("#Conpass").val();
                    if (password !== conpass)
                        $("#passmsg").html("Password does not match !").css("color", "red");
                    else
                        $("#passmsg").html("Password match !").css("color", "green");
                });

                $("#fp-form").on("submit", function (event) {
                    console.log("submitting");
                    event.preventDefault();
                    var a= $("#OTP").val();
                    console.log(a);
                    var b=$("#pass").val();
                    
                    $.ajax({
                        url: "updatePasswordServlet",
                        type: "POST",
                        data: {OTP:a,pass:b},
                        success: function (data, textStatus, jqHXR) {
                           console.log(data);
                            if (data.trim() === 'error') {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: 'Something went wrong!',
                                    footer: 'try using a different email '
                                });

                            } else {
                                Swal.fire(
                                        'password changed successfully',
                                        'You will be redirected to index page',
                                        'success'
                                        ).then((value) => {
                                    window.location = "index.jsp";

                                });
                            }
                        }
                        
                    });
                });
            });
        </script>


    </body>
</html>
