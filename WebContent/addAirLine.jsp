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
<h1>Insert New AirLine Details</h1>

<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action="addairline" method="post">
	<table border="1">
		<tr>
			<td>AirLine Name:</td>
			<td><input type="text" name="airlineName" required></td>
		</tr>
		<tr>
			<td>AirLine Number:</td>
			<td><input type="text" name="airlineNo" required></td>
		</tr>
		<tr>
			<td><input type="reset" value="Reset"></td>
			<td><input type="submit" value="Add"></td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
</html>