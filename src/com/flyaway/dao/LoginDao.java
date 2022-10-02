package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.flyaway.dbconnect.DBConnection;

public class LoginDao {

	Connection con = null;
	PreparedStatement ps = null;

	public boolean checkLogin(String userName, String password) {

		String query = "select * from Admin where username=? and password=? limit 1";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, userName);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next())
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean changePassword(String userName,String password,String oldPassword) {

		String query = "update Admin set password = ? where username=? and password=?";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, password);
			ps.setString(2, userName);
			ps.setString(3, oldPassword);

			int check = ps.executeUpdate();

			if (check>0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
