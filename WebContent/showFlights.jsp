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
<jsp:include page="header.jsp"></jsp:include>
	<br>
	
	<br>
	<div align="center">
		<h1>Search Flight</h1>

		<div
			style="border: 3px solid black; width: 40%; border-radius: 20px; padding: 20px"
			align="center">
				<%
					Connection con = DBConnection.getConnection();
					String query = "select * from flightDetails where dfrom = ? and dto=? and ddate>?";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setString(1,request.getParameter("from"));
					ps.setString(2,request.getParameter("to"));
					ps.setString(3,request.getParameter("tdate"));
					
					ResultSet rs = ps.executeQuery();
					rs = ps.executeQuery();
				%>
				<table border="1">
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
						<td><a href="registerCustomer.jsp?id=<%=rs.getString("id")%>&passenger= <%=request.getParameter("passenger")%>
						">Book Ticket</a></td>
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