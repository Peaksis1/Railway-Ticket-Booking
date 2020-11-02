<%
String n=(String)session.getAttribute("loggedin");
if(n==null)
{
out.println("<form method='post' action='login2.jsp'>USER ID:<BR><BR><input class='ipc' type='text' name='userid'id='userid' placeholder='ENTER USER ID' required><BR><BR>PASSWORD:<BR><BR><input class='ipc' type='password'name='pass' id='pass'placeholder='ENTER PASSWORD' required><BR><BR><br><br><br><input type='submit' value='LOGIN' id='ub'>");
}
else{out.println("");}
%>