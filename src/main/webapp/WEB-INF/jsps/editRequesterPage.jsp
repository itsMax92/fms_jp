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
<form action="updateRequester" method="post">
<pre>
Requester Id:<input type="text" name="id" value="${requesterToUpdate.id}" readonly/>
Requester Name:<input type="text" name="requesterName" value="${requesterToUpdate.requesterName}"/>
Email:<input type="text" name="email" value="${requesterToUpdate.email}"/>
Department:<input type="text" name="department" value="${requesterToUpdate.department}"/>
Phone:<input type="text" name="phone" value="${requesterToUpdate.phone}"/>
<input type="submit" value="confirm"/>
</pre>
</form>
<a href="deleteRequester?requesterId=${requesterToUpdate.id}" class="btn btn-danger" role="button">Click to DELETE</a>
<h2>${msg}</h2>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>