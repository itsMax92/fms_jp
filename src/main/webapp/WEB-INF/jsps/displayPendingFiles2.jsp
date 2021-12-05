<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>JP:FMS</title>
<%@ include file="commonParts/header.jsp" %> 
<%@ include file="css/mycss.jsp" %> 
</head>
<body>
<h2>File Management System</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>Pending Files</h3>
<div id="dvData">
	<table>
		<tr>
			<th>File Name</th>
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
			<th>Remarks</th>
			<th>Status</th>
		</tr>
		<c:forEach items="${allRequests}" var="allRequests">
			<tr>
				<td>${allRequests.file.unitName}</td>
				<td>${allRequests.file.customerName}</td>
				<td>${allRequests.file.fileType}</td>
				<td>${allRequests.requester.requesterName}</td>
				<td>${allRequests.requester.email}</td>
				<td>${allRequests.requester.department}</td>
				<td>${allRequests.requester.phone}</td>
				<td>${allRequests.approvedBy}</td>
				<td>${allRequests.remarks}</td>
				<td>${allRequests.through}</td>
				<td>${allRequests.issuedBy}</td>
				<td>${allRequests.issuedDate}</td>
				<td>${allRequests.dueDate}</td>
				<td>${allRequests.remarks}</td>
				<td>${allRequests.status}</td>
				
			</tr>

		</c:forEach>
		 <tfoot>
		 <tr>
			<th>File Name</th>
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
			<th>Remarks</th>
			<th>Status</th>
		</tr>
		 </tfoot>
	</table>
</div>
<input type="button" id="btnExport" value=" Export to Excel " />
	<script>
		$("#btnExport").click(
				function(e) {
					window.open('data:application/vnd.ms-excel,'
							+ $('#dvData').html());
					e.preventDefault();
				});
	</script>


<%@ include file="commonParts/footer.jsp" %>
</body>
</html>
