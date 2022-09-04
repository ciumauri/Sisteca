package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoLogin;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoLogin daoLogin = new DaoLogin();

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		if (Boolean.parseBoolean(request.getParameter("logout"))) {

			// Adiciona usuário logado na sessão
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			session.invalidate();
			response.sendRedirect("../Sisteca/index.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		try {

			String login = request.getParameter("login");
			String password = request.getParameter("password");
			// Validação do usuário e senha no BD
			if (daoLogin.validarLogin(login, password)) {// Acesso Liberado

				User user = new User();
				user.setLogin(login);
				user.setPassword(password);

				// Adiciona usuário logado na sessão
				HttpServletRequest req = (HttpServletRequest) request;
				HttpSession session = req.getSession();
				session.setAttribute("usuario", user);

				// Redireiona para o sistema e autoriza
				RequestDispatcher dispatcher = request.getRequestDispatcher("acessoliberado.jsp");
				dispatcher.forward(request, response);

			} else {// Acesso Negado
				// Redireciona para página de acesso negado
				System.out.println("negou acesso agora");
				RequestDispatcher dispatcher = request.getRequestDispatcher("acessonegado.jsp");
				dispatcher.forward(request, response);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
