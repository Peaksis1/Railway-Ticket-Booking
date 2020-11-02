			<% 
			String n=(String)session.getAttribute("loggedin");
if(n==null)
{
	
out.println("<a href='LOGIN.HTML'>LOGIN</a>");
}
else{
	out.println("<a  href='logout.jsp' >LOGOUT</a>");

}
%>
