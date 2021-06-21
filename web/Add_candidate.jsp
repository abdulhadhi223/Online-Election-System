<%-- 
    Document   : Admin_login
    Created on : 15 Mar, 2021, 5:01:34 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    <script>
        var loadFile = function (event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('output');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        };
    </script>
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
                            <li class="nav-item"><a href="Admin_Home.jsp">Home</a></li>
                            <li class="nav-item"><a href="Add_election.jsp">Add Election</a></li>
                            <li class="nav-item active"><a href="Add_candidate.jsp">Add Candidate</a></li>
                            <li class="nav-item"><a href="View_results.jsp">view Results</a></li>
                            <li class="nav-item"><a href="View_voters.jsp">view Voters</a></li>
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
            <section id="mu-contact">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mu-contact-area">
                                <!-- Title -->
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mu-title">
                                            <h2>Add Candidate</h2>
                                        </div>
                                    </div>
                                </div>
                                <!-- Start Contact Content -->
                                <%
                                    String uid = "0";
                                    Connection con = SQLconnection.getconnection();
                                    Statement st = con.createStatement();
                                    Statement st1 = con.createStatement();
                                    Statement st2 = con.createStatement();
                                    try {
                                        ResultSet rs = st.executeQuery("SELECT * FROM add_election");

                                %>

                                <div class="col-md-7">
                                    <div class="mu-contact-form-area">
                                        <div id="form-messages"></div>
                                        <form method="post" action="add_candidate" class="mu-contact-form" enctype="multipart/form-data">
                                            <div class="form-group">  
                                                <span class="fa fa-comment mu-contact-icon"></span>   
                                                <select class="form-control" name="election_name" required="required"><option value="">&nbsp;&nbsp;&nbsp;Select Election</option>
                                                    <%  while (rs.next()) {%>
                                                    <option value="<%=rs.getString(2)%>">&nbsp;&nbsp;&nbsp;<%=rs.getString(2)%></option>
                                                    <%}%> 
                                                </select>
                                            </div>
                                            <div class="form-group">  
                                                <span class="fa fa-user mu-contact-icon"></span>              
                                                <input type="text" class="form-control" placeholder="Candidate Name" name="candidate_name" required="required" />
                                            </div>
                                            <div class="form-group">  
                                                <span class="fa fa-group mu-contact-icon"></span>              
                                                <input type="text" class="form-control" placeholder="Party Name" name="party_name" required="required" />
                                            </div>
                                            <div class="form-group">  
                                                <span class="fa fa-home mu-contact-icon"></span>              
                                                <input type="text" class="form-control" placeholder="Address" name="address" required="required" />
                                            </div>
                                            <div class="form-group">  
                                                <span class="fa fa-phone mu-contact-icon"></span>              
                                                <input type="text" class="form-control" placeholder="Phone No" name="phone" required="required" />
                                            </div>    
                                            <div class="form-group">  
                                                <span class="fa fa-picture-o mu-contact-icon"></span>            
                                                <input type="file" class="form-control" placeholder="Photo" name="photo" accept="image/x-png,image/gif,image/jpeg" onchange="loadFile(event)" required="required" />
                                            </div>
                                            <div class="form-group"> 
                                                <button type="submit" class="mu-send-msg-btn"><span>Submit</span></button>
                                            </div> 
                                        </form>
                                        <%

                                            } catch (Exception ex) {
                                                ex.printStackTrace();
                                            }

                                        %>
                                    </div>
                                </div>
                                <div class="col-md-5" style="float: right">
                                    <br><br><br><br><br><br><br>
                                    <img id="output" src="#" alt="your image" width="200" height="150">
                                </div>
                                <!-- End Contact Content -->
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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