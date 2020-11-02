<html>
<head>
<script>
function checkpass()
{
var a=document.getElementById("T7").value;
var b=document.getElementById("T8").value;
if(a!=b)
{
alert("Passwords do not match");
document.getElementById("T7").focus;
return false;
}

}
</script>
<body >
<form METHOD='post' action="forgotpass6.jsp" onsubmit="return checkpass()">
NEW PASSWORD:
<INPUT TYPE='password'  ID="T7"name="T7" class='ipclass' REQUIRED>
<BR><BR><BR>
REENTER NEW PASSWORD:
<INPUT TYPE='password'  ID="T8" name="T8" class='ipclass' REQUIRED>
<BR><BR><br>
<br><br><bR>
<input type='submit' value="REGISTER" class="mybutton" >
</form>
</body>
</html>