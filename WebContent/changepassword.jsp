<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form action="changepassword" method="post">
	<table border="1">
		<tr>
			<td>Current Password:</td>
			<td><input type="password" name="currentPassword"></td>
		</tr>
		<tr>
			<td>New Password:</td>
			<td><input type="password" name="newPassword" id="newPassword"></td>
		</tr>
		<tr>
			<td>Confirm Password:</td>
			<td><input type="password" name="confirmPassword" id="confirmPassword"></td>
		</tr>
		<tr>
			<td><input type="reset" value="Reset"></td>
			<td><input type="submit" value="Change Password"></td>
		</tr>
	</table>
</form>
</body>
</html>