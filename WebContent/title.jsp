<%@page import="com.taxiMe.model.User"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 User user = new User();
 user = (User)session.getAttribute("user");  
%>
<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <form class="d-none d-sm-inline-block me-auto ms-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group"></div>
                        </form>
                        <ul class="navbar-nav flex-nowrap ms-auto">
                         <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="me-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            
                            <div class="d-none d-sm-block topbar-divider"></div>
                             <% if(user == null){ %>
                            <li class="nav-item dropdown no-arrow">
                            <div class="nav-item dropdown  no-arrow"><a class="btn btn-danger nav-link" href="login.jsp" style="height: 50px;"><i class="fa fa-sign-in "></i><span class="d-none d-lg-inline me-2 mt-5 mb-5 text-white-600 small" > &nbsp;Sign in</span></a></div>
                            </li>
                             <%}else {%>
                              <li class="nav-item dropdown no-arrow">
                            	<div class="nav-item dropdown  no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="true" data-bs-toggle="dropdown" href="#"><span class="d-none d-lg-inline me-2 text-gray-600 small"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;<%=user.getUserName() %></span></a> 
                                <div class="dropdown-menu hide shadow dropdown-menu-end animated--grow-in"><a class="dropdown-item" href="profile.jsp"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a>
                                        <div class="dropdown-divider"></div><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a>
                                    </div>
                                </div>
                            </li>
                              <%} %>
                        </ul>
                    </div>
                </nav>