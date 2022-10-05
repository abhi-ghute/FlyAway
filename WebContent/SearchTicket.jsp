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
<h1>Search Ticket</h1>

<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action="Ticket.jsp" method="post">
	<table border="1">
		<tr>
			<td>Email:</td>
			<td><input type="text" name="email" required></td>
		</tr>
		<tr>
			<td>ticket Number:</td>
			<td><input type="text" name="ticket" required></td>
		</tr>
		<tr>
			<td><input type="reset" value="Reset"></td>
			<td><input type="submit" value="Search"></td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
</html>