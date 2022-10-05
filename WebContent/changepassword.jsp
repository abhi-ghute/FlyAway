<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div align="center">
<h1>Change Password</h1>

<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action="changepassword" method="post">
	<table border="1">
		<tr>
			<td>Current Password:</td>
			<td><input type="password" name="currentPassword" required></td>
		</tr>
		<tr>
			<td>New Password:</td>
			<td><input type="password" name="newPassword" id="newPassword" required></td>
		</tr>
		<tr>
			<td>Confirm Password:</td>
			<td><input type="password" name="confirmPassword" id="confirmPassword" required></td>
		</tr>
		<tr>
			<td><input type="reset" value="Reset"></td>
			<td><input type="submit" value="Change Password"></td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	  $("form").submit(function(){
		var newPassword = $("#newPassword").val();
		var confirmPassword = $("#confirmPassword").val();
		
		if(from!==to){
			alert("new password and confirm password should be same");
			return false;
		}
	  }); 
	});
</script>
</html>