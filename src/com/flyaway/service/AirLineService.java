package com.flyaway.service;

import com.flyaway.dao.AirLineDao;

public class AirLineService {
	
	AirLineDao airLineDao = new AirLineDao();
	
	public boolean addAirLine(String name,String number) {
		return airLineDao.addAirLine(name, number);
	}
}
