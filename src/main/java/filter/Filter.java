package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import connection.SingleConnection;
import model.User;

/**
 * Responsável por interceptar e filtrar todas as requisições ao BD
 * @author mngol
 *
 */

@WebFilter(urlPatterns={ "/acessoliberado.jsp/*","/acessonegado.jsp/*","/cadastrolivro.jsp/*","/cadastrousuario.jsp/*"})
public class Filter implements javax.servlet.Filter {

	private static Connection connection;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		try {
			
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			
			// Retorna null caso não logado
			User user = (User) session.getAttribute("usuario");
						
			if (user == null) { // Usuário não logado
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
				return; // Retorna para a tela de login
			}
			
			// Executa as requisições do Request e Response
			chain.doFilter(request, response);			
			connection.commit();
			
		} catch (Exception e) {
			try {
				e.printStackTrace();
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		connection = SingleConnection.getConnection();
	}

}
