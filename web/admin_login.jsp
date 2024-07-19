
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Sign in</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='CSS/style.css'>
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">
    </head>
    <body class="bg-dark">
       <section class="vh-100 gradient-custom">

            <div class="container py-4 h-100">
                <a href="index.jsp" > <span class="text-light border border-3 border-danger rounded-circle p-3 ms-3 mt-5"><i class="fa-sharp fa-solid fa-arrow-left fa-2xl text-danger"></i></span> </a>
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-lg card-registration bg-dark text-light border border-danger" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center glitch_font txt-red">Admin Sign In</h3>
                                <form action="adminLoginServlet" method="POST" id="admin-form" >

                                    <div class="row">
                                        <div class="col-md-12 mb-4">

                                            <div class="form-outline">
                                                <input type="text" id="user_name" name="user_name" class="form-control form-control-lg" />
                                                <label class="form-label" for="user_name">User Name</label>
                                            </div>

                                        </div>
                                        
                                    </div>

                                    

                                    <div class="row">
                                        <div class="col-md-12 mb-4 pb-2">

                                            <div class="form-outline">
                                                <input type="password" id="pass" name="pass" class="form-control form-control-lg" />
                                                <label class="form-label" for="pass">Password</label>
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
    </body>
</html>
