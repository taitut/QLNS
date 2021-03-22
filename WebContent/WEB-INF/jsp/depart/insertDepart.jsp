<%-- 
    Document   : insertUser
    Created on : Jan 4, 2020, 1:08:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><s:message code="global.insert"/> <s:message code="global.menu.depart"/></title>
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
        <style>
            .loi{
                color: red;
                font-style: italic;
                font-size: 12px;
            }
        </style>
    </head>
    <body>
    <body>
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

                <jsp:include page="../header-nav.jsp" />
                <div class="pcoded-main-container">
                    <div class="pcoded-wrapper">
                        <jsp:include page="../menu-side.jsp" />
                        <div class="pcoded-content">
                            <div class="pcoded-inner-content">

                                <div class="main-body">
                                    <div class="page-wrapper">

                                        <!-- Page-header start -->
                                        <div class="page-header card">
                                            <div class="card-block">
                                                <h5 class="m-b-10">User</h5>
                                                <p class="text-muted m-b-10"></p>
                                                <ul class="breadcrumb-title b-t-default p-t-10">
                                                    <li class="breadcrumb-item">
                                                        <a href="index.html"> <i class="fa fa-home"></i> </a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="user/admin.htm"><s:message code="global.main"/></a>
                                                    </li>
                                                    <li class="breadcrumb-item"><a href="#!"><s:message code="global.insert"/></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- Page-header end -->


                                        <div class="page-body">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5 class="${check}" >${message}</h5>
                                                            <div class="card-header-right"><i
                                                                    class="icofont icofont-spinner-alt-5"></i></div>

                                                            <div class="card-header-right">
                                                                <i class="icofont icofont-spinner-alt-5"></i>
                                                            </div>
                                                        </div>
                                                        <div class="card-block">
                                                            <h4 class="sub-title"><s:message code="global.insert"/></h4>
                                                            <form:form action="depart/insert.htm" modelAttribute="depart">
                                                                <div class="form-group row">
                                                                    <label class="col-sm-2 col-form-label"><s:message code="global.id"/></label>
                                                                    <div class="col-sm-10">
                                                                        <form:input cssClass="form-control" maxlength="10" path="id"/>
                                                                        <c:set var="checkiddepart"><form:errors path="id"/></c:set>
                                                                        <c:if test="${ not empty checkiddepart}">
                                                                            <div class="loi"><s:message code="global.check.iddepart"/></div>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-sm-2 col-form-label"><s:message code="global.name"/></label>
                                                                    <div class="col-sm-10">
                                                                        <form:input cssClass="form-control" maxlength="50" path="name"/>
                                                                        <c:set var="checkname"><form:errors path="name"/></c:set>
                                                                        <c:if test="${ not empty checkname}">
                                                                            <div class="loi"><s:message code="global.check.name"/></div>
                                                                        </c:if>
                                                                    </div>
                                                                </div>
                                                                <a href="depart/depart.htm"  class="btn btn-primary" style="float:right;margin-left:10px;"><s:message code="global.cancel"/></a>
                                                                <button style="float:right;" class="btn btn-primary">
                                                                    <s:message code="global.insert"/>
                                                                </button>
                                                            </form:form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
        <!-- Required Jquery -->
        <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script>
        <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script>
        <!-- jquery slimscroll js -->
        <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
        <!-- modernizr js -->
        <script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script>
        <script type="text/javascript" src="assets/js/modernizr/css-scrollbars.js"></script>

        <!-- Custom js -->
        <script type="text/javascript" src="assets/js/script.js"></script>
        <script src="assets/js/pcoded.min.js"></script>
        <script src="assets/js/vartical-demo.js"></script>
        <script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
    </body>
</html>
