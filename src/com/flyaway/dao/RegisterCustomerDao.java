package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.flyaway.dbconnect.DBConnection;

public class RegisterCustomerDao {

	Connection con = null;
	PreparedStatement ps = null;

	public boolean register(String ticketID,String flightId, String passenger, String name, String email,String password, String mob, String age) {
		String query = "insert into tickets(id,flightId, passenger, name, email, password, mob, age) values(?,?,?,?,?,?,?,?);";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, ticketID);
			ps.setString(2, flightId);
			ps.setString(3, passenger);
			ps.setString(4, name);
			ps.setString(5, email);
			ps.setString(6, password);
			ps.setString(7, mob);
			ps.setString(8, age);			

			int status = ps.executeUpdate();

			if (status>0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
