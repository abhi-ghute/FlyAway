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
			style="border: 3px solid black; width: 25%; border-radius: 20px; padding: 20px"
			align="center">
			<form action="searchFlight" method="GET">

				<%
				
					Connection con = DBConnection.getConnection();
					String query = "select * from places";
					PreparedStatement ps = con.prepareStatement(query);

					ResultSet rs = ps.executeQuery();

					ps = con.prepareStatement(query);
					rs = ps.executeQuery();
				%>
				<label for=from>From :-</label> <select name="from" id="from">
					<%
						while (rs.next()) {
					%>
					<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
					<%
						}
					%>
				</select><br>
				<br> <label for=to>To :-</label> <select name="to" id="to">
					<%
						rs = ps.executeQuery();
						while (rs.next()) {
					%>
					<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
					<%
						}
					%>
				</select><br>
				<br> 
				<label>No of Passengers : </label>
				<input type="text" name="passenger"><br><br>
				
				<label>Date : </label>
				<input type="date" name="tdate"><br><br>
				
				<input type="submit" value="submit" id="myForm" /> <input
					type="reset" />
			</form>
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