<%@page import="java.sql.*"%>

<%

String g=request.getParameter("sex");
String gen[]=g.split(",");
String n=request.getParameter("names");
String name[]=n.split(",");
String a=request.getParameter("age");
String b[]=a.split(",");
String a1=(String)session.getAttribute("class");

String b1=String.valueOf(session.getAttribute("trainno"));
int b2=Integer.parseInt(b1);
String b3=String.valueOf(session.getAttribute("price"));
int s=0;

Class.forName("com.mysql.jdbc.Driver");           
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/railway","root","prakhar"); 
PreparedStatement ps=con.prepareStatement("select * from trains natural join fair where train_no=? and class=? ;");
ps.setInt(1,b2);
ps.setString(2,a1);
out.println("<table border='1'>");
out.println("<tr><th>Train No.</th><th>Train Name</th><th>Source</th><th>Destination</th><th>Arrives</th><th>Departs</th><th>Duration</th><th>Class</th></tr>");


ResultSet rs=ps.executeQuery();
while(rs.next())
{
	
	out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td></tr>");
}



out.println("</table>");	
out.println("<table border=1 align='center'>");
out.println("<tr><th>Name</th><th>age</th><th>gender</th><th>charge</th></tr>");
for(int i=0;i<name.length;i++)
{
if(Integer.parseInt(b[i])<=10)
out.println("<tr><td>"+name[i]+"</td><td>"+b[i]+"</td><td>"+gen[i]+"</td><td>0</td></tr>");
else {
	s=s+Integer.parseInt(b3);
out.println("<tr><td>"+name[i]+"</td><td>"+b[i]+"</td><td>"+gen[i]+"</td><td>"+Integer.parseInt(b3)+"</td></tr>");}
}
out.println("<tr><td colspan=3>TOTAL</td><td>"+s+"</td></tr>");
out.println("</table>");
%>