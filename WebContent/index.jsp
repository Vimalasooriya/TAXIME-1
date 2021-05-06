<%@page import="com.taxiMe.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app='calendarApp' ng-cloak='true'></html>
 

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - TaxiMe</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Article-Clean.css">
    <link rel="stylesheet" href="assets/css/calender.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
</head>

<body id="page-top">
<%
 User user = new User();
 user = (User)session.getAttribute("user");  
%>
    <div id="wrapper">
        <jsp:include page="header.jsp"/>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content" style="background: var(--bs-light);">
                 <jsp:include page="title.jsp"/>
                <div class="container-fluid" style="background: #ffffff;">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4" style="padding-top: 33px;">
                        <h3 class="text-dark mb-0">Dashboard</h3>
                        <%if (user != null && user.getUserType().equals("employee")){%>
                        <a class="btn btn-primary btn-sm d-none d-sm-inline-block" role="button" href="#" style="color: var(--bs-light);background: var(--bs-orange);border-style: none;border-color: var(--bs-orange);"><i class="fas fa-download fa-sm text-white-50"></i>&nbsp;Generate Report</a>
                   		<%} %>
                    </div>
                    <div class="row jello animated">
                        <div class="col" style="border-style: none;"><img class="tada animated" src="assets/img/flat-design-time-management-illustration_23-2148815998.webp"></div>
                      <%if (user != null && user.getUserType().equals("employee")){%>
                        <div class="col">
                            <div class="row">
                                <div class="col tada animated" style="padding-bottom: 50px;"></div>
                                <div class="col" style="padding-bottom: 50px;padding-right: 0px;padding-left: 0px;margin-bottom: -12px;"><a href="vehicleMaintaines.jsp" class="btn btn-primary bounce animated" type="button" style="width: 100px;height: 100px;border-top-left-radius: 50px;border-top-right-radius: 50px;border-style: none;background: var(--bs-orange);"><i class="fa fa-gears" style="margin-right: 13px;margin-left: 15px;"></i>vehicle maintains</a></div>
                                <div class="col" style="padding-bottom: 50px;"></div>
                            </div>
                            <div class="row">
                                <div class="col" style="margin-right: -50px;padding-right: 0px;padding-left: 0px;"><a href="addVehicle.jsp" class="btn btn-primary bounce animated" type="button" style="width: 100px;height: 100px;margin-right: 0px;margin-left: 0px;border-bottom-left-radius: 50px;border-top-left-radius: 50px;border-style: none;background: var(--bs-orange);"><i class="fa fa-plus" style="margin-right: 41px;margin-left: 32px;"></i>add vehicle</a></div>
                                <div class="col" style="border-style: none;"><img class="jello animated" src="assets/img/1.png" style="width: 100px;margin-left: 35px;border-top-left-radius: 50px;border-top-right-radius: 50px;border-bottom-right-radius: 50px;border-bottom-left-radius: 50px;border: 1px solid var(--bs-red);background-image: url(assets/img/1.png);background-position: center;background-size: cover;"></div>
                                <div class="col" style="padding-right: 0px;"><a href="AccedentCoverage.jsp" class="btn btn-primary bounce animated" type="button" style="width: 100px;height: 100px;margin-right: 0px;margin-left: 0px;border-bottom-right-radius: 50px;border-top-right-radius: 50px;border-style: none;background: var(--bs-orange);"><i class="fa fa-gears" style="margin-right: 13px;margin-left: 15px;"></i>accident coverage</a></div>
                            </div>
                              <div class="row">
                                <div class="col" style="margin-right: -50px;padding-right: 0px;padding-left: 0px;"></div>
                                <div class="col" style="padding-right: 0px;"><a href="resarvationManegment.jsp" class="btn btn-primary bounce animated" type="button" style="width: 100px;height: 100px;margin-right: 0px;margin-top:25px;margin-left: 11px;border-bottom-left-radius: 50px;border-bottom-right-radius: 50px;border-style: none;background: var(--bs-orange);"><i class="fa fa-car" style="margin-right: 13px;margin-left: 18px;"></i>add reservation</a></div>
                                <div class="col" style="margin-right: -50px;padding-right: 0px;padding-left: 0px;"></div>
                            </div>
                        </div>
                        <%} %>
                        <%if (user != null && user.getUserType().equals("customer")){%>
                        <div class="col">
                            <div class="row">
                                <div class="col tada animated" style="padding-bottom: 50px;"></div>
                                <div class="col" style="padding-bottom: 50px;padding-right: 0px;padding-left: 0px;margin-bottom: -12px;"><a href="resarvationManegment.jsp" class="btn btn-primary bounce animated" type="button" style="width: 100px;height: 100px;border-top-left-radius: 50px;border-top-right-radius: 50px;border-style: none;background: var(--bs-orange);"><i class="fa fa-car" style="margin-right: 13px;margin-left: 15px;"></i>Add reservation</a></div>
                                <div class="col" style="padding-bottom: 50px;"></div>
                            </div>
                             <div class="row">
                                <div class="col" style="margin-right: -50px;padding-right: 0px;padding-left: 0px;"></div>
                                <div class="col" style="border-style: none;"><img class="jello animated" src="assets/img/1.png" style="width: 100px;margin-left: 35px;border-top-left-radius: 50px;border-top-right-radius: 50px;border-bottom-right-radius: 50px;border-bottom-left-radius: 50px;border: 1px solid var(--bs-red);background-image: url(assets/img/1.png);background-position: center;background-size: cover;"></div>
                                <div class="col" style="padding-right: 0px;"></div>
                            </div>
                        </div>
                        <%} %>
                        <div class="col">

                            <div class="widget-container">
                                <div id="event_container" class="event-container">
                                  <div id="event_card_prev_day" class="event-card">
                                    <p class="event-day">Monday</p>
                                    <p class="event-date">1</p>
                                     
                                  </div>
                                  <div id="event_card_this_day" class="event-card">
                                    <p class="event-day">Tuesday</p>
                                    <p class="event-date">2</p>
                                     
                                  </div>
                                  <div id="event_card_next_day" class="event-card">
                                    <p class="event-day">Wednesday</p>
                                    <p class="event-date">3</p>
                                    
                                  </div>
                                </div>
                                <div id="calender_container" class="calender-container">
                                  <div id="prev_month" class="prev-month">
                                    <div class="month-and-year">January 2015</div>
                                    <ul class="all-days">
                                      <li>Sun</li>
                                      <li>Mon</li>
                                      <li>Tue</li>
                                      <li>Wed</li>
                                      <li>Thu</li>
                                      <li>Fri</li>
                                      <li>Sat</li>
                                    </ul>
                                    <ul class="all-date"></ul>
                                  </div>
                                  <div id="this_month" class="this-month">
                                    <div class="month-and-year">February 2015</div>
                                    <ul class="all-days">
                                      <li>Sun</li>
                                      <li>Mon</li>
                                      <li>Tue</li>
                                      <li>Wed</li>
                                      <li>Thu</li>
                                      <li>Fri</li>
                                      <li>Sat</li>
                                    </ul>
                                    <ul class="all-date"></ul>
                                  </div>
                                  <div id="next_month" class="next-month">
                                    <div class="month-and-year">March 2015</div>
                                    <ul class="all-days">
                                      <li>Sun</li>
                                      <li>Mon</li>
                                      <li>Tue</li>
                                      <li>Wed</li>
                                      <li>Thu</li>
                                      <li>Fri</li>
                                      <li>Sat</li>
                                    </ul>
                                    <ul class="all-date"></ul>
                                  </div>
                                </div>
                              </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © TaxiMe 2021</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="assets/js/calender.js"></script>  
</body>

</html>