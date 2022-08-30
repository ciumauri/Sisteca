package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoUser;
import model.User;

@WebServlet("/cadastrarUsuario")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUser daoUser = new DaoUser();

	public UserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		try {

			String action = request.getParameter("action");
			String user = request.getParameter("user");
			String type = request.getParameter("type");

			if (action.equalsIgnoreCase("deleteUser")) {
				daoUser.deleteUser(user);
				RequestDispatcher view = request.getRequestDispatcher("/cadastrousuario.jsp");
				request.setAttribute("users", daoUser.selectAllUsers());
				
				if (type.equalsIgnoreCase("administrador")) {
					request.setAttribute("msg", "Usuário não pode ser excluído!");
				} else {
					request.setAttribute("msg", "Usuário excluído com sucesso!");
				}
				view.forward(request, response);

			} else if (action.equalsIgnoreCase("updateUser")) {

				User userSelect = daoUser.selectUser(user);

				RequestDispatcher view = request.getRequestDispatcher("/cadastrousuario.jsp");
				request.setAttribute("user", userSelect);
				view.forward(request, response);

			} else if (action.equalsIgnoreCase("selectAllUsers")) {

				RequestDispatcher view = request.getRequestDispatcher("/cadastrousuario.jsp");
				request.setAttribute("users", daoUser.selectAllUsers());
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

				RequestDispatcher view = request.getRequestDispatcher("/cadastrousuario.jsp");
				request.setAttribute("users", daoUser.selectAllUsers());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String login = request.getParameter("login");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String type = request.getParameter("type");

			User user = new User();
			user.setId(!id.isEmpty() ? Long.parseLong(id) : null);
			user.setName(name);
			user.setLogin(login);
			user.setEmail(email);
			user.setPassword(password);
			user.setType(type);

			try {
				System.out.println(type);
				String msg = null;
				boolean canInsert = true;

				if (name == null || name.isEmpty()) {
					msg = "O nome deve ser informado";
					canInsert = false;

				} else if (login == null || login.isEmpty()) {
					msg = "O login deve ser informado";
					canInsert = false;

				} else if (email == null || email.isEmpty()) {
					msg = "O email deve ser informado";
					canInsert = false;

				} else if (id == null || id.isEmpty() && !daoUser.validateLogin(login)) {// NeW user
					msg = "Já existe um usuário cadastrado com este login!";
					canInsert = false;

				} else if (id == null || id.isEmpty() && !daoUser.validadePass(password)) {// NeW user
					msg = "\n A senha precisa conter pelo menos 6 dígitos!";
					canInsert = false;
				}

				else if (id == null || id.isEmpty() && daoUser.validateLogin(login) && canInsert
						&& daoUser.validadePass(password)) {

					daoUser.insertUser(user);
					msg = "Usuário cadastrado com sucesso!";

				}
				
				else if (id != null && !id.isEmpty()) {
					if (!daoUser.validateLoginUpdate(login, id)) {
						msg = "Já existe um usuário cadastrado com este login!";
						canInsert = false;
					} else if (id != null && !id.isEmpty() && !daoUser.validadePass(password)) {
						msg = "\n A senha precisa conter pelo menos 6 dígitos!";
						canInsert = false;
						
					} else if (type.equalsIgnoreCase("administrador")) {
						msg = "Usuário não pode ser atualizado!";
						

					} else {
						daoUser.updateUser(user);
						msg = "Usuário atualizado com sucesso!";
						
					}
				}

				if (msg != null) {
					request.setAttribute("msg", msg);
				}

				if (!canInsert) {
					request.setAttribute("user", user);
				}

				RequestDispatcher view = request.getRequestDispatcher("/cadastrousuario.jsp");
				request.setAttribute("users", daoUser.selectAllUsers());
				view.forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}
