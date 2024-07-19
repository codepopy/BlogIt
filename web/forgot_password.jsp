
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
    <body>
        <!--        <div class="container-fluid primary-color">
                    <a href="index.jsp" class="text-decoration-none"><h1 class="display-4 serif_font text-light p-3 text-center">BitOfThought</h1> </a>
                </div>-->
        <section class="vh-100 gradient-custom">

            <div class="container h-100 text-center " style="padding-top: 100px;">

                <div class="card text-center mx-auto mt-auto shadow-lg " style="width: 500px;">
                    <div class="card-header h5 text-white bg-danger">Password Reset</div>
                    <div class="card-body px-5">
                        <p class="card-text py-2">
                            Enter your registered email address and answer the your security question and we'll send you an OTP which you can use to change your password.
                        </p>
                        <form action="sendOTPForPasswordChangeServlet" type="POST" id="fp-form">
                        <div class="form-outline">
                            <input type="email" id="typeEmail" name="email" class="form-control mt-3" />
                            <label class="form-label" for="typeEmail">Email </label>
                            
                              <select class="select form-control" name='sec-q'>
                                                <option >Choose option</option>
                                                <option value="what's the name of your dog?">what's the name of your dog?</option>
                                                <option value="what's your favorite food">what's your favorite food</option>
                                                <option value="what's your mother's name">what's your mother's name</option>
                                            </select><br>
                                            <label class="form-label select-label">security question</label>
                            
                             <input type="text" id="typeAnswer" name="ans" class="form-control mt-3" />
                            <label class="form-label" for="typeEmail">Answer </label>
                            
                        </div>
                        <input  type="submit" class="btn btn-danger w-100" value="Reset password">
                        </form>
                        <div class="d-flex justify-content-center mt-4">
                            <a class="" href="index.jsp">back</a>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--        imports js-->
        <%@include file="importsFile.jsp"%>

        

                



    </body>
</html>

