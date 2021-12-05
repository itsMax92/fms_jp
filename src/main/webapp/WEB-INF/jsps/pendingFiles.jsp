<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>FMS:Pending Files</title>
<%@ include file="commonParts/header.jsp" %>  
<%@ include file="css/mycss.jsp" %>
</head>
<body>
<h2>~~~</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>Pending Files</h3>
<div id="dvData">	
	<table>
		<tr>
			<th>Unit Name</th>
			<th>File Type</th>
			<th>Customer Name</th>
			<th>Location Code</th>
			<th>Status</th>
		</tr>
		<c:forEach items="${files}" var="files">
			<tr>
				<td>${files.unitName}</td>
				<td>${files.fileType}</td>
				<td>${files.customerName}</td>
				<td>${files.locationCode}</td>
				<td>${files.status}</td>
				<td><a href="showCompleteRequest?fileId=${files.id}">Select</a></td>
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
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>
