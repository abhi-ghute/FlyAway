<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.flyaway.dbconnect.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Flight</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<br>
	<a href=HomePage.jsp
		style="color: black; text-decoration: none; font-size: 35px; font-weight: bold;">FlyAway</a>
	<br>
	<br>
	<div align="center">
		<h1>Search Flight</h1>

		<div
			style="border: 3px solid black; width: 25%; border-radius: 20px; padding: 20px"
			align="center">
				<%
					Connection con = DBConnection.getConnection();
					String query = "select * from flightDetails where dfrom = ? and dto = ? and ddate>now();";
					PreparedStatement ps = con.prepareStatement(query);

					ResultSet rs = ps.executeQuery();

					ps = con.prepareStatement(query);
					rs = ps.executeQuery();
				%>
				<table>
					<tr>
						<th>Sr. No.</th>
						<th>AirLine</th>
						<th>From</th>
						<th>TO</th>
						<th>Departure Date</th>
						<th>Time</th>
						<th>Price</th>
						<th>View</th>
					</tr>
					
				<%
					int i=0;
					while(rs.next()){	
					i++;
				%>
					<tr>
						<td><%=i%></td>
						<td><%=rs.getString("airline") %></td>
						<td><%=rs.getString("dfrom") %></td>
						<td><%=rs.getString("dto") %></td>
						<td><%=rs.getString("ddate") %></td>
						<td><%=rs.getString("dtime") %></td>
						<td><%=rs.getString("price") %></td>
						<td><a href="registerCustomer">Book Ticket</a></td>
					</tr>
				<%} %>
				</table>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("form").submit(function() {
			var from = $("#from").val();
			var to = $("#to").val();

			if (from === to) {
				alert("source and destination should be different");
				return false;
			}
		});
	});
</script>
</html>