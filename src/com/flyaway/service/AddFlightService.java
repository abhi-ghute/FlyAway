package com.flyaway.service;

import com.flyaway.dao.AddFlightDao;

public class AddFlightService {

	AddFlightDao addFlightDao = new AddFlightDao();
	
	public boolean addFlight(String airline,String dfrom,String dto,String ddate,String dtime,String price) {
		return addFlight(airline, dfrom, dto, ddate, dtime, price);
	}
}
