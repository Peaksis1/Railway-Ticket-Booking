<html>
<head>
<script>
function verifyotp()
{
<%
String a=request.getParameter("otp");
session.setAttribute("otp",a);
%>
return true;
}
</script>


</head>
<body>
<div id="display">
<form onsubmit="return verifyotp()" action="forgotpass4.4.jsp">
<input type='number' name='otp1' id="otp1">
<input type='submit'value="VERIFY" >
</form>
</body>
</html>

