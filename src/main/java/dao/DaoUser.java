package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnection;
import model.User;

public class DaoUser {

	private Connection connection;

	public DaoUser() {
		connection = SingleConnection.getConnection();
	}

	public void insertUser(User user) {
		try {

			String sql = "INSERT INTO users(name, login, email, password, type) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, user.getName());
			insert.setString(2, user.getLogin());
			insert.setString(3, user.getEmail());
			insert.setString(4, user.getPassword());
			insert.setString(5, user.getType());
			insert.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e.printStackTrace();
			}
		}
	}

	public void updateUser(User user) {
		try {

			String sql = "UPDATE users SET name = ?, login = ?, email = ?, password = ?, type = ? WHERE id = '" + user.getId() + "'AND type <> 'administrador'"; 
			PreparedStatement update = connection.prepareStatement(sql);
			update.setString(1, user.getName());
			update.setString(2, user.getLogin());
			update.setString(3, user.getEmail());
			update.setString(4, user.getPassword());
			update.setString(5,	user.getType());
			update.executeUpdate();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	public void deleteUser(String id) {
		try {

			String sql = "DELETE FROM users WHERE id = '" + id + "' AND type <> 'administrador'";
			PreparedStatement delete = connection.prepareStatement(sql);
			delete.execute();
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	public User selectUser(String id) throws Exception {

		String sql = "SELECT * FROM users WHERE id = '" + id + "'";
		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();
		if (resultSet.next()) {
			User user = new User();
			user.setId(resultSet.getLong("id"));
			user.setName(resultSet.getString("name"));
			user.setLogin(resultSet.getString("login"));
			user.setEmail(resultSet.getString("email"));
			user.setPassword(resultSet.getString("password"));
			user.setType(resultSet.getString("type"));

			return user;
		}

		return null;
	}

	public List<User> selectAllUsers() throws SQLException {
		List<User> usersList = new ArrayList<User>();

		String sql = "SELECT * FROM users";
		PreparedStatement selectAll = connection.prepareStatement(sql);
		ResultSet resultSet = selectAll.executeQuery();
		while (resultSet.next()) {
			User user = new User();
			user.setId(resultSet.getLong("id"));
			user.setName(resultSet.getString("name"));
			user.setLogin(resultSet.getString("login"));
			user.setEmail(resultSet.getString("email"));
			user.setPassword(resultSet.getString("password"));
			user.setType(resultSet.getString("type"));

			usersList.add(user);
		}

		return usersList;
	}

	public boolean validateLogin(String login) throws Exception {

		String sql = "SELECT COUNT(1) AS qtde FROM users WHERE login = '" + login + "'";
		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();
		if (resultSet.next()) {

			return resultSet.getInt("qtde") <= 0; /* Return True */
		}

		return false;
	}

	public boolean validateLoginUpdate(String login, String id) throws Exception {

		String sql = "SELECT COUNT(1) AS qtde FROM users WHERE login = '" + login + "' AND id <> " + id;
		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();
		if (resultSet.next()) {

			return resultSet.getInt("qtde") <= 0; /* Return True */
		}

		return false;
	}

	public boolean validadePass(String password) {
		if (password.length() < 6) {
			return false;
		} else
			return true;
	}

}
