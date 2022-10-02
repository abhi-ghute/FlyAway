package com.flyaway.dbconnect;

import java.sql.Connection;

public class DBConnection {
	
	private static Connection connection = null;

	public static void setConnection(Connection connection) {
		DBConnection.connection = connection;
	}
	
	public static Connection getConnection() {
		return connection;
	}
	
	
	
}
