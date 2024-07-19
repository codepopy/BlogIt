
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="CSS/style.css"  />
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">
    </head>
    <body class="bg-dark">
        <!--        <div class="container-fluid primary-color">
                    <a href="index.jsp" class="text-decoration-none"><h1 class="display-4 serif_font text-light p-3 text-center">BitOfThought</h1> </a>
                </div>-->
        <section class="vh-100 gradient-custom">

            <div class="container py-4 h-100">
                
                <a href="index.jsp" > <span class="text-light border border-3 border-danger rounded-circle p-3 ms-3 mt-3"><i class="fa-sharp fa-solid fa-arrow-left fa-2xl text-danger"></i></span> </a>
                <div class="row justify-content-center align-items-center h-100">
                    <button class="btn btn-dark" id="darkmodebtn"><i class="fa-regular fa-lightbulb text-white" id='modeIcon'></i></button>
                    
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-lg card-registration bg-dark text-light border border-danger" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center glitch_font txt-red">Create Your Account</h3>
                                
                                <form action="verifyEmailServlet" method="POST" id="reg-form" enctype="multipart/form-data">

                                    <div class="row">
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <input type="text" id="user_name" name="user_name" class="form-control form-control-lg" />
                                                <label class="form-label" for="user_name">Name</label>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div class="form-outline">
                                                <input type="email" id="email" name="email" class="form-control form-control-lg" />
                                                <label class="form-label" for="email">Email</label>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 d-flex align-items-center">

                                            <div class="form-outline datepicker w-100">
                                                <input type="date" class="form-control form-control-lg" id="b_date" name="b_date" />
                                                <label for="birthdayDate" class="form-label">Birthday</label>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4">

                                            <h6 class="mb-2 pb-1">Gender: </h6>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" id="femaleGender"
                                                       value="female"  />
                                                <label class="form-check-label" for="femaleGender">Female</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" id="maleGender"
                                                       value="male" checked />
                                                <label class="form-check-label" for="maleGender">Male</label>
                                            </div>

                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="gender" id="otherGender"
                                                       value="other" />
                                                <label class="form-check-label" for="otherGender">Other</label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div class="form-outline">
                                                <input type="password" id="pass" name="pass" class="form-control form-control-lg" />
                                                <label class="form-label" for="pass">Password</label>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div class="form-outline">
                                                <input type="password" id="Conpass" name="Conpass" class="form-control form-control-lg" />
                                                <label class="form-label" for="Conpass">Confirm Password</label>
                                            </div>
                                            <span id='passmsg'></span>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-2">

                                            <select class="select form-control-lg" name='sec-q'>
                                                <option >Choose option</option>
                                                <option value="what's the name of your dog?">what's the name of your dog?</option>
                                                <option value="what's your favorite food">what's your favorite food</option>
                                                <option value="what's your mother's name">what's your mother's name</option>
                                            </select><br>
                                            <label class="form-label select-label">security question</label>

                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-12 mb-4">
                                            <div class="form-outline">
                                                <input type="text" id="ans" name="ans" class="form-control form-control-lg" />
                                                <label class="form-label" for="ans">answer</label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-grid gap-2">
                                        <input class="btn btn-danger btn-lg btn-block glitch_font" id="submitbtn" type="submit" value="Submit" />
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--        imports js-->
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

                $("#reg-form").on('submit', function (event) {
                    console.log("trying to submit form..")
                    $("#submitbtn").addClass("disabled");
                    let frm = new FormData(this);
                    event.preventDefault();
                    
                    //send to verify otp servlet servlet
                    $.ajax({
                        url: "verifyEmailServlet",
                        type: 'POST',
                        data: frm,
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
                                        'yeppii! You have successfully signed up',
                                        'You will be redirected to the email verification page',
                                        'success'
                                        ).then((value) => {
                                    window.location = "verify_otp.jsp";

                                });
                            }
                        },
                        error: function (data, textStatus, jqXHR) {
                            console.log(jqXHR);
                        },
                        processData: false,
                        contentType: false
                    })


                });
            });

        </script>        



    </body>
</html>

