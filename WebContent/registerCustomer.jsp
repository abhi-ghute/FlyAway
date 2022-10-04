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
<div align="center">
<h1>Insert Personal Details</h1>

<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action="register" method="post">


	<table border="1">
		<tr>
			<td>Name:</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>Email:</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>Mobile No.</td>
			<td><input type="text" name="mob"></td>
		</tr>
		<tr>
			<td>Age:</td>
			<td><input type="text" name="age">
			<input type="hidden" name="flightId" value="<%=request.getParameter("id")%>">
			<input type="hidden" name="passenger" value="<%=request.getParameter("passenger")%>">
			</td>
		</tr>
		<tr>
			<td><input type="reset" value="Reset"></td>
			<td><input type="submit" value="Register"></td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
</html>