

import java.io.IOException;


import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userSymptomUpdate
 */
@WebServlet("/precautions")
public class userSymptomUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static java.sql.Connection con;
	static Statement st;
	static Statement st1;
	
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
			con = DriverManager.getConnection(url, username, password);

		} catch (SQLException e) {
			System.out.println("Connection Failed! Check output console. ");
			e.printStackTrace();
		}
		if (con == null) {
			System.out.println("Failed to make connection!.. ");
		}
		else
			System.out.println("connection established");		
	}
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userSymptomUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		String dname=request.getParameter("dname");
		String email=request.getParameter("email");
		String keyword[] = request.getParameterValues("symptom");
		ResultSet rs;
		String key;
		String precaution;
		DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		
		try {
			st=con.createStatement();
			st1=con.createStatement();
			rs=st.executeQuery("select * from disease where diseaseName='"+dname+"'");
		
		while(rs.next()){
		for(String word:keyword){
			
				if(word.equalsIgnoreCase(rs.getString("symptom_keyword"))){
					key=rs.getString("symptom_keyword");
					precaution=rs.getString("symptom_keyword");
					System.out.println(rs.getString("precautions")); 
					//st1.executeUpdate("insert into symptom_extraction(emailid) values('"+email+"')"); 
		st1.executeUpdate("insert into symptom_extraction(emailid,symptom,extracted_symptom,precautions,symptom_date) (select u.email,d.diseaseName,d.symptom_keyword, d.precautions, curdate() from users u, disease d where d.diseaseName='"+dname+"'and u.email='"+email+"' and d.symptom_keyword='"+key+"')");
				}
	}
		}
		request.getRequestDispatcher("precautions.jsp").forward(request, response);
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
