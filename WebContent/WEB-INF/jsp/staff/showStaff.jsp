

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><s:message code="global.menu.staff"/></title>
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
                                                    <li class="breadcrumb-item"><a href="staff/staff.htm"><s:message code="global.menu.staff"/></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- Page-header end -->

                                        <div class="page-body">
                                            <div class="card">
                                                <div class="card-header">
                                                    <!-- <label class="col-sm-2 col-form-label">Search</label><br>-->
                                                    <form action="staff/search.htm" method="post" >
                                                        <input type="text"  name="name" class="form-control" style="width:300px;height:40px;display:inline"/>
                                                        <button class="btn btn-primary" style="margin-left:10px;">Search</button>
                                                    </form>
                                                    <div class="card-header-right">
                                                        <ul class="list-unstyled card-option">
                                                            <li><i class="fa fa-chevron-left"></i></li>
                                                            <li>
                                                                <i class="fa fa-window-maximize full-card"></i>
                                                            </li>
                                                            <li><i class="fa fa-minus minimize-card"></i></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="card-block table-border-style">
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <tr>
                                                                <th><s:message code="global.id"/></th>
                                                                <th><s:message code="global.fullname"/></th>
                                                                <th><s:message code="global.sexual"/></th>
                                                                <th><s:message code="global.birthday"/></th>
                                                                <th>Email</th>
                                                                <th><s:message code="global.phone"/></th>
                                                                <th><s:message code="global.level"/></th>
                                                                <th><s:message code="global.salary"/></th>
                                                                <th><s:message code="global.note"/></th>
                                                                <th><s:message code="global.departID"/></th>
                                                                <th><s:message code="global.image"/></th>
                                                                <th><s:message code="global.update"/></th>
                                                                <th><s:message code="global.delete"/></th>
                                                            </tr>
                                                            <c:set var="count" value="0"/>
                                                            <c:forEach var="u" items="${staffs}">
                                                                <c:set var="count" value="${count+1}"/>
                                                                <tr>
                                                                <form action="staff/update.htm"  method="post">
                                                                    <td>
                                                                        <input type="hidden" name="ma" value="${u.ma}"/>${u.ma}
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="name" value="${u.name}"/>${u.name}
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="gender" value="${u.gender}"/>${u.gender?'Nam':'Nữ'}
                                                                    </td>
                                                                    <td>
                                                                        <f:formatDate value="${u.birthday}" var="dateString" pattern="dd/MM/yyyy"/>
                                                                        <input type="hidden" name="birthday" value="${u.birthday}"/>${u.birthday}
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="email" value="${u.email}"/>${u.email}
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="phone" value="${u.phone}"/>${u.phone}
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="level" value="${u.level}"/>${u.level}
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="salary" value="${u.salary}"/>${u.salary}
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="notes" value="${u.notes}"/>${u.notes}
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="departID" value="${u.depart.id}"/>${u.depart.id}
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="photo" value="${u.photo}"/><img src="assets/images/${u.photo}" width="100px"/>
                                                                    </td>
                                                                    <td><button class="btn btn-primary"><s:message code="global.update"/></button></td>
                                                                </form>
                                                                <form:form action="staff/delete.htm" modelAttribute="staff" method="post">
                                                                    <td><form:hidden path="ma" value="${u.ma}"/>
                                                                        <form:hidden path="name" value="${u.name}"/>
                                                                        <form:hidden path="gender" value="${u.gender}"/>
                                                                        <form:hidden path="birthday" value="${dateString}"/>
                                                                        <form:hidden path="photo" value="${u.photo}"/>
                                                                        <form:hidden path="level" value="${u.level}"/>
                                                                        <form:hidden path="email" value="${u.email}"/>
                                                                        <form:hidden path="phone" value="${u.phone}"/>
                                                                        <form:hidden path="salary" value="${u.salary}"/>
                                                                        <form:hidden path="notes" value="${u.notes}"/>
                                                                        <form:hidden path="depart.id" value="${u.depart.id}"/>
                                                                        <button class="btn btn-primary"><s:message code="global.delete"/></button></td>
                                                                    </form:form>
                                                                </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="staff/insertStaff.htm"  class="btn btn-primary" style="float:right;margin-left:10px;"><s:message code="global.insert"/></a>
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
        </div>-->
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
