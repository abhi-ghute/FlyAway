package com.flyaway.dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
	 String driverClassName = "com.mysql.cj.jdbc.Driver";
     String url = "jdbc:mysql://localhost:3306/flyaway";
     String username = "root";
     String password = "root";
     
     Class.forName(driverClassName);
     
     Connection con = DriverManager.getConnection(url, username, password);
		return con;
	}
	
	
	
}
