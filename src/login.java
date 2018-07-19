

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String email=request.getParameter("user");
		String password=request.getParameter("password");
		
		String dbEmail="";
		String dbPassword="";
		
		Connection con=DBConnection.getMySqlConnection();
		String sql="select * from userdetails.login where username=? and password=?";
		
		try {
		
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,password);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				
				dbEmail=rs.getString(2);
				dbPassword=rs.getString(3);
				
			}
			
			if(dbEmail.equals(email)&&dbPassword.equals(password))
			{
				System.out.println("success");
				response.sendRedirect("login_success.html");
			}
			
			else
			{
				
				System.out.println("fail");
				out.println("<h3>Invalid  Username  or  Password</h3>");
				RequestDispatcher rd=request.getRequestDispatcher("login.html");
				rd.include(request,response);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
