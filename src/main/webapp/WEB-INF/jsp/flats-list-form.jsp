<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>coffeecoding.net</title>
    <meta name="description"
          content="Free open source projects present different java solutions using spring, hibernate and other popular frameworks.">
    <meta name="keywords"
          content="java, spring, hibernate, apache, tomcat, coding, programmer, linux, google cloud platform, open source, bootstrap, mysql, java ideas">
    <!-- CSS dependencies -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.standalone.min.css">
    <link rel="stylesheet" href="https://www.coffeecoding.net/resources/css/now-ui-kit.css" type="text/css">
    <link rel="stylesheet" href="https://www.coffeecoding.net/resources/css/style.css" type="text/css">
    <link rel="icon" href="resources/img/favicon.png">
    <!-- PAGE scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>
    <style>
        .avatar {
            vertical-align: middle;
            width: 150px;
            height: 100px;
            border-radius: 5%;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        td {
            height: 100px;
            vertical-align: middle !important;
        }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#slider-range").slider({
                range: true,
                step: 1000,
                min: ${min},
                max: ${max},
                values: [${minFilter}, ${maxFilter}],
                slide: function (event, ui) {
                    $("#amount").val(ui.values[0] + " - " + ui.values[1]);
                }
            });
            $("#amount").val($("#slider-range").slider("values", 0) +
                " - " + $("#slider-range").slider("values", 1));
        });
    </script>
</head>


<body class="bg-light text-dark">
<div id="wrap">
    <div id="main" class="clear-top">


        <div class="collapse" id="navbarHeader">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 py-4">
                        <h4>About</h4>
                        <p class="text-info">Free open source projects present different java solutions using spring,
                            hibernate
                            and other popular frameworks.</p>
                    </div>
                    <div class="col-md-3 offset-md-1 py-4">
                        <h4>Contact</h4>
                        <ul class="list-unstyled">
                            <li>
                                <a href="https://pl.linkedin.com/in/michalsiwiak" class="text-secondary"
                                   target="_blank">Follow
                                    on LinkedIn</a>
                            </li>
                            <li>
                                <a href="mailto:info@coffeecoding.net" target="_top" class="text-secondary">Email me</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="navbar sticky-top navbar-dark bg-info">
            <div class="container d-flex justify-content-between">
                <a href="https://www.coffeecoding.net/" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-home fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">
                    HOME
                </text>
                </a>
                <a href="https://github.com/MichalSiwiak/real-estate-portal-spring-security" target="_blank"
                   class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-git-square fa-fw d-inline-block lead fa-2x"></i>&nbsp;&nbsp;<text class="">SOURCE
                    CODE
                </text>
                </a>
                <a href="${pageContext.request.contextPath}" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-file-text fa-2x fa-fw lead d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">DESCRIPTION
                </text>
                </a>
                <a href="https://coffeecoding.net/resources/img/cv_msiwiak.pdf"
                   class="navbar-brand d-flex align-items-center" target="_blank"><i
                        class="fa fa-address-card fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">RESUME
                </text>
                </a>
                <a href="/contact" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-envelope fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">CONTACT
                </text>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader"><span
                        class="navbar-toggler-icon"></span></button>
            </div>
        </div>


        <div class="text-center mb-3 py-1 bg-info"
             style="	background-position: top left;	background-size: 100%;	background-repeat: repeat;">
            <div class="container">
                <div class="row">
                    <div class="m-0 mt-2 col-md-8 p-2">
                        <h1 class="text-left mt-5"> Real Estate Portal</h1>
                    </div>
                    <div class="col-md-4 w-25"><img class="card-img-top" src="resources/img/house.jpg"
                                                    alt="Card image cap"
                                                    width="600"></div>
                </div>
            </div>
        </div>


        <div class="pt-0 pb-5">
            <div class="container">


                <security:authorize access="hasAnyRole('USER', 'ADMIN')">
                    <div class="row my-3">
                        <div class="col-md-6">
                            <h4 class="m-0 p-0">
                                Logged: <security:authentication property="principal.username"/>
                            </h4>
                        </div>
                        <div class="col-md-6">
                            <form:form action="${pageContext.request.contextPath}/logout" method="post">
                                <button class="btn text-light mb-4 btn-primary float-right" type="submit">
                                    <i class="fa fa-sign-out fa-lg" aria-hidden="true"></i> &nbsp; LOGOUT
                                </button>
                            </form:form>
                        </div>
                    </div>
                </security:authorize>


                <div class="col-md-12 order-md-1 mb-4 p-0">
                    <form:form method="POST" modelAttribute="filter">
                        <div class="row mt-5">
                            <div class="mb-3 col-md-3 text-center"><label>Select title like:</label>
                                <form:input path="title" class="form-control text-center rounded-0"/>
                            </div>
                            <div class="mb-3 col-md-3 text-center"><label>Select city equals:</label>
                                <form:select path="city" type="text" class="form-control text-center rounded-0">
                                    <option selected="selected">${selected}</option>
                                    <c:forEach var="city" items="${cities}">
                                        <option value=${city}>${city}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="mb-3 col-md-3 text-center"><label>Price range:</label>
                                <form:input path="priceRange" type="text" id="amount" readonly="true"
                                            class="form-control text-center rounded-0"/>
                            </div>
                            <div class="mb-3 col-md-3 text-center"><label>Change range:</label>
                                <div class="mt-3" id="slider-range"></div>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <div class="row">
                            <div class="col-md-4"><a class="btn text-light mt-0 mb-0 w-100 btn-secondary"
                                                     href="${pageContext.request.contextPath}/new-flat">
                                <i class="fa fa-plus-square fa-lg" aria-hidden="true"></i> &nbsp; NEW FLAT</a>
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn w-100 btn-warning text-dark">Filter results</button>
                            </div>
                            <div class="col-md-4"><a class="btn w-100 btn-warning text-dark"
                                                     href="${pageContext.request.contextPath}/demo">Clear
                                filters</a>
                            </div>
                        </div>
                    </form:form>
                </div>


                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped table-borderless">
                                <thead class="thead-dark">
                                <tr class="text-center">
                                    <th class="">ID</th>
                                    <th>Title</th>
                                    <th>Image</th>
                                    <th>City</th>
                                    <th>Surface</th>
                                    <th>Rooms</th>
                                    <th>Price</th>
                                    <th>User</th>
                                </tr>
                                </thead>
                                <tbody class="text-center">
                                <c:forEach var="flat" items="${flats}">

                                    <tr>
                                        <td>${flat.id}</td>
                                        <td>
                                            <c:url var="url" scope="page" value="/flat">
                                                <c:param name="id" value="${flat.id}">
                                                </c:param>
                                            </c:url> <a href="${url}">${flat.title}</a>
                                        </td>
                                        <td><img class="avatar"
                                                 src="${pageContext.request.contextPath}/flat-avatar/${flat.id}">
                                        </td>
                                        <td>${flat.city}</td>
                                        <td>${flat.surface}</td>
                                        <td>${flat.rooms}</td>
                                        <td>${flat.price}</td>
                                        <td>${flat.users.username}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
        </div>


    </div>
</div>


<footer class="footer bg-dark text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>© Copyright 2018 coffeecoding.net - All rights reserved.<br>Contact: info@coffeecoding.net<br>Warsaw
            PL<br><a
                    href="https://www.coffeecoding.net/">Visit the homepage</a>
        </p>
    </div>
</footer>


</body>
</html>