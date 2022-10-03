package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.flyaway.dbconnect.DBConnection;

public class AddFlightDao {
	
	Connection con = null;
	PreparedStatement ps = null;

	public boolean addFlight(String airline,String dfrom,String dto,String ddate,String dtime,String price) {

		String query = "insert into flightdetails(airline, dfrom, dto, ddate, dtime, price) values(?,?,?,?,?,?)";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, airline);
			ps.setString(2, dfrom);
			ps.setString(3, dto);
			ps.setString(4, ddate);
			ps.setString(5, dtime);
			ps.setString(6, price);

			int status = ps.executeUpdate();

			if (status>0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
