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
<h3>Issue Files</h3>
	<form action="search" method="post">

		Unit Name: <input type="text" name="unitName" /> <input type="submit"
			name="submit" value="search" />

	</form>
	<br>
	
	<table>
		<tr>
			<th>Unit Name</th>
			<th>File Type</th>
			<th>Customer Name</th>
			<th>Location Code</th>
			<th>Status</th>
			<th>Click to Issue</th>
			<th>Click to Issue</th>
		</tr>
		<c:forEach items="${files}" var="files">
			<tr>
				<td>${files.unitName}</td>
				<td>${files.fileType}</td>
				<td>${files.customerName}</td>
				<td>${files.locationCode}</td>
				<td>${files.status}</td>
				<td>
				</td>
				<td><a href="showCompleteRequest?fileId=${files.id}">Select</a></td>
			</tr>
		</c:forEach>
	</table>
<h2>${msg}</h2>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>
