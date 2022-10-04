package com.flyaway.service;

import com.flyaway.dao.PaymentDao;

public class PaymentService {
	
	PaymentDao paymentDao = new PaymentDao();
	
	public boolean payment(String ticketNumber) {
		return paymentDao.updatepayment(ticketNumber);
	}
}
