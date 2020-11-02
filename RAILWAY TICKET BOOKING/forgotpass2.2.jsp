<%@page import="java.sql.*"%>
<%@ page import="java.util.*,java.io.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
String to=request.getParameter("emailid");
session.setAttribute("email1",to);
Class.forName("com.mysql.jdbc.Driver");         
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/railway","root","prakhar");  
PreparedStatement smt=con.prepareStatement("select * from registered where email=?;");
	smt.setString(1,to);
    ResultSet rs=smt.executeQuery();
	String a="";
	while(rs.next())
	{
		a=rs.getString(7);
	}
	if(a=="")
	{con.close();
		%><script>alert("MAIL NOT REGISTERED");window.location="forgotpass1.1.jsp";</script><%
	}
String from="iamafan84@gmail.com";
final String username="iamafan84@gmail.com";
final String password="prakhars";
String subject="RESET PASSWORD";
Random rand=new Random();
int n=rand.nextInt(99999);
String body=n+" IS YOUR OTP to verify";
String host="smtp.gmail.com";
Properties obj=new Properties();
obj.put("mail.smtp.auth","true");
obj.put("mail.smtp.starttls.enable","true");
obj.put("mail.smtp.host",host);
obj.put("mail.smtp.port","587");

Session mailsession=Session.getInstance(obj,new javax.mail.Authenticator()
{
	protected PasswordAuthentication getPasswordAuthentication(){
	return new PasswordAuthentication(username,password);	}
}
);
try
{
	MimeMessage message=new MimeMessage(mailsession);
	message.setFrom(new InternetAddress(from));
	message.setRecipient(Message.RecipientType.TO,new InternetAddress(to));
	message.setSubject(subject);
	message.setText(body);
	Transport.send(message);
	con.close();
	String s2=String.valueOf(n);
	response.sendRedirect("forgotpass3.3.jsp?otp="+s2);
}

catch(Exception e){
out.println(e);
}

%>