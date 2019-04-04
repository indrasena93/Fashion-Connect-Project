package com.fashion.connect.service;

import java.util.HashMap;
import java.util.Map;

import com.fashion.connect.domain.User;
import com.fashion.connect.service.exception.DuplicateUsernameException;
import com.fashion.connect.service.repository.UserDao;

public class UserService {

	final UserDao userDao = new UserDao();

	public Map<String, String> authenticate(final User user) {

		final Map<String, String> errors = isValidCredentials(user);
		if (!errors.isEmpty()) {
			return errors;
		}

		if (userDao.authenticate(user) == null) {
			errors.put("invalid-credentials", "No user found with the specified username/password");
			return errors;
		} else {
			return null;
		}
	}

	private Map<String, String> isValidCredentials(final User user) {

		final Map<String, String> errors = new HashMap<String, String>();

		if (user.getUsername() == null || user.getUsername().trim().isEmpty()) {
			errors.put("username", "Username cannot be empty");
		}

		if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
			errors.put("password", "Password cannot be empty");
		}

		return errors;
	}

	public Map<String, String> register(final User user) {

		Map<String, String> errors = isValidUser(user);
		if (!errors.isEmpty()) {
			return errors;
		}
		
		try {
			userDao.register(user);
		} catch (DuplicateUsernameException e) {
			errors = new HashMap<String, String>();
			errors.put("duplicateUsername", "Username already taken. Please choose a different one");
			return errors;
		}

		return null;
	}

	private Map<String, String> isValidUser(User user) {

		final Map<String, String> errors = new HashMap<String, String>();

		if (user.getConfirmPassword() == null || user.getConfirmPassword().trim().isEmpty()) {
			errors.put("confirmPassword", "Confirm password cannot be empty");
		}

		if (user.getPassword() == null || user.getPassword().trim().isEmpty()) {
			errors.put("password", "Password cannot be empty");
		}

		if (!String.valueOf(user.getPassword()).equals(user.getConfirmPassword())) {
			errors.put("passwordNoMatch", "Passwords do not match");
		}

		if (user.getFirstName() == null || user.getFirstName().trim().isEmpty()) {
			errors.put("firstName", "First name cannot be empty");
		}

		if (user.getLastName() == null || user.getLastName().trim().isEmpty()) {
			errors.put("lastName", "Last name cannot be empty");
		}

		if (user.getGender() == null || user.getGender().trim().isEmpty()) {
			errors.put("gender", "Please select gender");
		}

		if (user.getPrimaryRole() == null || user.getPrimaryRole().trim().isEmpty()) {
			errors.put("primaryRole", "Please select a primary role");
		}

		if (user.getDateOfBirth() == null || user.getDateOfBirth().trim().isEmpty()) {
			errors.put("dateOfBirth", "Date of birth cannot be empty");
		}
		
		if (user.getUsername() == null || user.getUsername().trim().isEmpty()) {
			errors.put("username", "Email cannot be empty");
		}

		return errors;
	}

}
