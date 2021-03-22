<%-- 
    Document   : index
    Created on : Jan 4, 2020, 10:59:02 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><s:message code="global.main"/></title>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="Gradient Able Bootstrap admin template made using Bootstrap 4. The starter version of Gradient Able is completely free for personal project." />
        <meta name="keywords" content="free dashboard template, free admin, free bootstrap template, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
        <meta name="author" content="codedthemes">
        <!-- Favicon icon -->
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
        <!-- Google font-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
        <!-- Required Fremwork -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
        <!-- themify-icons line icon -->
        <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
        <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
        <!-- ico font -->
        <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
    </head>
    <body>
        <%
            request.getSession().setAttribute("user","abc");
        %>
        <div class="fixed-button">
            <a href="https://codedthemes.com/item/gradient-able-admin-template" target="_blank" class="btn btn-md btn-primary">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i> Upgrade To Pro
            </a>
        </div>
        <!-- Pre-loader start -->
        <div class="theme-loader">
            <div class="loader-track">
                <div class="loader-bar"></div>
            </div>
        </div>
        <!-- Pre-loader end -->
        <div id="pcoded" class="pcoded">
            <div class="pcoded-overlay-box"></div>
            <div class="pcoded-container navbar-wrapper">

                <jsp:include page="header-nav.jsp" />
                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">
                        <jsp:include page="menu-side.jsp" />
                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">
                                <div class="main-body">
                                    <div class="page-wrapper">

                                        <div class="page-body">
                                            <div class="row">

                                                <!-- order-card start -->
                                                <div class="col-md-6 col-xl-3">
                                                    <div class="card bg-c-blue order-card">
                                                        <div class="card-block">
                                                            <h6 class="m-b-20" ><s:message code="global.menu.user"/></h6>
                                                            <h2 class="text-right"><i class="ti-shopping-cart f-left"></i><span>${countUser}</span></h2>
                                                            <p class="m-b-0"><span class="f-right"></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-xl-3">
                                                    <div class="card bg-c-green order-card">
                                                        <div class="card-block">
                                                            <h6 class="m-b-20"><s:message code="global.menu.depart"/></h6>
                                                            <h2 class="text-right"><i class="ti-tag f-left"></i><span>${countDepart}</span></h2>
                                                            <p class="m-b-0"><span class="f-right"></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-xl-3">
                                                    <div class="card bg-c-yellow order-card">
                                                        <div class="card-block">
                                                            <h6 class="m-b-20"><s:message code="global.menu.staff"/></h6>
                                                            <h2 class="text-right"><i class="ti-reload f-left"></i><span>${countStaff}</span></h2>
                                                            <p class="m-b-0"><span class="f-right"></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-xl-3">
                                                    <div class="card bg-c-pink order-card">
                                                        <div class="card-block">
                                                            <h6 class="m-b-20"><s:message code="global.menu.record"/></h6>
                                                            <h2 class="text-right"><i class="ti-wallet f-left"></i><span>${countRecord}</span></h2>
                                                            <p class="m-b-0"><span class="f-right"></span></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- order-card end -->


                                                <!-- tabs card start -->
                                                <div class="col-sm-12">
                                                    <div class="card tabs-card">
                                                        <div class="card-block p-0">
                                                            <!-- Nav tabs -->
                                                            <ul class="nav nav-tabs md-tabs" role="tablist">
                                                                <li class="nav-item">
                                                                    <a class="nav-link active" data-toggle="tab" href="#home3" role="tab"><i class="fa fa-home"></i><s:message code="global.compliment"/></a>
                                                                    <h5 class="${check}" >${message}</h5>
                                                                </li>
                                                            </ul>
                                                            <!-- Tab panes -->
                                                            <div class="tab-content card-block">
                                                                <div class="tab-pane active" id="home3" role="tabpanel">

                                                                    <div class="table-responsive">
                                                                        <table class="table">
                                                                            <tr>
                                                                                <th><s:message code="global.image"/></th>
                                                                                <th><s:message code="global.id"/></th>
                                                                                <th><s:message code="global.fullname"/></th>
                                                                                <th>Email</th>
                                                                                <th><s:message code="global.save"/></th>
                                                                                <th><s:message code="global.bad"/></th>
                                                                                <th><s:message code="global.total"/></th>
                                                                                <th>Mail</th>
                                                                            </tr>
                                                                            <c:forEach var="u" items="${dto}">
                                                                                <tr>
                                                                                    <td><img src="assets/images/${u[0]}" width="100px" /></td>
                                                                                    <td>${u[1]}</td>
                                                                                    <td>${u[2]}</td>
                                                                                    <td>${u[3]}</td>
                                                                                    <td>${u[4]}</td>
                                                                                    <td>${u[5]}</td>
                                                                                    <td>${u[6]}</td>
                                                                                    <td>
                                                                                        <form action="user/send.htm">
                                                                                            <input type="hidden" name="name" value="${u[2]}"/>
                                                                                            <input type="hidden" name="email" value="${u[3]}"/>
                                                                                            <button class="btn btn-primary">
                                                                                                <s:message code="global.mail"/>
                                                                                            </button>
                                                                                        </form>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </table>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- tabs card end -->

                                                <!-- social statustic start -->
                                                <div class="col-md-12 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-block text-center">
                                                            <i class="fa fa-envelope-open text-c-blue d-block f-40"></i>
                                                            <h4 class="m-t-20"><span class="text-c-blue">8.62k</span> Subscribers</h4>
                                                            <p class="m-b-20">Your main list is growing</p>
                                                            <button class="btn btn-primary btn-sm btn-round">Manage List</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-block text-center">
                                                            <i class="fa fa-twitter text-c-green d-block f-40"></i>
                                                            <h4 class="m-t-20"><span class="text-c-blgreenue">+40</span> Followers</h4>
                                                            <p class="m-b-20">Your main list is growing</p>
                                                            <button class="btn btn-success btn-sm btn-round">Check them out</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4">
                                                    <div class="card">
                                                        <div class="card-block text-center">
                                                            <i class="fa fa-puzzle-piece text-c-pink d-block f-40"></i>
                                                            <h4 class="m-t-20">Business Plan</h4>
                                                            <p class="m-b-20">This is your current active plan</p>
                                                            <button class="btn btn-danger btn-sm btn-round">Upgrade to VIP</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- social statustic end -->

                                                <!-- users visite and profile start -->
                                                <div class="col-md-4">
                                                    <div class="card user-card">
                                                        <div class="card-header">
                                                            <h5>Profile</h5>
                                                        </div>
                                                        <div class="card-block">
                                                            <div class="">
                                                                <img src="assets/images/avatar-4.jpg" width="100%" class="img-radius" alt="User-Profile-Image">
                                                            </div>
                                                            <h6 class="f-w-600 m-t-25 m-b-10">Alessa Robert</h6>
                                                            <p class="text-muted">Active | Male | Born 23.05.1992</p>
                                                            <hr/>
                                                            <p class="text-muted m-t-15">Activity Level: 87%</p>
                                                            <ul class="list-unstyled activity-leval">
                                                                <li class="active"></li>
                                                                <li class="active"></li>
                                                                <li class="active"></li>
                                                                <li></li>
                                                                <li></li>
                                                            </ul>
                                                            <div class="bg-c-blue counter-block m-t-10 p-20">
                                                                <div class="row">
                                                                    <div class="col-4">
                                                                        <i class="ti-comments"></i>
                                                                        <p>1256</p>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <i class="ti-user"></i>
                                                                        <p>8562</p>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <i class="ti-bag"></i>
                                                                        <p>189</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <p class="m-t-15 text-muted">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                                            <hr/>
                                                            <div class="row justify-content-center user-social-link">
                                                                <div class="col-auto"><a href="#!"><i class="fa fa-facebook text-facebook"></i></a></div>
                                                                <div class="col-auto"><a href="#!"><i class="fa fa-twitter text-twitter"></i></a></div>
                                                                <div class="col-auto"><a href="#!"><i class="fa fa-dribbble text-dribbble"></i></a></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5>Activity Feed</h5>
                                                            <div class="card-header-right">
                                                                <ul class="list-unstyled card-option">
                                                                    <li><i class="fa fa-chevron-left"></i></li>
                                                                    <li><i class="fa fa-window-maximize full-card"></i></li>
                                                                    <li><i class="fa fa-minus minimize-card"></i></li>
                                                                    <li><i class="fa fa-refresh reload-card"></i></li>
                                                                    <li><i class="fa fa-times close-card"></i></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="card-block">
                                                            <ul class="feed-blog">
                                                                <li class="active-feed">
                                                                    <div class="feed-user-img">
                                                                        <img src="assets/images/avatar-3.jpg" class="img-radius " alt="User-Profile-Image">
                                                                    </div>
                                                                    <h6><span class="label label-danger">File</span> Eddie uploaded new files: <small class="text-muted">2 hours ago</small></h6>
                                                                    <p class="m-b-15 m-t-15"> hii <b> @everone</b> Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                                                    <div class="row">
                                                                        <div class="col-auto text-center">
                                                                            <img src="assets/images/blog/blog-r-1.jpg" alt="img" class="img-fluid img-100">
                                                                            <h6 class="m-t-15 m-b-0">Old Scooter</h6>
                                                                            <p class="text-muted m-b-0"><small>PNG-100KB</small></p>
                                                                        </div>
                                                                        <div class="col-auto text-center">
                                                                            <img src="assets/images/blog/blog-r-2.jpg" alt="img" class="img-fluid img-100">
                                                                            <h6 class="m-t-15 m-b-0">Wall Art</h6>
                                                                            <p class="text-muted m-b-0"><small>PNG-150KB</small></p>
                                                                        </div>
                                                                        <div class="col-auto text-center">
                                                                            <img src="assets/images/blog/blog-r-3.jpg" alt="img" class="img-fluid img-100">
                                                                            <h6 class="m-t-15 m-b-0">Microphone</h6>
                                                                            <p class="text-muted m-b-0"><small>PNG-150KB</small></p>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="diactive-feed">
                                                                    <div class="feed-user-img">
                                                                        <img src="assets/images/avatar-4.jpg" class="img-radius " alt="User-Profile-Image">
                                                                    </div>
                                                                    <h6><span class="label label-success">Task</span>Sarah marked the Pending Review: <span class="text-c-green"> Trash Can Icon Design</span><small class="text-muted">2 hours ago</small></h6>
                                                                </li>
                                                                <li class="diactive-feed">
                                                                    <div class="feed-user-img">
                                                                        <img src="assets/images/avatar-2.jpg" class="img-radius " alt="User-Profile-Image">
                                                                    </div>
                                                                    <h6><span class="label label-primary">comment</span> abc posted a task:  <span class="text-c-green">Design a new Homepage</span>  <small class="text-muted">6 hours ago</small></h6>
                                                                    <p class="m-b-15 m-t-15"> hii <b> @everone</b> Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                                                </li>
                                                                <li class="active-feed">
                                                                    <div class="feed-user-img">
                                                                        <img src="assets/images/avatar-3.jpg" class="img-radius " alt="User-Profile-Image">
                                                                    </div>
                                                                    <h6><span class="label label-warning">Task</span>Sarah marked : <span class="text-c-green"> do Icon Design</span><small class="text-muted">10 hours ago</small></h6>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- users visite and profile end -->

                                            </div>
                                        </div>

                                        <div id="styleSelector">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--[endif]-->
        <!-- Warning Section Ends -->
        <!-- Required Jquery -->
        <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script>
        <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script>
        <!-- jquery slimscroll js -->
        <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
        <!-- modernizr js -->
        <script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script>
        <!-- am chart -->
        <script src="assets/pages/widget/amchart/amcharts.min.js"></script>
        <script src="assets/pages/widget/amchart/serial.min.js"></script>
        <!-- Chart js -->
        <script type="text/javascript" src="assets/js/chart.js/Chart.js"></script>
        <!-- Todo js -->
        <script type="text/javascript " src="assets/pages/todo/todo.js "></script>
        <!-- Custom js -->
        <script type="text/javascript" src="assets/pages/dashboard/custom-dashboard.min.js"></script>
        <script type="text/javascript" src="assets/js/script.js"></script>
        <script type="text/javascript " src="assets/js/SmoothScroll.js"></script>
        <script src="assets/js/pcoded.min.js"></script>
        <script src="assets/js/vartical-demo.js"></script>
        <script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
    </body>
</html>
