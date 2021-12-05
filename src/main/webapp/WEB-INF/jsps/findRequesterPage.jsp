<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>Issue Files</title>
<%@ include file="commonParts/header.jsp" %> 
<%@ include file="css/mycss.jsp" %> 
</head>
<body>
<h2>File Management System</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h2>Requester Details</h2>
<br>

<form action="requestersearch" method="post">

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
				<td><a href="showCompleteRequest?requesterId=${requesters.id}">Select</a></td>
			</tr>
		</c:forEach>
	</table>
	<h3>${msg}</h3>
	
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>