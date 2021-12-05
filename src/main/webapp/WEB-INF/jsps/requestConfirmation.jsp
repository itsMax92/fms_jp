<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>${msg}</title>
<%@ include file="commonParts/header.jsp" %> 
<%@ include file="css/mycss.jsp" %> 
</head>
<body>
<h2>File Management System</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<br>
<table>
		<tr>
			<th>Unit Name</th>
			<th>requesterName</th>
			<th>Approved By</th>
			<th>Through</th>
			<th>Status</th>
			<th>Due Date</th>
		</tr>
		<c:forEach var="entry" items="${unitNameVsIssue}">
		<tr>
			<td><c:out value="${entry.key}"/></td>
			<td>${requesterName}</td>
			<td>${approvedBy}</td>
			<td>${through}</td>
			<td><c:out value="${entry.value}"/> </td>
			<td>${dueDate}</td>
		</tr>
		</c:forEach>
	</table>
<h2>${msg}</h2>
<br><br>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>