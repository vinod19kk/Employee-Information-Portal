<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
 <%@ page import="javax.servlet.http.HttpSession"%>
 <%@ page language="java"%>
 <%@ page session="true"%>
 <%
 
 try{
	    //PrintWriter out=response.getWriter();
	 	 String driverName = "com.mysql.jdbc.Driver";
		  String url = "jdbc:mysql://localhost:3306/";
		  String dbName = "userdetails";
	 	 String userName = "root";
	     String password = "180";
	       Connection con = null;
	       Class.forName(driverName);
	      con = DriverManager.getConnection(url+dbName,userName,password);
	      
	      String id = session.getAttribute("id").toString();
	      
	      String q = "select * from userdetails.image where id="+id+"";
	      Statement ps=con.createStatement();
	     
	      ResultSet  rs = ps.executeQuery(q);
			
	      	String imgLen="";
			String eid="";
			String ename="";
			String edomain="";
			String eaddress="";
			String eemail="";
			String econtact="";
			
			if(rs.next())
			{
				imgLen=rs.getString(8);
				eid = rs.getString(2);
				ename = rs.getString(3);
				edomain = rs.getString(4);
				eaddress = rs.getString(5);
				eemail = rs.getString(6);
				econtact = rs.getString(7);
				
				session.setAttribute("eid", eid);
				session.setAttribute("ename", ename);
				session.setAttribute("edomain", edomain);
				session.setAttribute("eaddress", eaddress);
				session.setAttribute("eemail", eemail);
				session.setAttribute("econtact", econtact); 
				
				int len = imgLen.length();
				byte[] rb=new byte[len];
				InputStream readImg = rs.getBinaryStream(8);
				int index = readImg.read(rb,0,len);
				ps.close();
				response.reset();
				response.setContentType("image/jpg");
				ServletOutputStream s = response.getOutputStream();
				s.write(rb,0,len);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
			
			/* rs = ps.executeQuery(q); */
			
			/* if(rs.next())
			{
				int len = imgLen.length();
				byte[] rb=new byte[len];
				InputStream readImg = rs.getBinaryStream(8);
				int index = readImg.read(rb,0,len);
				ps.close();
				response.reset();
				response.setContentType("image/jpg");
				ServletOutputStream s = response.getOutputStream();
				s.write(rb,0,len);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}  */
			
			System.out.println(eid);
			System.out.println(ename);
			System.out.println(edomain);
			System.out.println(eaddress);
			System.out.println(eemail);
			System.out.println(econtact);

	  }
	 catch (Exception e)
 	{
	    out.println(e.getMessage());
	}
 

 
   /* try{
    //PrintWriter out=response.getWriter();

  out.println("Retrieve Image Example!");
  String driverName = "com.mysql.jdbc.Driver";
  String url = "jdbc:mysql://localhost:3306/";
  String dbName = "userdetails";
  String userName = "root";
     String password = "180";
       Connection con = null;
       Class.forName(driverName);
      con = DriverManager.getConnection(url+dbName,userName,password);
        Statement st = con.createStatement();
     PreparedStatement pre1 = con.prepareStatement("select * from image where imageId="+4);
 ResultSet rs1=pre1.executeQuery();
while(rs1.next())   
 {byte[] bytearray1 = new byte[4096];  
           int size1=0;  
          InputStream sImage1;  
            sImage1 = rs1.getBinaryStream(2);  
            response.reset();  
           response.setContentType("image/jpeg");  
           response.addHeader("Content-Disposition","filename=logo.jpg");  
           while((size1=sImage1.read(bytearray1))!= -1 )  
             {  
               response.getOutputStream().write(bytearray1,0,size1);  
             }  
        }
  }
 catch (Exception e){
         out.println(e.getMessage());
        } */
%>



</body>
</html>