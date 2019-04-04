package com.fashion.connect.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fashion.connect.domain.User;
import com.fashion.connect.service.UserService;

@WebServlet(name = "login", urlPatterns = "/login")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private final UserService  userService = new UserService();

	public void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
		
		final User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		
		final Map<String, String> errors = userService.authenticate(user);
		if(errors != null) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			request.setAttribute("errors", errors);
			dispatcher.forward(request, response);
		} else { 
			final HttpSession session = request.getSession(true);
			user.setPassword(null);
			session.setAttribute("user", user);
			response.sendRedirect("home.jsp");
		}
	}
}
