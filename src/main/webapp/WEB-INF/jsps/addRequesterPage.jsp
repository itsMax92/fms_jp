<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="commonParts/meta.jsp" %>  
<title>Add Requester</title>
<%@ include file="commonParts/header.jsp" %>  
<%@ include file="css/mycss.jsp" %>
<script>
function validateForm() {
  var x = document.forms["myForm"]["requesterName"].value;
  var y = document.forms["myForm"]["department"].value;
  if (x == "" || y == "") {
    alert("Requester and Department must be filled out");
    return false;
  }
}
</script>
</head>
<body>
<h2>~~~</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>Add New Requester</h3>
<form name="myForm" action="addRequester" onsubmit="return validateForm()" method="post">
<pre>
Requester Name:<input type="text" name="requesterName"/>
Email:<input type="text" name="email"/>
Department:<input type="text" name="department"/>
Phone:<input type="text" name="phone"/>
<input type="submit" value="confirm"/>
</pre>
</form>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>