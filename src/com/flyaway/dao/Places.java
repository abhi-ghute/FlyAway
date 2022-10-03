package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.flyaway.dbconnect.DBConnection;

public class Places {

	Connection con = null;
	PreparedStatement ps = null;
	
	public boolean addPlace(String name) {

		String query = "insert into places(name) values(?)";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, name);

			int status = ps.executeUpdate();

			if (status>0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
