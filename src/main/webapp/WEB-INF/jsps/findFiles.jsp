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
<script>
function validateForm() {
  var x = document.forms["myForm"]["unitName"].value;
  if (x == "" || x == " ") {
    alert("Enter UnitNames with SPACE");
    return false;
  }
  var y = document.forms["detailsForm"]["returnDays"].value;
    if (y == "" || y == " ") {
      alert("Enter Return Days");
      return false;
    }
}
</script>
</head>
<body>
<h2>~~~</h2><br>
<%@ include file="commonParts/buttons.jsp" %>
<h3>Requester Details</h3>
<table>
		<tr>
			<th>Requester Name</th>
			<th>Email</th>
			<th>Department</th>
			<th>Phone</th>
		</tr>
			<tr>
				<td>${requester.requesterName}</td>
				<td>${requester.email}</td>
				<td>${requester.department}</td>
				<td>${requester.phone}</td>
			</tr>
	</table>
<form name="detailsForm" action="showCompleteRequest?requesterId=${requester.id}" method="post">
<pre>
<input type="hidden" name="requesterId" value="${requester.id}"/>
File Type:<input type="text" name="fileType" value="${fileType}" readonly/>
Approved By:<input type="text" name="approvedBy" value="${approvedBy}"/>
Purpose:<input type="text" name="requesterPurpose" value="${requesterPurpose}"/>
Through:<input type="text" name="through" value="${through}"/>
Return Days:<input type="text" name="returnDays" value="${returnDays}" required/>
<input type="submit" value="Save"/>
</pre>
</form>
<h3>Issue Files</h3>
	<form name="myForm" action="issue?requesterId=${requester.id}&fileType=${fileType}&approvedBy=${approvedBy}&requesterPurpose=${requesterPurpose}&through=${through}&returnDays=${returnDays}" onsubmit="return validateForm()" method="post">

		Unit Name: <input type="text" name="unitNames" /> <input type="submit" name="submit" value="Issue" />

	</form>
	<br>

	
	<table>
		<tr>
			<th>Unit Name</th>
			<th>Approved By</th>
			<th>Through</th>
			<th>Status</th>
		</tr>
		<c:forEach var="entry" items="${unitNameVsIssue}">
		<tr>
			<td><c:out value="${entry.key}"/></td>
			<td>${approvedBy}</td>
			<td>${through}</td>
			<td><c:out value="${entry.value}"/> </td>
		</tr>
		</c:forEach>
	</table>
<h2>${msg}</h2>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>
