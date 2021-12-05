<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>FMS:Pending Files Over Due Date</title>
<%@ include file="commonParts/header.jsp" %> 
<%@ include file="css/mycss.jsp" %> 
</head>
<body>
<h2>~~~</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>Pending Files Over Due Date</h3>
	<table class="css-serial">
		<tr>
			<th>S.No.</th>
			<th>File Name</th>
			<th>Customer Name</th>
			<th>Requester Name</th>
			<th>Department</th>
			<th>Issued By</th>
			<th>Issued Date</th>
			<th>Due Date</th>
			<th>Remarks</th>
			<th>Status</th>
		</tr>
		<c:forEach items="${requests}" var="requests">
			<tr>
			<td></td>
				<td>${requests.file.unitName}</td>
				<td>${requests.file.customerName}</td>
				<td>${requests.requester.requesterName}</td>
				<td>${requests.requester.department}</td>
				<td>${requests.issuedBy}</td>
				<td>${requests.issuedDate}</td>
				<td>${requests.dueDate}</td>
				<td>${requests.remarks}</td>
				<td>${requests.status}</td>
			</tr>

		</c:forEach>
	</table>
<script>
$(document).ready(function() {
    var i = 1
    $('table tr').each(function(index) {
        $(this).find('td:nth-child(1)').jsp(index+1);
    });
};
</script>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>
