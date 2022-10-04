<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.flyaway.dbconnect.DBConnection"%>
<%@page import="java.sql.Connection"%>
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

	<%
		Connection con = DBConnection.getConnection();
		String query = "select * from flightDetails where id = ?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, request.getParameter("flightId"));

		ResultSet rs = ps.executeQuery();
		rs = ps.executeQuery();
		rs.next();
	%>

	<table border="1">
		<tr>
			<th>Name</th>
			<td><%=request.getParameter("name")%></td>
		</tr>
		<tr>
			<th>Email</th>
			<td><%=request.getParameter("email")%></td>
		</tr>
		<tr>
			<th>MOB</th>
			<td><%=request.getParameter("mob")%></td>
		</tr>
		<tr>
			<th>age</th>
			<td><%=request.getParameter("age")%></td>
		</tr>
		<tr>
			<th>AirLine</th>
			<td><%=rs.getString("airline")%></td>
		</tr>
		<tr>
			<th>From</th>
			<td><%=rs.getString("dfrom")%></td>
		</tr>
		<tr>
			<th>TO</th>
			<td><%=rs.getString("dto")%></td>
		</tr>
		<tr>
			<th>Time</th>
			<td><%=rs.getString("dtime")%></td>
		</tr>
		<tr>
			<th>Departure Date</th>
			<td><%=rs.getString("ddate")%></td>
		</tr>
		<tr>
			<th>Passenger</th>
			<td><%=request.getParameter("passenger")%></td>
		</tr>
		<tr>
			<th>Price</th>
			<td><%=Integer.parseInt(rs.getString("price"))%></td>
		</tr>
		<tr>
			<th>Total Price</th>
			<td><%=Integer.parseInt(request.getParameter("passenger").trim()) * Integer.parseInt(rs.getString("price"))%></td>
		</tr>
		<tr>
			<th colspan="2"><a href="Payment.jsp?ticketID=<%=request.getParameter("ticketID")%>"><button style="color:blue;">Pay</button></a></th>
		</tr>

	</table>

</body>
</html>