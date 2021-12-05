<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>FMS:Pending Files</title>
<%@ include file="commonParts/header.jsp" %>
<%@ include file="css/mycss.jsp" %>
</head>
<body>
<h2>File Management System</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>Search Pending Files By Requester Name</h3>
<form action="searchPendingFileByRequesterName" method="post">

		Requester Name: <input type="text" name="requesterName" /> <input type="submit"
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

				
			</tr>

		</c:forEach>
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
<h2>${msg}</h2>

<%@ include file="commonParts/footer.jsp" %>
</body>
</html>
