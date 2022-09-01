package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoBook;
import enums.BookStatus;
import model.Book;

@WebServlet("/cadastrarLivro")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoBook daoBook = new DaoBook();

	public BookServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		try {

			String action = request.getParameter("action");
			String book = request.getParameter("book");
			String status = request.getParameter("status");

			if (action.equalsIgnoreCase("deleteBook")) {
				daoBook.deleteBook(book);
				RequestDispatcher view = request.getRequestDispatcher("/cadastrolivro.jsp");
				request.setAttribute("books", daoBook.selectAllBooks());

				System.out.println(status);
				if (status.equalsIgnoreCase("disponivel") || status.equalsIgnoreCase("emprestado")) {
					request.setAttribute("msg", "Este livro não pode ser excluído!");
				} else {
					request.setAttribute("msg", "Livro excluído com sucesso!");
				}
				view.forward(request, response);

			} else if (action.equalsIgnoreCase("updateBook")) {

				Book bookSelect = daoBook.selectBook(book);

				RequestDispatcher view = request.getRequestDispatcher("/cadastrolivro.jsp");
				request.setAttribute("book", bookSelect);
				view.forward(request, response);

			} else if (action.equalsIgnoreCase("selectAllBooks")) {

				RequestDispatcher view = request.getRequestDispatcher("/cadastrolivro.jsp");
				request.setAttribute("books", daoBook.selectAllBooks());
				view.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action != null && action.equalsIgnoreCase("reset")) {

			try {

				RequestDispatcher view = request.getRequestDispatcher("/cadastrolivro.jsp");
				request.setAttribute("books", daoBook.selectAllBooks());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String author = request.getParameter("author");
			LocalDate date = LocalDate.parse(request.getParameter("date"));
			String status = request.getParameter("status");

			try {

				String msg = null;
				boolean canInsert = true;

				if (name == null || name.isEmpty()) {
					msg = "O nome do livro deve ser informado";
					canInsert = false;

				} else if (author == null || author.isEmpty()) {
					msg = "O autor do livro deve ser informado";
					canInsert = false;

				} else if (date == null || date.toString().isEmpty() || date.toString().equals("")) {
					msg = "A data de publicação do livro deve ser informada";
					canInsert = false;

				} else if (status == null || status.isEmpty()) {
					msg = "O status do livro deve ser informado";
					canInsert = false;

				} else if (id == null || id.isEmpty() && !daoBook.validateBook(name)) {// NeW Book
					msg = "Já existe um livro cadastrado com este nome!";
					canInsert = false;
				}

				Book book = new Book();

				book.setId(!id.isEmpty() ? Long.parseLong(id) : null);
				book.setName(name);
				book.setAuthor(author);

				if (date != null || !date.toString().isEmpty())
					book.setDate(date);

				if (status != null || !status.isEmpty())
					book.setStatus(BookStatus.valueOf(status));

				if (msg != null) {
					request.setAttribute("msg", msg);
				} else if (id == null || id.isEmpty() && daoBook.validateBook(name) && canInsert) {
					daoBook.insertBook(book);
					msg = "Livro cadastrado com sucesso!";
				}

				else if (id != null && !id.isEmpty()) {
					if (!daoBook.validateBookUpdate(name, id)) {
						msg = "Já existe um livro cadastrado com este nome!";
						canInsert = false;

					} else {
						daoBook.updateBook(book);
						msg = "Livro atualizado com sucesso!";
					}
				}

				if (!canInsert) {
					request.setAttribute("book", book);
				}

				RequestDispatcher view = request.getRequestDispatcher("/cadastrolivro.jsp");
				request.setAttribute("books", daoBook.selectAllBooks());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}
