<%@page import="com.taxiMe.model.Resarvation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.taxiMe.services.Sresarvation"%>
<%@page import="com.taxiMe.interfaces.Iresarvation"%>
<%@page import="com.taxiMe.model.Employee"%>
<%@page import="com.taxiMe.services.Semployee"%>
<%@page import="com.taxiMe.interfaces.Iemployee"%>
<%@page import="com.taxiMe.model.Customer"%>
<%@page import="com.taxiMe.services.Scustomer"%>
<%@page import="com.taxiMe.interfaces.Icustomer"%>
<%@page import="com.taxiMe.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile - TaxiMe</title>
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/2.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/2.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/1.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/1.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/1.png">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Article-Clean.css">
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
            <div id="content">
                  <jsp:include page="title.jsp"/>
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Profile</h3>
                    <div class="row mb-3">
                       <%if (user != null && user.getUserType().equals("customer")){ %>
                       <%Icustomer customerService = new Scustomer();
                       	 Customer customer = customerService.getCustomer(user.getId());
                       %>
                        <div class="col-lg-6">
                            
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-header py-3">
                                            <p class="text-primary m-0 fw-bold">User Settings</p>
                                        </div>
                                        <div class="card-body">
                                             <form class="user" action="customerProfileUpdate" method="post">
				                                <div class="row mb-3">
				                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="fName" placeholder="Name" name="name" style="border-radius: 0px;" required="required" value="<%=customer.getName()%>"></div>
				                                </div>
				                                <input type="hidden" name="id" value="<%=customer.getId()%>">
				                                <div class="mb-3"><input class="form-control form-control-user" type="email" id="mail" aria-describedby="emailHelp" placeholder="Email Address" name="email" style="border-radius: 0px;" required="required" value="<%=customer.getMail()%>"></div>
				                                <div class="row mb-3">
				                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="tel" id="tel" placeholder="Telephone Number" name="tel" inputmode="tel" style="border-radius: 0px;" required="required" value="<%=customer.getTelephone()%>"></div>
				                                   <%String gender = customer.getGender();
				                                   	 switch(gender){
				                                   	 case "male":
				                                   %>
				                                    <div class="col-sm-6"><label class="form-label">Gender</label>
				                                        <div class="form-check" style="width: 116px;padding-left: 24px;"><input class="form-check-input" type="radio" id="male" name="gender" value="male" checked="checked"><label class="form-check-label" for="formCheck-1">Male</label></div>
				                                        <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="female" name="gender" value="female"><label class="form-check-label" for="formCheck-2">Female</label></div>
				                                    </div>
				                                    <%break;
				                                       case "female":%>
				                                    <div class="col-sm-6"><label class="form-label">Gender</label>
				                                        <div class="form-check" style="width: 116px;padding-left: 24px;"><input class="form-check-input" type="radio" id="male" name="gender" value="male"><label class="form-check-label" for="formCheck-1">Male</label></div>
				                                        <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="female" name="gender" value="female" checked="checked"><label class="form-check-label" for="formCheck-2">Female</label></div>
				                                    </div>
				                                    <%break;
				                                       default:%> 
				                                       <div class="col-sm-6"><label class="form-label">Gender</label>
				                                        <div class="form-check" style="width: 116px;padding-left: 24px;"><input class="form-check-input" type="radio" id="male" name="gender" value="male"><label class="form-check-label" for="formCheck-1">Male</label></div>
				                                        <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="female" name="gender" value="female"><label class="form-check-label" for="formCheck-2">Female</label></div>
				                                    </div> 
				                                    <%
				                                    break;
				                                   	 } %>
				                                </div>
				                                <div class="row mb-3" style="width: 100%;">
				                                </div>
				                                <hr>
				                                <div class="row mb-3">
				                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="examplePasswordInput-1" placeholder="User Name" name="uName" style="border-radius: 0px;" required="required"value="<%=customer.getUserName()%>"></div>
				                                    <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="exampleRepeatPasswordInput" placeholder="Password" name="password" style="border-radius: 0px;" required="required" value="<%=customer.getPassword()%>"></div>
				                                </div><button class="btn btn-primary d-block btn-user w-100" type="submit" style="border-radius: 0px;background: var(--bs-orange);border-color: var(--bs-orange);">Save details</button>
				                                <hr>
				                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-lg-6">
                            <div class="card mb-3">
                            <div class="card-header py-3">
                                            <p class="text-primary m-0 fw-bold">Reservations</p>
                                        </div>
                                <%
                                Iresarvation resarvationService = new Sresarvation();
                                ArrayList<Resarvation> resarvationlist = resarvationService.getResarvationByUserId(user.getId());
                                %>
                                <div class="card-body text-center shadow">
 								<table class="table table-responsive table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">From</th>
                                            <th scope="col">To</th>
                                            <th scope="col">Status</th> 
                                            <th scope="col">Action</th>                                                                                        
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <%for (Resarvation resarvation : resarvationlist) {%>
                                        <tr> 
                                            <th  scope="row"><%=resarvation.getId() %></th>
                                            <td><%=resarvation.getDate() %> <%=resarvation.getTime() %></td>
                                            <td><%=resarvation.getPickupLocation() %></td>
                                            <td><%=resarvation.getDropLocation() %></td>
                                              <td>
                                            <%if(resarvation.getStatus().equals("Assinged")) {%>
                                            	<p class="text-success"><%=resarvation.getStatus() %></p>
                                            <%} %>
                                            <%if(resarvation.getStatus().equals("Pending")) {%>
                                            	<p class="text-warning"><%=resarvation.getStatus() %></p>
                                            <%} %>
                                            <%if(resarvation.getStatus().equals("Cancled")) {%>
                                            	<p class="text-danger"><%=resarvation.getStatus() %></p>
                                            <%} %>
                                            <%if(resarvation.getStatus().equals("Finished")) {%>
                                            	<p class="text-info"><%=resarvation.getStatus() %></p>
                                            <%} %>
                                            </td>
											 <td>
											<div class="row">
												<%if(!resarvation.getStatus().equals("Cancled") ){ %>
												<%if(!resarvation.getStatus().equals("Finished") ) {%>
												<div class ="col-md-2" style="margin:2px;">
													<a href="ChangeResarvationStatus?id=<%=resarvation.getId() %>&status=Cancled&vid=<%=resarvation.getVehicleId() %>" class="btn-sm btn-secondary bg-danger" style="color:white;"><i class="fa fa-trash"></i></a>
												</div>
												<%} %>
												<%if(!resarvation.getStatus().equals("Finished") ) {%>
												<%if(!resarvation.getStatus().equals("Pending") ) {%>
												<div class ="col-md-2" style="margin:2px;">
													<a href="ChangeResarvationStatus?id=<%=resarvation.getId() %>&status=Finished&vid=<%=resarvation.getVehicleId() %>" class="btn-sm btn-secondary bg-success" style="color:white;"><i class="fa fa-check"></i></a>
												</div>
												<%}} %>
												<%} %>
												<%if(resarvation.getStatus().equals("Pending") || resarvation.getStatus().equals("Assinged") ) {%>
												<div class ="col-md-2" style="margin:2px;">
													<a href="updateResarvation.jsp?id=<%=resarvation.getId() %> " class="btn-sm btn-secondary" ><i class="fa fa-pencil"></i></a>
												</div>
												<%} %>
											</div>
										  </td>
										</tr>
										<%} %>
										 
                                    </tbody>
                                </table>
                                </div>
                            </div>
                        </div>
                        <%} %>
                        <%if (user != null && user.getUserType().equals("employee")){ %>
                        <%Iemployee employeeService = new Semployee();
                       	 Employee employee = employeeService.getEmployee(user.getId());
                       %>
                        <div class="col-lg-12">
                            
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-header py-3">
                                            <p class="text-primary m-0 fw-bold">User Settings</p>
                                        </div>
                                        <div class="card-body">
                                              <form class="user" action="employeeProfileUpdate" method="post">
				                                <div class="row mb-3">
				                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="exampleFirstName-1" placeholder="First Name" name="name" style="border-radius: 0px;" required="required" value="<%=employee.getName()%>"></div>
				                                   </div>
				                                <div class="mb-3"><input class="form-control form-control-user" type="email" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Email Address" name="email" style="border-radius: 0px;" required="required" value="<%=employee.getMail()%>"></div>
				                                <div class="row mb-3">
				                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="tel" id="tel" placeholder="Telephone Number" name="tel" inputmode="tel" style="border-radius: 0px;"required="required" value="<%=employee.getTelephone()%>"></div>
				                                    <div class="col-sm-6"><input class="form-control form-control-user" type="number" id="age" placeholder="Age" name="age" inputmode="numeric" style="border-radius: 0px;" required="required" value="<%=employee.getAge()%>"></div>
				                                </div>
				                                <div class="row mb-3" style="width: 100%;">
				                                    <div class="col-12 col-sm-6 text-start mb-3 mb-sm-0" style="width: 737px;"><textarea class="form-control form-control-lg" name="address" placeholder="Address" style="border-radius: 0px;width: 636px;height: 53.2px;font-size: 12.8px;"><%=employee.getAddress() %></textarea></div>
				                                </div>
				                                <hr>
				                                
				                                <input type="hidden" name="id" value="<%=employee.getId()%>">
				                                <div class="row mb-3">
				                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="uname" placeholder="User Name" name="uName" style="border-radius: 0px;" required="required" value="<%=employee.getUserName()%>"></div>
				                                    <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="exampleRepeatPasswordInput" placeholder="Password" name="password" style="border-radius: 0px;" required="required" value="<%=employee.getPassword()%>"></div>
				                                </div><button class="btn btn-primary d-block btn-user w-100" type="submit" style="border-radius: 0px;border-color: var(--bs-orange);background: var(--bs-orange);">Save details</button>
				                                <hr>
				                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%} %>
                        
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>