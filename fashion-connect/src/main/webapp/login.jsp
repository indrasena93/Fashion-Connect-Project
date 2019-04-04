<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<title>Fashion Connect - User Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/common-styles.css" rel="stylesheet" />
</head>
<body style="background: url('images/background.jpg');">
	<%
		Map<String, String> errors = (Map) request.getAttribute("errors");
	%>
	<form action="login" method="post" autocomplete="off">
		<table style="text-align: center; margin: 100px auto 0 auto;">
			<tr>
				<td><img src="images/f3.jpg"
					style="width: 150px; height: 60px;" /></td>
			</tr>
			<tr>
				<td>
					<h3 style="color: whitesmoke; margin: 0;">FASHION CONNECT</h3>
				</td>
			</tr>
			<tr>
				<td>
					<h6 style="color: whitesmoke; margin: 0">A SOCIAL PLATFORM FOR
						THE FASHION WORLD</h6>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="username" placeholder="Username">
					<p style="color: white;"><%=errors != null && errors.containsKey("username") ? errors.get("username") : ""%></p>
				</td>
			</tr>
			<tr>
				<td><input type="password" name="password"
					placeholder="Password">
					<p style="color: white;"><%=errors != null && errors.containsKey("password") ? errors.get("password") : ""%></p>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" style="float: left">Sign-in</button>
					<button type="submit" style="float: right"
						formaction="registration.jsp">Sign-up</button>
				</td>
			</tr>
		</table>
	</form>
	<p style="color: white; text-align: center;"><%=errors != null && errors.containsKey("invalid-credentials") ? errors.get("invalid-credentials")
					: ""%></p>

</body>
</html>  

