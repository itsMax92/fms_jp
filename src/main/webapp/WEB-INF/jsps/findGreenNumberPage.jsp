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
<h2>Green File Details</h2>
<br>

<form action="greennumbersearch" method="post">

		Green File Numbers with space: <input type="text" name="numbers" /> <input type="submit"
			name="submit" value="Search" />

</form>

<br>
<div id="dvData">
	<table>
		<tr>
			<th>Unit Name</th>
			<th>Customer Name</th>
			<th>Status</th>
			<th>File Type</th>
			<th>Green Number</th>
		</tr>
		<c:forEach items="${fileList}" var="file">
			<tr>
				<td>${file.unitName}</td>
				<td>${file.customerName}</td>
				<td>${file.status}</td>
				<td>${file.fileType}</td>
				<td>${file.greenNumber}</td>
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
	<h3>${msg}</h3>
	
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>