<%@page import="java.sql.*"%>
<%
int f=1;
    try
    {
		String uname,pass;int typ;
		
		uname=request.getParameter("userid");
		pass=request.getParameter("pass");
		
    Class.forName("com.mysql.jdbc.Driver");         
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/railway","root","prakhar");  
    Statement smt=con.createStatement();
    ResultSet rs=smt.executeQuery("select * from registered;");         
    while(rs.next())
    {
        if((rs.getString(2).equals(uname))&&(rs.getString(7).equals(pass)))
		{f=0;
		session.setAttribute("loggedin",uname);
		response.sendRedirect("sordest.jsp");}
    }
	if(f==1)
	{
      %>
<script>
alert("USERNAME or PASSWORD is not correct. Please Retry");
 window.location = 'LOGIN.HTML';
</script>
<%	
	}
    con.close();
}
    catch(Exception e){
		
      %>
<html>
<head>
<script>
alert("Something Wrong");
</script>
</head>
</html>
<%
out.println(e);
      %>
<%	
       }
%>