
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup</title>

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


        <main class="d-flex align-items-center bg-primary banner-background pb-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card m-auto">
                            <div class="card-header text-center bg-primary text-light">
                                <span class="fa fa-3x fa-user-plus"></span>
                                <h3>Signup</h3>
                            </div>
                            <div class="card-body">
                                <form id="reg-form" action="RegisterServlet" method="POST">
                                    <div class="form-group">
                                        <label for="inputUsername">Username</label>
                                        <input type="text" name="user_name" class="form-control" id="inputUsername" placeholder="Enter Username">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail">Email</label>
                                        <input type="email" name="user_email" class="form-control" id="inputEmail" placeholder="Enter Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword">Password</label>
                                        <input type="password" class="form-control" name="user_password" id="inputPassword" placeholder="Enter Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="user_gender">Gender</label>
                                        <br>
                                        <input type="radio" name="user_gender" value="Male" id="user_gender" checked> Male
                                        <input type="radio" name="user_gender" value="Female" id="user_gender"> Female
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" name="user_check" id="emailChecker">
                                        <label class="form-check-label" for="emailChecker">Agree Terms & Conditions</label>
                                    </div>
                                    <br>
                                    <div class="container text-center" id="loader" style="display:none;">
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <h4>Please wait...</h4>
                                    </div>
                                    <div class="container text-center">
                                        <button id="submit-button" type="submit" class="btn btn-primary">Sign up</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="js/techblogjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
        <script>
            
            $(document).ready(function () {
                console.log("loaded.....");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    $("#submit-button").hide();
                    $("#loader").show();

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submit-button").show();
                            $("#loader").hide();

                            if (data.trim() === 'done') {
                                swal("Registered Successfully... we're redirecting to the Login Page! Please wait")
                                        .then((value) => {
                                            window.location = "login.jsp";
                                        });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-button").show();
                            $("#loader").hide();
                            swal("Something went wrong... try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    
    </body>
</html>