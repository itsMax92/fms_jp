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
<h2>File Management System</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>Update Files</h3>
<form action="searchFiles" method="post">

		Unit Name: <input type="text" name="unitName" /> 
		<input type="submit" name="submit" value="search" />

	</form>
<div id="dvData">	
	<table>
		<tr>
			<th>Unit Name</th>
			<th>File Type</th>
			<th>Customer Name</th>
			<th>Location Code</th>
			<th>Status</th>
			<th>To update</th>
		</tr>
		<c:forEach items="${filesToUpdate}" var="filesToUpdate">
			<tr>
				<td>${filesToUpdate.unitName}</td>
				<td>${filesToUpdate.fileType}</td>
				<td>${filesToUpdate.customerName}</td>
				<td>${filesToUpdate.locationCode}</td>
				<td>${filesToUpdate.status}</td>
				<td><a href="editFile?fileId=${filesToUpdate.id}">Select</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
	<h2>${msg}</h2>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>
