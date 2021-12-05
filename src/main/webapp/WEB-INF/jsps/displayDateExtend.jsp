<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>Date Extend</title>
<%@ include file="commonParts/header.jsp" %> 
<%@ include file="css/mycss.jsp" %>
<script>
function validateForm() {
  var x = document.forms["dateForm"]["unitNames"].value;
  if (x == "" || x == " ") {
    alert("Enter UnitNames with SPACE");
    return false;
  }
  var y = document.forms["dateForm"]["extendDays"].value;
    if (y == "" || y == " ") {
      alert("Enter Extend Days");
      return false;
    }
}
</script>

</head>
<body>
<h2>File Management System</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h2>Due Date Extend</h2>
<br>

<form name="dateForm" action="extendDate" onsubmit="return validateForm()" method="post">
<pre>
Extend Days:<input type="text" name="extendDays" value="${extendDays}" required/>
Unit Name: <input type="text" name="unitNames" required/> <input type="submit" name="submit" value="Submit" />
</pre>
</form>

<br>
	<table>
		<tr>
			<th>Unit Name</th>
			<th>New Due Date</th>
		</tr>
		<c:forEach var="entry" items="${unitNameVsDueDate}">
        		<tr>
        			<td><c:out value="${entry.key}"/></td>
        			<td><c:out value="${entry.value}"/> </td>
        		</tr>
        		</c:forEach>
	</table>
	<h3>${msg}</h3>
	
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>