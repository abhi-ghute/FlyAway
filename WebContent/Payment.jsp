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
<form action="payment" method="post">
	<table border="1">
		<tr>
			<td>Card Number:</td>
			<td><input type="text" name="userName" maxlength="16" minlength="5" required></td>
		</tr>
		<tr>
			<td>CVN:</td>
			<td><input type="password" name="cvn" maxlength="4" minlength="3" required></td>
		</tr>
		<tr>
			<td>Expiry Month and year:</td>
			<td><input type="Month" name="expiry" required>
			<input type="hidden" value="<%=request.getParameter("ticketID")%>" name="ticketID">
			</td>
		</tr>
		<tr>
			<td><input type="reset" value="Reset"></td>
			<td><input type="submit" value="Login"></td>
		</tr>
	</table>
</form>
</body>
</html>