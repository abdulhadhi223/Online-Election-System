<%-- 
    Document   : User_Home
    Created on : 16 Mar, 2021, 10:58:07 AM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Online Election System</title>
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/icon" href="assets/images/favicon.ico"/>
        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <!-- Slick slider -->
        <link href="assets/css/slick.css" rel="stylesheet">
        <!-- Gallery Lightbox -->
        <link href="assets/css/magnific-popup.css" rel="stylesheet">
        <!-- Skills Circle CSS  -->
        <link rel="stylesheet" type="text/css" href="https://unpkg.com/circlebars@1.0.3/dist/circle.css">
        <!-- Main Style -->
        <link href="assets/css/style.css" rel="stylesheet">
        <!-- Google Fonts Raleway -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,400i,500,500i,600,700" rel="stylesheet">
        <!-- Google Fonts Open sans -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,600,700,800" rel="stylesheet">
    </head>
        <%
        if (request.getParameter("Success") != null) {
    %>
    <script>alert('Login Success');</script>
    <%            }
    %>
    <body>
        <!--START SCROLL TOP BUTTON -->
        <a class="scrollToTop" href="#">
            <i class="fa fa-angle-up"></i>
        </a>
        <!-- END SCROLL TOP BUTTON -->
        <!-- Start Header -->
        <header id="mu-hero">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light mu-navbar">
                    <!-- Text based logo -->
                    <a class="navbar-brand mu-logo" href="index.html"><span></span></a>
                    <!-- image based logo -->
                    <!-- <a class="navbar-brand mu-logo" href="index.html"><img src="assets/images/logo.png" alt="logo"></a> -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="fa fa-bars"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto mu-navbar-nav">
                            <li class="nav-item active"><a href="User_Home.jsp">Home</a></li>
                            <li class="nav-item"><a href="Elections.jsp">Elections</a></li>
                            <li class="nav-item"><a href="index.html">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
        <!-- End Header -->
        <!-- Start slider area -->
        <div id="mu-page-header" style="background-image: url(images/slide2.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-page-header-area">
                            <h1 class="mu-page-header-title">Online Election System</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <main>
            <!-- Start About -->
            <section id="mu-about">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mu-about-area">
                                <!-- Title -->
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mu-title">
                                            <h2>Online Election System</h2>
                                        </div>
                                    </div>
                                </div>
                                <!-- Start Feature Content -->
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mu-about-left">
                                            <img class="" src="images/slide1.jpg" width="1100" height="500" alt="img">
                                        </div>
                                    </div>
                                </div>
                                <!-- End Feature Content -->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- End main content -->	
        <!-- Start footer -->
        <footer id="mu-footer">
            <div class="mu-footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mu-footer-bottom-area">
                                <p class="mu-copy-right">&copy;
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End footer -->
        <!-- JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <!-- Slick slider -->
        <script type="text/javascript" src="assets/js/slick.min.js"></script>
        <!-- Progress Bar -->
        <script src="https://unpkg.com/circlebars@1.0.3/dist/circle.js"></script>
        <!-- Filterable Gallery js -->
        <script type="text/javascript" src="assets/js/jquery.filterizr.min.js"></script>
        <!-- Gallery Lightbox -->
        <script type="text/javascript" src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Counter js -->
        <script type="text/javascript" src="assets/js/counter.js"></script>
        <!-- Ajax contact form  -->
        <script type="text/javascript" src="assets/js/app.js"></script>
        <!-- Custom js -->
        <script type="text/javascript" src="assets/js/custom.js"></script>
        <!-- About us Skills Circle progress  -->
        <script>
            // First circle
            new Circlebar({
                element: "#circle-1",
                type: "progress",
                maxValue: "90"
            });

            // Second circle
            new Circlebar({
                element: "#circle-2",
                type: "progress",
                maxValue: "84"
            });

            // Third circle
            new Circlebar({
                element: "#circle-3",
                type: "progress",
                maxValue: "60"
            });

            // Fourth circle
            new Circlebar({
                element: "#circle-4",
                type: "progress",
                maxValue: "74"
            });

        </script>
    </body>
</html>
