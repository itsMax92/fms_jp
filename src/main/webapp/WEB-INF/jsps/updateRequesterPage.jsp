<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>FMS: Files</title>
<%@ include file="commonParts/header.jsp" %>  
<%@ include file="css/mycss.jsp" %>
</head>
<body>
<h2>~~~</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>Update Requester</h3>
<form action="searchRequester" method="post">

		Requester Name: <input type="text" name="requesterName" /> 
		<input type="submit" name="submit" value="search" />

	</form>
<div id="dvData">	
	<table>
		<tr>
			<th>Requester Name</th>
			<th>Email</th>
			<th>Department</th>
			<th>Phone</th>
			<th>To update</th>
		</tr>
		<c:forEach items="${requesters}" var="requesters">
			<tr>
				<td>${requesters.requesterName}</td>
				<td>${requesters.email}</td>
				<td>${requesters.department}</td>
				<td>${requesters.phone}</td>
				<td><a href="editRequester?requesterId=${requesters.id}">Select</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
	<h2>${msg}</h2>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>