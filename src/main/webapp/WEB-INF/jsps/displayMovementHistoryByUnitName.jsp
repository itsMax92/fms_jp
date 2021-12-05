<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>FMS: File Movement History</title>
<%@ include file="commonParts/header.jsp" %>  
<%@ include file="css/mycss.jsp" %>
</head>
<body>
<h2>~~~</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>File Movement History by UnitName</h3>
<form action="showSearchMovementHistory" method="post">

		Unit Name: <input type="text" name="unitName" /> <input type="submit"
			name="submit" value="search" />

	</form>
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
			<th>Issued By</th>
			<th>Issued Date</th>
			<th>Due Date</th>
			<th>Remarks</th>
			<th>Status</th>
			<th>Received Date</th>
		</tr>
		<c:forEach items="${requests}" var="requests">
			<tr>
				<td>${requests.file.unitName}</td>
				<td>${requests.file.customerName}</td>
				<td>${requests.file.fileType}</td>
				<td>${requests.requester.requesterName}</td>
				<td>${requests.requester.email}</td>
				<td>${requests.requester.department}</td>
				<td>${requests.requester.phone}</td>
				<td>${requests.issuedBy}</td>
				<td>${requests.issuedDate}</td>
				<td>${requests.dueDate}</td>
				<td>${requests.remarks}</td>
				<td>${requests.status}</td>
				<td>${requests.receivedDate}</td>

				
			</tr>

		</c:forEach>
	</table>
</div>
<input type="button" id="btnExport" value=" Export to Excel " />
<h2>${msg}</h2>
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
