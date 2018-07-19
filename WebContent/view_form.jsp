<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <meta charset="UTF-8">
  <title>View Form</title>
  
      <style>
.btn {
    border: none;
    color: white;
    padding: 14px 28px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 10px;
}

.success {background-color: #4CAF70;} /* Green */
.success:hover {background-color: #46a049;}

table {
    width:70%;
}
table, th, td {
    border: #ffffff;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
    text-align: left;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color: #fff;
}
table#t01 th {
    background-color: #0b5965b8;
    color: white;
}
    </style>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

 <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="javax.servlet.*"%>

</head>
<body>
<% response.setContentType("text/html");
		 PrintWriter outq=response.getWriter();
		 
		 Connection con=null;
			String driverName="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/userdetails";
			String user="root";
			String password="180";
			 String sql="select id,name,domain  from userdetails.image ";
			
			try {
				Class.forName(driverName);
				con=DriverManager.getConnection(url,user,password);
				
				PreparedStatement ps=con.prepareStatement(sql);
	        	 ResultSet rs=ps.executeQuery();
	        	 
	        	 outq.print("<p><table id=t01 border=1 style=\"color:black; margin-right:auto; margin-left:auto; margin-top:2%;\"><th>ID</th><th>Name</th><th>Domain</th><th></th>");
	        	 while(rs.next())
	        	 {
	        		 outq.print("<tr><td>"+ rs.getString(1) +"</td><td>"+rs.getString(2)+"</td><td>"+ rs.getString(3)+"</td>");
	        		 outq.print("<td><button class=\"btn success\"><a style=\"color:white;\" href=view_data.jsp?id="+rs.getString(1)+">View</a></button></td></tr>");
	        	 }
	        	 outq.print("</table></p>");
	        	 con.close();
			} 
			catch (ClassNotFoundException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
         catch(Exception e){}
		 %>

</body>
</html>