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
<script>
function validateForm() {
  var x = document.forms["myForm"]["unitName"].value;
  if (x == "" || x == " ") {
    alert("Enter UnitNames with SPACE");
    return false;
  }
}
</script>
</head>
<body>
<h2>~~~</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>File Receiving Panel</h3>
<form name="myForm" onsubmit="return validateForm()" action="searchPendingFile" method="post">
<input type="hidden" name="fileType" value="GREEN"/>
		Unit Name: <input type="text" name="unitNames" /> <input type="submit"
			name="submit" value="search" />

	</form>
	<table class="css-serial">
		<tr>
		<th>S.No.</th>
			<th>File Name</th>
			<th>Customer Name</th>
			<th>Requester Name</th>
			<th>Department</th>
			<th>Issued By</th>
			<th>Issued Date</th>
			<th>Due Date</th>
			<th>Remarks</th>
			<th>To Receive</th>
		</tr>
		<c:forEach items="${requests}" var="request">
			<tr>
			<td></td>
				<td>${request.file.unitName}</td>
				<td>${request.file.customerName}</td>
				<td>${request.requester.requesterName}</td>
				<td>${request.requester.department}</td>
				<td>${request.issuedBy}</td>
				<td>${request.issuedDate}</td>
				<td>${request.dueDate}</td>
				<td>${request.remarks}</td>

				<td><a href="receiveFile?requestId=${request.id}&fileId=${request.file.id}" target="_blank">Select</a></td>
				
			</tr>

		</c:forEach>
	</table>

<h2>${msg}</h2>
<script>
$(document).ready(function() {
    var i = 1
    $('table tr').each(function(index) {
        $(this).find('td:nth-child(1)').jsp(index+1);
    });
};
</script>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>
