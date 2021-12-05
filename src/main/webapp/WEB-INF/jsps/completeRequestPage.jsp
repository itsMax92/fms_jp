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
<h3>File Details</h3>
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

<h3>Requester Details</h3>
<table>
		<tr>
			<th>Requester Name</th>
			<th>Email</th>
			<th>Department</th>
			<th>Phone</th>
		</tr>showCompleteRequest
			<tr>
				<td>${requester.requesterName}</td>
				<td>${requester.email}</td>
				<td>${requester.department}</td>
				<td>${requester.phone}</td>
			</tr>
	</table>
<br>
<form action="completeRequest" method="post">
<pre>
Approved By:<input type="text" name="approvedBy"/>
Purpose:<input type="text" name="requesterPurpose"/>
Through:<input type="text" name="through"/>
<input type="submit" value="confirm"/>
<input type="hidden" name="fileId" value="${file.id}"/>
<input type="hidden" name="requesterId" value="${requester.id}"/>
</pre>
</form>
<br>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>