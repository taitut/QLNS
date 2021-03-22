<%-- 
    Document   : menu-side
    Created on : Jan 4, 2020, 11:13:35 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="pcoded-navbar">
            <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
            <div class="pcoded-inner-navbar main-menu">

                <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Layout</div>
                <ul class="pcoded-item pcoded-left-item">
                    <li class="active">
                        <a href="user/admin.htm">
                            <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                            <span class="pcoded-mtext" data-i18n="nav.dash.main"><s:message code="global.main"/></span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>
                    <li class="pcoded-hasmenu">
                        <a href="javascript:void(0)">
                            <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                            <span class="pcoded-mtext"  data-i18n="nav.basic-components.main"><s:message code="global.menu.management"/></span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                        <ul class="pcoded-submenu">
                            <li class=" ">
                                <a href="user/user.htm">
                                    <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.basic-components.alert"><s:message code="global.menu.user"/></span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li class=" ">
                                <a href="depart/depart.htm">
                                    <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs"><s:message code="global.menu.depart"/></span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li class=" ">
                                <a href="staff/staff.htm">
                                    <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.basic-components.alert"><s:message code="global.menu.staff"/></span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li class=" ">
                                <a href="record/record.htm">
                                    <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs"><s:message code="global.menu.record"/></span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li class=" ">
                                <a href="summarise/summarise.htm">
                                    <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs"><s:message code="global.menu.summarise"/></span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="pcoded-hasmenu">
                        <a href="javascript:void(0)">
                            <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                            <span class="pcoded-mtext"  data-i18n="nav.basic-components.main"><s:message code="global.menu.language"/></span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                        <ul class="pcoded-submenu">
                            <li class=" ">
                                <a href="user/en.htm">
                                    <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">English</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                            <li class=" ">
                                <a href="user/vi.htm">
                                    <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                    <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">Tiếng Việt</span>
                                    <span class="pcoded-mcaret"></span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    
                </ul>
            </div>
        </nav>
    </body>
</html>
