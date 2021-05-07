<%@page import="com.taxiMe.model.Vehicle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.taxiMe.services.Svehicle"%>
<%@page import="com.taxiMe.interfaces.Ivehicle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="color: var(--bs-light);border-color: var(--bs-orange);height: 689px;">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register - TaxiMe</title>
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

<body class="bg-gradient-primary" style="border-color: var(--bs-orange);background: var(--bs-orange);">
    <div class="container" style="border-color: var(--bs-orange);">
        <div class="card shadow-lg o-hidden border-0 my-5">
            <div class="card-body p-0">
                <div class="row">
                    <a href="VehicleMaintainesManegment.jsp"><div class="col" style="width: 785px;"><button class="btn btn-primary" type="button" style="height: 100%;border-radius: 0px;border-style: none;"><i class="fa fa-arrow-left"></i></button></div></a>
                    <div class="col-lg-5 d-none d-lg-flex" style="height: 457px;width: 476px;"><img src="assets/img/1.png" style="width: 100%;"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h4 class="text-dark mb-4">Vehicle Maintains</h4>
                            </div>
                            <%Ivehicle vehicleService = new Svehicle();
                              ArrayList<Vehicle> vehicleNumberList = vehicleService.getVehicleList();
                             %>
                            <form class="user" action="addMaintain" method="post">
                                <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input class="form-control form-control-user" type="text" id="exampleFirstName-1" placeholder="Vehicle Number" name="VNumber" style="border-radius: 0px;" list="numberList" required="required">
                                      <datalist id="numberList">
                                     <%for(Vehicle vehicle :vehicleNumberList){ %>
								        <option value="<%=vehicle.getVehicleNumber()%>"><%=vehicle.getVehicleNumber()%> - owner: <%=vehicle.getOwnerName()%> - type :<%=vehicle.getType()%></option>
									 <%} %>
									  </datalist>
                                    </div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="exampleFirstName-2" placeholder="Status" name="status" style="border-radius: 0px;"></div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="number" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="QTY" name="qty" style="border-radius: 0px;width: 308px;"></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="number" id="exampleFirstName-2" placeholder="Part Id" name="part_id" style="border-radius: 0px;"></div>
                                </div>
                                <div class="mb-3"></div>
                                <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><label class="form-label">Date</label><input class="form-control" type="date" name="date" style="border-radius: 0px;"></div>
                                    <div class="col-sm-6" style="border-radius: 0px;"><textarea class="form-control" style="border-radius: 0px;height: 71px;" placeholder="Part Name and Description" name="des"></textarea></div>
                                </div>
                                <hr><button class="btn btn-primary d-block btn-user w-100" type="submit" style="border-radius: 0px;background: var(--bs-orange);border-color: var(--bs-orange);width: 527px;margin-bottom: 7px;">Submit</button><a href="VehicleMaintainesManegment.jsp" class="btn btn-primary d-block btn-user w-100" type="submit" style="border-radius: 0px;background: var(--bs-blue);border-color: var(--bs-blue);">View Table</button>
                                <hr>
                            </form>
                            <div class="text-center"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>