<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.fashion.connect.domain.User"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="registration.css">
<script>
	function validate() {

		if (document.rform.fname.value === "") {
			alert("Please provide your first name!");
			//document.rform.fname.focus() ;
			return false;
		}

		if (document.rform.lname.value === "") {
			alert("Please provide your last name!");
			// document.rform.lname.focus() ;
			return false;
		}
		if (document.rform.email.value === "") {
			alert("Please provide your Email!");
			//document.rform.email.focus() ;
			return false;
		}

		if (document.rform.pwd.value === "") {
			alert("Please provide your password!");
			//document.rform.pwd.focus() ;
			return false;
		}

		if (document.rform.age.value === "") {
			alert("Please provide your age!");
			//document.rform.age.focus() ;
			return false;
		}
		if (document.rform.gender.value === "-1") {
			alert("Please provide your Gender!");
			return false;
		}
		if (document.rform.prole.value === "-1") {
			alert("Please provide your Primary Role!");
			return false;
		}
		return (true);
	}
</script>
<title>Fashion Connect - User registration</title>
<link href="css/common-styles.css" rel="stylesheet" />
</head>
<body background="images/background.jpg">
	<%
		Map<String, String> errors = (Map) request.getAttribute("errors");
		User user = (User) request.getAttribute("user");
	%>
	<form method="post" action="register">
		<h2 style="text-align: center; color: white">Registration</h2>
		<table style="margin: 0 auto;">
			<tr>
				<td>First Name</td>
				<td>
					<input type="text" name="firstName" value="<%=user != null ? user.getFirstName() : ""%>" />
					<p style="color: red;"><%=errors != null && errors.containsKey("firstName") ? errors.get("firstName") : ""%></p>
				</td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td>
					<input type="text" name="lastName" value="<%=user != null ? user.getLastName() : ""%>" />
					<p style="color: red;"><%=errors != null && errors.containsKey("lastName") ? errors.get("lastName") : ""%></p>
				</td>
			</tr>
			<tr>
				<td>E Mail</td>
				<td>
					<input type="email" name="username"  value="<%=user != null ? user.getUsername() : ""%>" />
					<p style="color: red;"><%=errors != null && errors.containsKey("username") ? errors.get("username") : ""%></p>
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td>
					<input type="password" name="password"  value="<%=user != null ? user.getPassword() : ""%>" />
					<p style="color: red;"><%=errors != null && errors.containsKey("password") ? errors.get("password") : ""%></p>
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td>
					<input type="password" name="confirmPassword" value="<%=user != null ? user.getConfirmPassword() : ""%>" />
					<p style="color: red;"><%=errors != null && errors.containsKey("confirmPassword") ? errors.get("confirmPassword") : ""%></p>
					<p style="color: red;"><%=errors != null && errors.containsKey("passwordNoMatch") ? errors.get("passwordNoMatch") : ""%></p>
				</td>
			</tr>
			<tr>
				<td>Date of Birth</td>
				<td>
					<input type="date" data-date-inline-picker="true" name="dateOfBirth" value="<%=user != null ? user.getDateOfBirth() : ""%>" />
					<p style="color: red;"><%=errors != null && errors.containsKey("dateOfBirth") ? errors.get("dateOfBirth") : ""%></p>
				</td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>
					<select name="gender">
						<option value="m" <% if (user != null && user.getGender().equalsIgnoreCase("m")) out.print("selected"); else out.print(""); %>>Male</option>
						<option value="f" <% if (user != null && user.getGender().equalsIgnoreCase("f")) out.print("selected"); else out.print(""); %>>Female</option>
					</select>
					<p style="color: red;"><%=errors != null && errors.containsKey("gender") ? errors.get("gender") : ""%></p>
				</td>
			</tr>
			<tr>
				<td>Primary Role</td>
				<td><select name="primaryRole">
						<option value="Fashion Designer" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Fashion Designer")) out.print("selected"); else out.print(""); %>>Fashion Designer</option>
						<option value="Technical Designer"  <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Technical Designer")) out.print("selected"); else out.print(""); %>>Technical Designer</option>
						<option value="Pattern Maker" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Pattern Maker")) out.print("selected"); else out.print(""); %>>Pattern Maker</option>
						<option value="Tailor" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Tailor")) out.print("selected"); else out.print(""); %>>Tailor</option>
						<option value="Textile Designer" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Textile Designer")) out.print("selected"); else out.print(""); %>>Textile Designer</option>
						<option value="Stylist" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Stylist")) out.print("selected"); else out.print(""); %>>Stylist</option>
						<option value="Fashion Buyer" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Fashion Buyer")) out.print("selected"); else out.print(""); %>>Fashion Buyer</option>
						<option value="Seamstress" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Seamstress")) out.print("selected"); else out.print(""); %>>Seamstress</option>
						<option value="Custom Clothier" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Custom Clothier")) out.print("selected"); else out.print(""); %>>Custom Clothier</option>
						<option value="Dressmaker" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Dressmaker")) out.print("selected"); else out.print(""); %>>Dressmaker</option>
						<option value="Illustrator" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Illustrator")) out.print("selected"); else out.print(""); %>>Illustrator</option>
						<option value="Fashion Forecaster" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Fashion Forecaster")) out.print("selected"); else out.print(""); %>>Fashion Forecaster</option>
						<option value="Fit Model" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Fit Model")) out.print("selected"); else out.print(""); %>>Fit Model</option>
						<option value="Fashion Journalists" <% if (user != null && user.getPrimaryRole().equalsIgnoreCase("Fashion Journalists")) out.print("selected"); else out.print(""); %>>Fashion Journalists</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center"><button type="submit">Register</button></td>
			</tr>
		</table>
	</form>
</body>
</html>