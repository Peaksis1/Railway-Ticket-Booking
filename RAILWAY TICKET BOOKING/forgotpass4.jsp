<%
String a=(String)session.getAttribute("otp");
int b=Integer.parseInt(a);
String c=request.getParameter("otp1");
int d=Integer.parseInt(c);
if(b==d)
{
	response.sendRedirect("forgotpass5.jsp");
}
else{
%>
<script>alert("WRONG OTP PLEASE RETRY");</script>
<%
}
%>