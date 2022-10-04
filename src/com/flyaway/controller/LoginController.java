package com.flyaway.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.flyaway.dbconnect.DBConnection;
import com.flyaway.service.LoginService;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/loginpage")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginService loginService = new LoginService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String admin = (String)session.getAttribute("user");
		if(admin!=null && admin.equals("admin")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		}
		
		boolean check = loginService.checkLogin(request.getParameter("userName"), request.getParameter("password"));

		if (check) {
			session.setAttribute("user", request.getParameter("userName"));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
