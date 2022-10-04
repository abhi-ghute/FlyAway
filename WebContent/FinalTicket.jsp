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
<div align="center">
<h1>Flight Details</h1>

<div style="border:3px solid black;width:25%;border-radius:20px;padding:18px" align="center">
	<%
		Connection con = DBConnection.getConnection();
		String query = "select * from flightDetails as f inner join tickets as t on f.id=t.flightId where t.id = ?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, request.getParameter("ticketID"));

		ResultSet rs = ps.executeQuery();
		rs = ps.executeQuery();
		rs.next();
	%>

	<table border="1">
		<tr>
			<th>Ticket Number</th>
			<td><%=request.getParameter("ticketID")%></td>
		</tr>
		<tr>
			<th>Name</th>
			<td><%=rs.getString("name")%></td>
		</tr>
		<tr>
			<th>MOB</th>
			<td><%=rs.getString("mob")%></td>
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
			<td><%=rs.getString("passenger")%></td>
		</tr>
		<tr>
			<th>Price</th>
			<td><%=Integer.parseInt(rs.getString("price"))%></td>
		</tr>
		<tr>
			<th>Total Price</th>
			<td><%=Integer.parseInt(rs.getString("passenger").trim()) * Integer.parseInt(rs.getString("price").trim())%></td>
		</tr>
	</table>
</div>
</body>
</html>