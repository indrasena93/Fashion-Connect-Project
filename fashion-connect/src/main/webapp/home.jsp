<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fashion Connect - Home</title>
<style>border-color=red; 
margin-right=25px;</style>
</head>
<body>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("login.jsp");
	}
%>
<p> FASHION CONNECT </p>

</body>
</html>
 
</body> 
</html>