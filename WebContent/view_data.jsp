<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>View Data</title>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<script type="text/javascript">
window.onload = function() {
    if (!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
}
</script>

<body>
<div class="table-responsive">          
  <table class="table" border=2>
  <h1 align="center"> DISPLAYING DATA</h1>
  <br>
  
   <% int x= Integer.parseInt(request.getParameter("id")); 
   	  session.setAttribute("id", x); %>
   	  
   <tr><td><img src="fetch_image_data.jsp" width=130 height=130></td></tr>
   <tr><td> <h4> ID       :  ${eid}           </h4> </td></tr>
   <tr><td> <h4> Name     :  ${ename}        </h4> </td></tr>
   <tr><td> <h4> Domain   :  ${edomain}   </h4> </td></tr>
   <tr><td> <h4> Address  :  ${eaddress} </h4> </td></tr>
   <tr><td> <h4> Email    :  ${eemail}     </h4> </td></tr>
   <tr><td> <h4> Contact  :  ${econtact} </h4> </td></tr>
  </table>
</div>
</body>
</html>