package com.flyaway.service;

import com.flyaway.dao.RegisterCustomerDao;

public class RegisterCustomerService {

	RegisterCustomerDao registerCustomerDao = new RegisterCustomerDao();
	
	public boolean register(String ticketID,String flightId, String passenger, String name, String email,String password, String mob, String age) {
		return registerCustomerDao.register(ticketID,flightId, passenger, name, email, password, mob, age);
	}
}
