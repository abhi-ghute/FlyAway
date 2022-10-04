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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body >
<br>
<a href=HomePage.jsp style="color:black;text-decoration:none ;font-size:35px;font-weight:bold;">FlyAway</a>
<br><br>
<div align="center">
<h1>Insert New Flight Details</h1>

<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action="insertflight" method=post>
	<label for=name>AirLine Name :-</label>
	<%
		String admin = (String)session.getAttribute("user");
		if(admin==null || !admin.equals("admin")){
			out.println("<script type=\"text/javascript\">");
			out.println("location='login.jsp';");
			out.println("</script>");
		}
		Connection con = DBConnection.getConnection(); 
		String query = "select * from airline";
		PreparedStatement ps = con.prepareStatement(query);
		
		ResultSet rs = ps.executeQuery();
	%>
	<select name="name">
		<% 
		while(rs.next()){
		%>
		<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
		<%}%>
	</select><br><br>
	
	<%
	query = "select * from places";
	ps = con.prepareStatement(query);
	rs = ps.executeQuery();
	%>
	<label for=from>From :-</label> 
	<select name="from" id ="from">
		<% 
		while(rs.next()){
		%>
		<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
		<%}%>
	</select><br><br>
	<label for=to>To :-</label>
	<select name="to" id="to">
		<% 
		rs = ps.executeQuery();
		while(rs.next()){
		%>
		<option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
		<%}%>
	</select><br><br>
	<label for=departure>Departure :-</label> <input type="date" name="departure" id="departure" /><br><br>
	<label for=time>Time :-</label> <input type="time" name="time" id="time" /><br><br>
	<label for=price>Price :-</label> <input type="text" name="price" id="price" /><br><br>
	<input type="submit" value="submit" id ="myForm"/> <input type="reset" />
</form>
</div>
</div>
</body>
<script>
$(document).ready(function(){
	  $("form").submit(function(){
		var from = $("#from").val();
		var to = $("#to").val();
		
		if(from===to){
			alert("source and destination should be different");
			return false;
		}
	  }); 
	});
</script>
</html>