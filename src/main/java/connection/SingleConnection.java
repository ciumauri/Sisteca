package connection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Responsável por realizar uma única conexão com o BD
 * 
 * @author mngol
 *
 */

public class SingleConnection {

	private static String banco = "jdbc:postgresql://localhost:5432/biblioteca-pst?autoReconnect=true";
	private static String user = "postgres";
	private static String password = "Open02110627$*";
	private static Connection connection = null;

	static {
		conectar();
	}

	public SingleConnection() {
		conectar();
	}

	private static void conectar() {
		try {

			if (connection == null) {
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(banco, user, password);
				connection.setAutoCommit(false);
			}

		} catch (Exception e) {
			throw new RuntimeException("Erro ao conectar com o BD");
		}
	}
	
	public static Connection getConnection() {
		return connection;
	}

}
