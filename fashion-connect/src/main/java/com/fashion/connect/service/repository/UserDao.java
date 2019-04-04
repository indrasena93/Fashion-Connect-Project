package com.fashion.connect.service.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.fashion.connect.domain.User;
import com.fashion.connect.service.exception.DuplicateUsernameException;

public class UserDao {

	private Connection connection;

	public UserDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fashionconnect", "root", "admin");
		} catch (ClassNotFoundException | SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public User authenticate(User user) {

		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement("select * from user where username = ? and password = ?");
			prepareStatement.setString(1, user.getUsername());
			prepareStatement.setString(2, user.getPassword());
			ResultSet resultSet = prepareStatement.executeQuery();
			if (resultSet.next()) {
				System.out.println(resultSet.getString("firstname"));
				return user;
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void register(User user) {
		
		if(getUser(user.getUsername()) != null) {
			throw new DuplicateUsernameException();
		}
		
		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement("insert into user values (?, ?, ?, ?, ?, ?, ?)");
			prepareStatement.setString(1, user.getUsername());
			prepareStatement.setString(2, user.getPassword());
			prepareStatement.setString(3, user.getFirstName());
			prepareStatement.setString(4, user.getLastName());
			prepareStatement.setString(5, user.getDateOfBirth());
			prepareStatement.setString(6, user.getGender());
			prepareStatement.setString(7, user.getPrimaryRole());
			prepareStatement.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	private User getUser(String username) {
		
		try {
			PreparedStatement prepareStatement = connection
					.prepareStatement("select * from user where username = ?");
			prepareStatement.setString(1, username);
			ResultSet resultSet = prepareStatement.executeQuery();
			if (resultSet.next()) {
				System.out.println(resultSet.getString("firstname"));
				User user = new User();
				user.setUsername(username);
				return user;
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
