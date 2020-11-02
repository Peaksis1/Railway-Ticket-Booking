<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%
try
    {
		String name,id,mail,gen,pass;
		int age,typee;
		long cno;
		name=request.getParameter("T1");
		id=request.getParameter("T2");
		age=Integer.parseInt(request.getParameter("T3"));
		cno=Long.parseLong(request.getParameter("T4"));
		mail=request.getParameter("T5");
		gen=request.getParameter("T6");
		pass=request.getParameter("T7");
    Class.forName("com.mysql.jdbc.Driver");           
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/railway","root","prakhar"); 
    PreparedStatement ps=con.prepareStatement("insert into registered values(?,?,?,?,?,?,?);");
    ps.setString(1,name);
    ps.setString(2,id);
    ps.setInt(3,age);
    ps.setLong(4,cno);
	ps.setString(5,mail);
	ps.setString(6,gen);
	ps.setString(7,pass);
    int x=ps.executeUpdate();           
    if(x==1)
		%>
<script>
alert("REGISTRATION SUCCESSFULL");
</script>
<%
	
    con.close();%><script>
	window.location ="LOGIN2.HTML";</script>
<%}
    catch(Exception e){
		out.print(e);
       }
%>
