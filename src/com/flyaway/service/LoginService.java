package com.flyaway.service;

import com.flyaway.dao.LoginDao;

public class LoginService {

	LoginDao logindao = new LoginDao();
	
	public boolean checkLogin(String userName, String password) {
		return logindao.checkLogin(userName, password);
	}
	
	public boolean changePassword(String userName, String password, String currentPassword) {
		return logindao.changePassword(userName, password,currentPassword);
	}
}
