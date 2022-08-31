package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnection;
import enums.BookStatus;
import model.Book;

public class DaoBook {

	private Connection connection;

	public DaoBook() {
		connection = SingleConnection.getConnection();
	}

	public void insertBook(Book book) {
		try {

			String sql = "INSERT INTO books(name, author, date, status) VALUES (?, ?, ?, ?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			insert.setString(1, book.getName());
			insert.setString(2, book.getAuthor());
			insert.setString(3, book.getDate().toString());
			insert.setString(4, book.getStatus().toString());
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

	public void updateBook(Book book) {
		try {

			String sql = "UPDATE books SET name = ?, author = ?, date = ?, status = ? WHERE id = " + book.getId();
			PreparedStatement update = connection.prepareStatement(sql);
			update.setString(1, book.getName());
			update.setString(2, book.getAuthor());
			update.setString(3, book.getDate().toString());
			update.setString(4, book.getStatus().toString());
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

	public void deleteBook(String id) {
		try {

			String sql = "DELETE FROM books WHERE id = '" + id + "' AND STATUS = 'indisponivel'";
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

	public Book selectBook(String id) throws Exception {

		String sql = "SELECT * FROM books WHERE id = '" + id + "'";
		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();
		if (resultSet.next()) {
			Book book = new Book();
			book.setId(resultSet.getLong("id"));
			book.setName(resultSet.getString("name"));
			book.setAuthor(resultSet.getString("author"));
			book.setDate(LocalDate.parse(resultSet.getString("date")));
			book.setStatus(BookStatus.valueOf(resultSet.getString("status")));

			return book;
		}

		return null;
	}

	public List<Book> selectAllBooks() throws SQLException {
		List<Book> booksList = new ArrayList<>();

		String sql = "SELECT * FROM books";
		PreparedStatement selectAll = connection.prepareStatement(sql);
		ResultSet resultSet = selectAll.executeQuery();
		while (resultSet.next()) {
			Book book = new Book();
			book.setId(resultSet.getLong("id"));
			book.setName(resultSet.getString("name"));	
			book.setAuthor(resultSet.getString("author"));
			book.setDate(LocalDate.parse(resultSet.getString("date")));
			book.setStatus(BookStatus.valueOf(resultSet.getString("status")));			
					
			booksList.add(book);
		}

		return booksList;
	}

	public boolean validateBook(String name) throws Exception {

		String sql = "SELECT COUNT(1) AS qtde FROM books WHERE name = '" + name + "'";
		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();
		if (resultSet.next()) {

			return resultSet.getInt("qtde") <= 0; /* Return True */
		}

		return false;
	}

	public boolean validateBookUpdate(String name, String id) throws Exception {

		String sql = "SELECT COUNT(1) AS qtde FROM books WHERE name = '" + name + "' AND id <> " + id;
		PreparedStatement select = connection.prepareStatement(sql);
		ResultSet resultSet = select.executeQuery();
		if (resultSet.next()) {

			return resultSet.getInt("qtde") <= 0; /* Return True */
		}

		return false;
	}

}
