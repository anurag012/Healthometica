import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/registeration")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static java.sql.Connection connection;
	static PreparedStatement pstmt;
	
	public static void DatabaseConn() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return;
		}
		try {
			String url="jdbc:mysql://localhost:3306/hci";
			String username="root";
			String password="1234";
			//Database connection is established
			connection = DriverManager.getConnection(url, username, password);

		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console. ");
			e.printStackTrace();
		}
		if (connection == null) {
			System.out.println("Failed to make connection!.. ");
		}
		else
			System.out.println("connection established");		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DatabaseConn();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		String username = request.getParameter("username");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String password=request.getParameter("pwd");
		System.out.println(username+""+age+""+email+""+gender);
		try {
			java.sql.Statement stmt = connection.createStatement();
			//ResultSet rs = stmt.executeUpdate("insert into users values ('"+username+"',"+age+",'"+gender+"','"+email+"');");
			String query = "insert into users (name,age,gender,email,password) values ('"+username+"',"+age+",'"+gender+"','"+email+"','"+password+"');";
			stmt.executeUpdate(query);
			stmt.executeUpdate("insert into user_history(email) values ('"+email+"')");
			System.out.println("Values inserted");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("uname", username);
		request.setAttribute("age", age);
		request.setAttribute("gender", gender);
		request.setAttribute("email", email);
		request.getRequestDispatcher("Home.jsp").forward(request, response);
		
	}

}
