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
<h2>~~~</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>Update File</h3>
<form action="updateFile" method="post">
<pre>
File Id:<input type="text" name="id" value="${fileToUpdate.id}" readonly/>
Unit Name:<input type="text" name="unitName" value="${fileToUpdate.unitName}"/>
Customer Name:<input type="text" name="customerName" value="${fileToUpdate.customerName}"/>
File Type:<input type="text" name="fileType" value="${fileToUpdate.fileType}" readonly/>
Location Code:<input type="text" name="locationCode" value="${fileToUpdate.locationCode}"/>
<input type="submit" value="confirm"/>
</pre>
</form>
<h2>${msg}</h2>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>