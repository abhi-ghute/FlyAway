package com.flyaway.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.flyaway.dbconnect.DBConnection;

public class PaymentDao {

	Connection con = null;
	PreparedStatement ps = null;

	public boolean updatepayment(String ticketNumber) {

		String query = "update tickets set payment_status='done' where id=?";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, ticketNumber);

			int status = ps.executeUpdate();

			if (status > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
