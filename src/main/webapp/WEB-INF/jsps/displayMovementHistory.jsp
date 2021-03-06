<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp"%>
<title>FMS: File Movement History</title>
<%@ include file="commonParts/header.jsp"%>
<%@ include file="css/mycss.jsp"%>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>
<script>
</script>
<script>
	$(document).ready(function() {
		 var baseurl = "http://localhost:9090/fms";
		/* var baseurl = "http://172.16.112.83:9090/fms"; */
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurl + "/showMvmtHistory", true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var allRequests = JSON.parse(xmlhttp.responseText);
				var t =	$("#example").DataTable({
					data : allRequests,
					"columns" : [ {
						"data" : null
					}, {
						"data" : "file.unitName"
					}, {
						"data" : "file.customerName"
					}, {
						"data" : "file.fileType"
					}, {
						"data" : "requester.requesterName"
					}, {
						"data" : "requester.email"
					}, {
						"data" : "requester.department"
					}, {
						"data" : "requester.phone"
					},
					{"data":"approvedBy"},
					{"data":"remarks"},
					{"data":"through"},
					{
						"data" : "issuedBy"
					}, {
						"data" : "issuedDate"
					}, {
						"data" : "dueDate"
					}, {
						"data" : "status"
					}, {
						"data" : "receivedDate"
					}, ],
				
				dom: 'Bfrtip',
		        buttons: ['excel' ],
					 "columnDefs": [ {
				            "searchable": false,
				            "orderable": false,
				            "targets": 0
				        } ],
				        "order": [[ 15, 'desc' ]]
				});
				t.on( 'order.dt search.dt', function () {
			        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			            cell.innerHTML = i+1;
			        } );
			    } ).draw();
			}
		};
		xmlhttp.send();
	});
</script>
</head>
<body>
	<h2>File Management System</h2>
	<br>
	<%@ include file="commonParts/buttons.jsp"%>
	<h3>File Movement History</h3>
	<form action="showSearchMovementHistory" method="post">

		Unit Name: <input type="text" name="unitName" /> <input type="submit"
			name="submit" value="search" />

	</form>
	<br>
		<table id="example" class="display nowrap" style="width: 100%">
			<thead>
				<tr>
				<th>S.No.</th>
					<th>Unit Name</th>
					<th>Customer Name</th>
					<th>File Type</th>
					<th>Requester Name</th>
					<th>Email</th>
					<th>Department</th>
					<th>Phone</th>
					<th>Approved By</th>
					<th>Purpose</th>
					<th>Through</th>
					<th>Issued By</th>
					<th>Issued Date</th>
					<th>Due Date</th>
					<th>Status</th>
					<th>Received Date</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
				<th>S.No.</th>
					<th>Unit Name</th>
					<th>Customer Name</th>
					<th>File Type</th>
					<th>Requester Name</th>
					<th>Email</th>
					<th>Department</th>
					<th>Phone</th>
					<th>Approved By</th>
					<th>Purpose</th>
					<th>Through</th>
					<th>Issued By</th>
					<th>Issued Date</th>
					<th>Due Date</th>
					<th>Status</th>
					<th>Received Date</th>
				</tr>
			</tfoot>
		</table>
	<h2>${msg}</h2>
	
	<%@ include file="commonParts/footer.jsp"%>
</body>
</html>
