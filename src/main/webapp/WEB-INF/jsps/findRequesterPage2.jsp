<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>Add File</title>
<%@ include file="commonParts/header.jsp" %> 
<%@ include file="css/mycss.jsp" %> 
</head>
<body>
<h2>File Management System</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h2>File Details</h2>
<table>
		<tr>
			<th>Unit Name</th>
			<th>File Type</th>
			<th>Customer Name</th>
			<th>Location Code</th>
			<th>Status</th>
		</tr>
			<tr>
				<td>${file.unitName}</td>
				<td>${file.fileType}</td>
				<td>${file.customerName}</td>
				<td><h3>${file.locationCode}</h3></td>
				<td>${file.status}</td>
			</tr>
	</table>
	<br>

<form action="requestersearch?fileId=${file.id}" method="post">

		Requester Name: <input type="text" name="name" /> <input type="submit"
			name="submit" value="Search" />

</form>

<br>
	<table>
		<tr>
			<th>Requester Name</th>
			<th>Email</th>
			<th>Department</th>
			<th>Phone</th>
			<th>Remark</th>
		</tr>
		<c:forEach items="${requesters}" var="requesters">
			<tr>
				<td>${requesters.requesterName}</td>
				<td>${requesters.email}</td>
				<td>${requesters.department}</td>
				<td>${requesters.phone}</td>
				<td><a href="newCompleteRequest?fileId=${file.id}&requesterId=${requesters.id}">Select</a></td>
			</tr>
		</c:forEach>
	</table>
	<h3>${msg}</h3>
	
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>