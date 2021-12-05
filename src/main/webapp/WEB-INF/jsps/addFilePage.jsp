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
<script>
function validateForm() {
  var x = document.forms["myForm"]["unitName"].value;
  var y = document.forms["myForm"]["customerName"].value;
  var a = document.forms["myForm"]["fileType"].value;
  var b = document.forms["myForm"]["locationCode"].value;
  if (x == "" || y == "" || a == "" || b == "") {
    alert("All fields must be filled out");
    return false;
  }
}
</script>
</head>
<body>
<h2>File Management System</h2><br>
<%@ include file="commonParts/buttons.jsp" %> 
<h3>Add New File</h3>
<form name="myForm" action="addFile" onsubmit="return validateForm()" method="post">
<pre>
Unit Name:<input type="text" name="unitName"/>
Customer Name:<input type="text" name="customerName"/>
File Type:<select name="fileType" id="fileType" required>
    <option value="">Select File Type</option>
    <option value="GREEN">GREEN</option>
    <option value="YELLOW">YELLOW</option>
  </select>
Location Code:<input type="text" name="locationCode"/>

<input type="hidden" name="status" value="available"/>
<input type="submit" value="confirm"/>
</pre>
</form>
<%@ include file="commonParts/footer.jsp" %>
</body>
</html>