<%@page import="java.sql.*"%>
<%
try{
	String e=(String)session.getAttribute("email1");
	String e1=request.getParameter("T7");
Class.forName("com.mysql.jdbc.Driver");         
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/railway","root","prakhar"); 
PreparedStatement ps=con.prepareStatement("update registered set password=? where email=?");
ps.setString(1,e1);
ps.setString(2,e);
int rs=ps.executeUpdate();
if(rs==1)
{
%>
<script>alert("Successfully changed password");window.location="LOGIN2.HTML";</script><%	
}	
else
{
	%>
<script>alert("Error Occured");</script><%	
}
}
catch(Exception e)
{
	out.print(e);
}

%>