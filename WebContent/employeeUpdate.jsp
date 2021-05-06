<%@page import="com.taxiMe.model.Employee"%>
<%@page import="com.taxiMe.services.Semployee"%>
<%@page import="com.taxiMe.interfaces.Iemployee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="color: var(--bs-light);border-color: var(--bs-orange);">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register - TaxiMe</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Article-Clean.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
</head>

<body class="bg-gradient-primary" style="border-color: var(--bs-orange);background: var(--bs-orange);">
    <div class="container" style="border-color: var(--bs-orange);">
        <div class="card shadow-lg o-hidden border-0 my-5">
            <div class="card-body p-0">
                <div class="row">
                    <a href="employeeManegment.jsp"><div class="col" style="width: 785px;"><button class="btn btn-primary" type="button" style="height: 100%;border-radius: 0px;border-style: none;"><i class="fa fa-arrow-left"></i></button></div></a>
                    <div class="col-lg-5 d-none d-lg-flex" style="height: 457px;width: 476px;"><img src="assets/img/1.png" style="width: 100%;"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h4 class="text-dark mb-4">Update Employee details</h4>
                            </div>
                            <%
                            int id = Integer.parseInt(request.getParameter("id"));
                            Iemployee employeeService = new Semployee();
                            Employee employee = employeeService.getEmployee(id);
                            %>
                            <form class="user" action="updateEmployee" method="post">
                                <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="exampleFirstName-1" placeholder="Name" name="name" style="border-radius: 0px;" required="required" value="<%=employee.getName()%>"></div> 
                                </div>
                                <div class="mb-3"><input class="form-control form-control-user" type="email" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Email Address" name="email" style="border-radius: 0px;" required="required" value="<%=employee.getMail()%>"></div>
                                <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="tel" id="tel" placeholder="Telephone Number" name="tel" inputmode="tel" style="border-radius: 0px;" required="required" value="<%=employee.getTelephone()%>"></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="number" id="age" placeholder="Age" name="age" inputmode="numeric" style="border-radius: 0px;" required="required" value="<%=employee.getAge()%>"></div>
                                </div>
                                 <input type="hidden" name="id" value="<%=employee.getId()%>">
                                 <input type="hidden" name="uName" value="<%=employee.getUserName()%>">
                                 <input type="hidden" name="password" value="<%=employee.getPassword()%>">
                                <div class="row mb-3" style="width: 100%;">
                                    <div class="col-12 col-sm-6 text-start mb-3 mb-sm-0" style="width: 737px;"><textarea class="form-control form-control-lg" name="address" placeholder="Address" style="border-radius: 0px;width: 636px;height: 53.2px;font-size: 12.8px;"><%=employee.getAddress() %></textarea></div>
                                </div>
                                <hr>
                                <div class="row mb-3"></div><button class="btn btn-primary d-block btn-user w-100" type="submit" style="border-radius: 0px;border-color: var(--bs-orange);background: var(--bs-orange);">Update details</button>
                                <hr>
                            </form>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>