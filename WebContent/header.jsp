<%@page import="com.taxiMe.model.User"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 User user = new User();
 user = (User)session.getAttribute("user");  
%>
   <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: linear-gradient(var(--bs-orange), var(--bs-red));width: 227px;">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-text mx-3"><span>TaxiMe</span></div><img src="assets/img/2.png" style="width: 66px;height: 72px;">
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="index.jsp" style="border-style: none;">
                    	<i class="fas fa-tachometer-alt"></i>
                    	<span>&nbsp;Dashboard</span></a>
                    </li>
                     <%if(user != null && user.getUserType().equals("employee")) {%>
                    <hr class="sidebar-divider">
                    <div class="sidebar-heading"></div>
                    <li class="nav-item">
                        <div>
                        	<a class="btn btn-link nav-link  no-arrow" data-bs-toggle="collapse" aria-expanded="true" aria-controls="collapse-2" href="#collapse-2" role="button" style="border-style: none;">
                        	<i class="fas fa-bars"></i>&nbsp;<span>Tables</span></a>
                            <div class="collapse " id="collapse-2">
                                <div class="bg-white border rounded py-2 collapse-inner" style=" border-style: none;border-color: rgb(78,110,205);width: 209.087px;margin-left: -9px;">
	                                <a class="collapse-item" href="CustomerManegment.jsp">
	                                <i class="fa fa-user" style="margin-right: 19px;margin-left: -12px;"></i>Customer management&nbsp;</a>
	                                <a class="collapse-item" href="employeeManegment.jsp">
	                                <i class="fa fa-users" style="margin-right: 19px;margin-left: -12px;"></i>Employee Management</a>
	                                <a class="collapse-item" href="resarvationManegment.jsp">
	                                <i class="fa fa-check-square" style="margin-right: 19px;margin-left: -12px;"></i>Reservation Management</a>
	                                <a class="collapse-item" href="VehicleManegment.jsp">
	                                <i class="fa fa-cab" style="margin-right: 19px;margin-left: -12px;"></i>Vehicle Manegment</a>
	                                <a class="collapse-item" href="AccidentManegment.jsp">
	                                <i class="fa fa-fire-extinguisher" style="margin-right: 19px;margin-left: -12px;"></i>Accident Coverage&nbsp;</a>
	                                <a class="collapse-item" href="VehicleMaintainesManegment.jsp">
	                                <i class="fa fa-wrench" style="margin-right: 19px;margin-left: -12px;"></i>Vehicle Maintain</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <%} 
                     if(user != null) {%>
                    
                    <li class="nav-item">
                        <hr class="sidebar-divider">
                        <a class="nav-link" href="profile.jsp">
                        <i class="fas fa-user-circle"></i>
                        <span>User Profile</span></a>
                    </li>
                    <%} %>
                     <%if(user != null && user.getUserType().equals("customer")) {%>
                    <li class="nav-item">
                        <hr class="sidebar-divider">
                        <a class="nav-link" href="resarvationManegment.jsp">
                        <i class="fas fa-car"></i>
                        <span>Reservation</span></a>
                    </li>
                    <%} %>
                    <li class="nav-item">
                        <hr class="sidebar-divider">
                        <a class="nav-link" href="aboutUs.jsp">
                        <i class="fas fa-info"></i>
                        <span>About Us</span></a>
                    </li>
                     <%if(user == null) {%>
                    <div class="sidebar-heading"></div>
                    <li class="nav-item">
                        <hr class="sidebar-divider">
                        <a class="nav-link" href="login.jsp">
                        <i class="fas fa-sign-in-alt"></i>
                        <span>&nbsp;Sign in</span></a>
                    </li>
                     <%}if(user != null) {%>
                     <div class="sidebar-heading"></div>
                    <li class="nav-item">
                    <a class="nav-link" href="logout">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>&nbsp;Sign Out</span></a></li>
                    <%} %>
                </ul>
                <div class="text-center d-none d-md-inline">
              	  <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"> </i></button>
                </div>
            </div>
        </nav>