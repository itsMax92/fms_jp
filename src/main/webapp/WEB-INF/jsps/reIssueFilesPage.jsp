<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="commonParts/meta.jsp" %>  
<title>Re Issue Files</title>
  <!-- Main CSS-->
    <link href="css/theme.css" rel="stylesheet" media="all">
<%@ include file="commonParts/header.jsp" %> 
<%@ include file="css/mycss.jsp" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
</head>
<body class="animsition">
<%-- <body class="animsition" onload="myChartFunction(${dailyIssuedFiles})"> --%>
<h2>File Management System</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<br>
<div class="page-wrapper">

<!-- PAGE CONTAINER-->
<div class="page-container">
    <!-- HEADER DESKTOP-->

<!-- HEADER DESKTOP-->

<!-- MAIN CONTENT-->
<div class="main-content">
<div class="section__content section__content--p30">
<div class="container-fluid">
<div class="row">
<div class="col-lg-6">
<form action="showIssuedFile" method="post">

	Unit Name: <input type="text" id="input2-group2" name="unitName" class="form-control" placeholder="Unit Name" /> 
	<input type="submit" class="btn btn-primary" name="submit" value="Search" />

</form>
</div>
</div>
<br>
<div class="row">
<div class="col-lg-6">
            <div class="card">
            <form action="updateFileRequest" method="post">
                <div class="card-header">
                    <strong>File Re Issue</strong>
                </div>
                <div class="card-body card-block">
                    <div class="form-group">
                        <label for="id" class=" form-control-label">File Request ID</label>
                        <input type="text" name="id" placeholder="Id" value="${fileRequest.id}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="unitName" class=" form-control-label">Unit Name</label>
                        <input type="text" name="unitName" placeholder="Unit Name" value="${fileRequest.file.unitName}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="customerName" class=" form-control-label">Customer Name</label>
                        <input type="text" name="customerName" placeholder="Customer Name" value="${fileRequest.file.customerName}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="requesterName" class=" form-control-label">Requester Name</label>
                        <input type="text" name="requesterName" placeholder="Enter Requester Name" value="${fileRequest.requester.requesterName}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="department" class=" form-control-label">Department</label>
                        <input type="text" name="department" placeholder="Enter Department Name" value="${fileRequest.requester.department}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="reIssuedDate" class=" form-control-label">In Transit Issuer Name and Date</label>
                        <input type="text" name="inTransitIssuerNameAndDate" placeholder="Enter Re Transit Issuer Name and Date" value="${fileRequest.inTransitIssuerNameAndDate}" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="reApprovedBy" class=" form-control-label">Re Issue Approved By</label>
                        <input type="text" name="reApprovedBy" placeholder="Enter Re Issue Approved By" value="${fileRequest.reApprovedBy}" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="approvedBy" class=" form-control-label">Approved By</label>
                        <input type="text" name="approvedBy" placeholder="Enter Approved By" value="${fileRequest.approvedBy}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="purpose" class=" form-control-label">Purpose</label>
                        <input type="text" name="purpose" placeholder="Enter Purpose" value="${fileRequest.remarks}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="through" class=" form-control-label">Through</label>
                        <input type="text" name="through" placeholder="Enter Through" value="${fileRequest.through}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="issuedBy" class=" form-control-label">Issued By</label>
                        <input type="text" name="issuedBy" placeholder="Enter Issued By" value="${fileRequest.issuedBy}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="issuedDate" class=" form-control-label">Issued Date</label>
                        <input type="text" name="issuedDate" placeholder="Enter Issued Date" value="${fileRequest.issuedDate}" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="dueDate" class=" form-control-label">Due Date</label>
                        <input type="text" name="dueDate" placeholder="Enter Due Date" value="${fileRequest.dueDate}" class="form-control" id="datepicker">
                         <script>
                                $('#datepicker').datepicker({
                                    format: 'yyyy-mm-dd',
                                    uiLibrary: 'bootstrap'
                                });
                            </script>
                    </div>
                    <div class="form-group">
                        <label for="status" class=" form-control-label">Status</label>
                        <input type="text" name="status" placeholder="Enter Status" value="${fileRequest.status}" class="form-control" readonly>
                    </div>
                </div>
                <input type="submit" class="btn btn-primary" name="submit" value="Save" />
                </form>
                <h2>${msg}</h2>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<!-- END MAIN CONTENT-->
<!-- END PAGE CONTAINER-->
</div>

    </div>
<%@ include file="commonParts/footer.jsp" %>
<!-- Jquery JS-->

    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="js/main.js"></script>
</body>
</html>