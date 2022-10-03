package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.flyaway.dbconnect.DBConnection;

public class AirLineDao {
	
	Connection con = null;
	PreparedStatement ps = null;

	public boolean addAirLine(String name, String number) {

		String query = "insert into airline(name,airlinenum) values(?,?)";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, number);

			int status = ps.executeUpdate();

			if (status>0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
