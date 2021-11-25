<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Blog - Website</title>

        <!--css-->
        <link href="css/techblogcss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 70% 90%, 35% 100%, 0 88%) !important;
            }
        </style>
    </head>
    <body>

        <!--navbar-->
        <%@include file="navbar.jsp" %>

        <!--content-->
        <div class="container-fluid p-0 m-0 text-light">
            <div class="jumbotron bg-primary banner-background">
                <div class="container">
                    <h1 class="display-3">Welcome to the Tech Blog</h1>
                    <p>A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. 
                        Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.
                        Most programming languages consist of instructions for computers. 
                        There are programmable machines that use a set of specific instructions, rather than general programming languages. 
                        Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.
                        The programs for these machines (such as a player piano's scrolls) did not produce different behavior in response to different inputs or conditions.
                    </p>
                    <a class="text-dark" href="register.jsp"><button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start ! its Free</button></a>
                    <a class="text-dark m-1" href="login.jsp"><button class="btn btn-outline-light btn-lg"><span class="fa fa-spin fa-user-circle-o"></span> Login</button></a>
                </div>
            </div>
        </div>

        <!--cards-->
        <div class="container">
            <div class="row md-2">
                <div class="col-md-4">
                    <div class="card" style="margin-bottom: 10px !important;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. 
                                It is a general-purpose programming language intended to let programmers write once, run anywhere. 
                                The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them.</p>
                            <a href="#" class="btn bg-primary text-light">Read more...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="margin-bottom: 10px !important;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. 
                                It is a general-purpose programming language intended to let programmers write once, run anywhere. 
                                The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them.</p>
                            <a href="#" class="btn bg-primary text-light">Read more...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="margin-bottom: 10px !important;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. 
                                It is a general-purpose programming language intended to let programmers write once, run anywhere. 
                                The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them.</p>
                            <a href="#" class="btn bg-primary text-light">Read more...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="margin-bottom: 10px !important;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. 
                                It is a general-purpose programming language intended to let programmers write once, run anywhere. 
                                The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them.</p>
                            <a href="#" class="btn bg-primary text-light">Read more...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="margin-bottom: 10px !important;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. 
                                It is a general-purpose programming language intended to let programmers write once, run anywhere. 
                                The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them.</p>
                            <a href="#" class="btn bg-primary text-light">Read more...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="margin-bottom: 10px !important;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. 
                                It is a general-purpose programming language intended to let programmers write once, run anywhere. 
                                The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them.</p>
                            <a href="#" class="btn bg-primary text-light">Read more...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="js/techblogjs.js" type="text/javascript"></script>
    </body>
</html>
