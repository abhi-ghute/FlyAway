package com.flyaway.service;

import com.flyaway.dao.Places;

public class PlacesService {
	
	Places place = new Places();
	
	public boolean addPlace(String name) {
		return place.addPlace(name);
	}
}
