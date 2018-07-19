

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/add")
@MultipartConfig(maxFileSize=16177216)
public class add extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public add() 
    {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String eid=request.getParameter("eid");
		String ename=request.getParameter("ename");
		String edomian=request.getParameter("edomian");
		String eaddress=request.getParameter("eaddress");
		String eemail=request.getParameter("eemail");
		String econtact=request.getParameter("econtact");
		
		InputStream is=null;
		Part filePart=request.getPart("eimage");
		if(filePart!=null)
		{
			is=filePart.getInputStream();
		}
		
		
		Connection con=DBConnection.getMySqlConnection();
		String sql="insert into userdetails.image(eid,name,domain,address,email,contact,imageLocation) values(?,?,?,?,?,?,?)";
		
		try {
		
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1,eid);
			ps.setString(2,ename);
			ps.setString(3, edomian);
			ps.setString(4, eaddress);
			ps.setString(5, eemail);
			ps.setString(6,econtact);
			//ps.setString(7, eimage);
			if(is!=null)
			{
				ps.setBlob(7, is);
			}
			ps.execute();
			
			response.sendRedirect("login_success.html");
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
