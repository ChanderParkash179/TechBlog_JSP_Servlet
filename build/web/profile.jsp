
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="errorpage.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <!--css-->
        <link href="css/techblogcss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 70% 90%, 35% 100%, 0 88%) !important;
            }
            body{
                background: url("img/bg.jpg");
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!--navbar-start-->

        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <a class="navbar-brand" href="index.jsp"><spa class="fa fa-code"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="about.jsp"><span class="fa fa-phone"></span> Contact</a>
                    </li>
                    <li class="nav-item dropdown ">
                        <a class="nav-link text-light dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Courses
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Java</a>
                            <a class="dropdown-item" href="#">Python</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Android</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" data-toggle="modal" data-target="#doPostModal"><span class="fa fa-edit"></span> Do Post</a>
                    </li>
                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link text-light" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user"></span>&nbsp;<%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-light" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--navbar-ends-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first column-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--categories-->

                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategory();
                                for (Category cc : list1) {

                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"> <%= cc.getCname()%> </a>
                            <%
                                }
                            %>

                        </div>
                    </div>
                    <!--second column-->
                    <div class="col-md-8">
                        <!--posts-->
                        <div id="loader" class="container text-center">
                            <i class="fa fa-refresh fa-spin fa-4x"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--post modal start-->
        <!-- Modal -->
        <div class="modal fade" id="doPostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Post Here</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" method="POST" action="AddPostServlet">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option disabled selected>--- Select Category ---</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategory();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"> <%= c.getCname()%> </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="postTitle" type="text" placeholder="Enter Post Title" >
                            </div>
                            <div class="form-group">
                                <textarea name="postContent" style="height:100px;" class="form-control" placeholder="Enter Your Content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="postProgram" style="height:100px;" class="form-control" placeholder="Enter Your Program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="postImage">Upload Your Profile</label>
                                <input id="postImage" name="pImg" class="form-control" type="file">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--post modal ends-->

        <!--message starts-->
        <%
            Message m = (Message) session.getAttribute("msg");

            if (m != null) {
        %>
        <div class="text-center <%= m.getCssClass()%>"role="alert">
            <%=m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--message ends-->

        <!--modal start-->

        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background">
                        <div class="container text-center">
                            <h5 class="modal-title text-light" id="exampleModalLabel">Tech Blog</h5>
                        </div>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-center">
                        <img class="img-fluid" src="pics/<%= user.getProfile()%>" style="max-width: 120px; border-radius:50%;">
                        <br><br>
                        <strong><%= user.getName()%></strong>
                        <br>
                        <div id="profileDetailsTable">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">EMAIL:</th>
                                        <td><%= user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">GENDER:</th>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">REGISTERED ON:</th>
                                        <td><%= user.getDateTime().toString()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div id="profileEditTable" style="display: none;">
                            <h5 class="mt-2">Please Edit Carefully...</h5>
                            <form method="POST" action="EditServlet" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <th>ID:</th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th>NAME:</th>
                                        <td><input name="user_name" type="text" class="form-control" value="<%= user.getName()%>"> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>EMAIL:</th>
                                        <td><input name="user_email" type="email" class="form-control" value="<%= user.getEmail()%>"> 
                                    </tr>
                                    <tr>
                                        <th>PASSWORD:</th>
                                        <td><input name="user_password" type="text" class="form-control" value="<%= user.getPassword()%>"> 
                                    </tr>
                                    <tr>
                                        <th>GENDER:</th>
                                        <td><%= user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                        <th>REGISTERED ON:</th>
                                        <td><%= user.getDateTime()%></td>
                                    </tr>
                                    <tr>
                                        <th>NEW PROFILE:</th>
                                        <td><input name="profileImage" type="file" class="form-control"></td>
                                    </tr>
                                </table>
                                <button class="btn btn-outline-primary" type="submit">SAVE</button>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="btnEdit" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>
        <!--modal ends-->


        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="js/techblogjs.js" type="text/javascript"></script>

        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#btnEdit').click(function () {
                                        if (editStatus === false) {
                                            $("#profileDetailsTable").hide();
                                            $("#profileEditTable").show();
                                            editStatus = true;
                                            $(this).text("BACK");
                                        } else {
                                            $("#profileDetailsTable").show();
                                            $("#profileEditTable").hide();
                                            editStatus = false;
                                            $(this).text("EDIT");
                                        }
                                    });
                                });
        </script>

        <!--js for the add post-->

        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === 'done') {
                                swal("Congrats!", "Post Saved Successfully", "success");
                            } else {
                                swal("Error!", "Something ! went wrong...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "Something ! went wrong...", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

        <!--loading post using ajax-->
        <script>

            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").show();

                $('.c-link').removeClass('active');

                $.ajax({
                    url: "loadpost.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data),
                                $("#loader").hide();
                        $("#post-container").show;
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                });
            }

            $(document).ready(function (e) {
                let allPosts = $('.c-link')[0];
                getPosts(0, allPosts);
            });
        </script>
    </body>
</html>
