package com.flyaway.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyaway.service.LoginService;

/**
 * Servlet implementation class ChangePasswordController
 */
@WebServlet("/changepassword")
public class ChangePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	LoginService loginService = new LoginService();
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String admin = (String)session.getAttribute("user");
		if(admin==null || !admin.equals("admin")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
		boolean check = loginService.changePassword(admin, request.getParameter("newPassword"),request.getParameter("currentPassword"));

		if (check) {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Password changed Successfully...');");
			out.println("location='addFlight.jsp';");
			out.println("</script>");
			
//			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
//			dispatcher.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please check previous password...');");
			out.println("location='changepassword.jsp';");
			out.println("</script>");
//			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//			dispatcher.forward(request, response);
		}
	}

}
