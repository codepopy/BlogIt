
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>error</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel='stylesheet' href='CSS/style.css'>
        <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="images/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon/favicon-16x16.png">
        <link rel="manifest" href="images/favicon/site.webmanifest">
    </head>
    <body class="bg-dark">
        <div class="d-flex align-items-center justify-content-center vh-100 text-light">
            <div class="text-center">
                <img src="images\bang-dream-bandori.gif" class="rounded pb-2" height="60%" width="60%">
                <h1 class="display-1 glitch_font text-danger">404</h1>
                <p class="fs-1 glitch_font_text"> <span class="text-danger">Opps!</span> Page not found.</p>
                <p class="lead glitch_font_text fs-2">
                    The page you’re looking for doesn’t exist.
                </p>
                <a href="personal_home.jsp" class="btn btn-primary">Go Home</a>
            </div>
        </div>


        <%@include file="importsFile.jsp"%>
    </body>
</html>
