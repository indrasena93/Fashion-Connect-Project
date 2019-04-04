package com.fashion.connect.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fashion.connect.domain.User;
import com.fashion.connect.service.UserService;

@WebServlet(name = "register", urlPatterns = "/register")
public class RegistrationController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private final UserService  userService = new UserService();

	public void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
		
		final User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setConfirmPassword(request.getParameter("confirmPassword"));
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setDateOfBirth(request.getParameter("dateOfBirth"));
		user.setGender(request.getParameter("gender"));
		user.setPrimaryRole(request.getParameter("primaryRole"));
		
		final Map<String, String> errors = userService.register(user);
		if(errors != null) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
			request.setAttribute("errors", errors);
			request.setAttribute("user", user);
			dispatcher.forward(request, response);
		} else {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			final Set<String> messages = new HashSet<String>();
			messages.add("Registration Successful");
			request.setAttribute("messages", messages);
			dispatcher.forward(request, response);
		}
	}
}
