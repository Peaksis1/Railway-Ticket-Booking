

<%
if(request.getParameter("val")!=null)
{
int a=Integer.parseInt(request.getParameter("val"));
String b=request.getParameter("val2");
int c=Integer.parseInt(request.getParameter("val3"));
String d=request.getParameter("val4");
String e=request.getParameter("val5");

session.setAttribute("trainno",a);
session.setAttribute("class",b);
session.setAttribute("price",c);
session.setAttribute("source",d);
session.setAttribute("destination",e);
}
String n=(String)session.getAttribute("loggedin");
if(n==null)
{	
%>
<script>
alert("LOGIN FIRST :D");
window.location="LOGIN2.HTML";

</script>
<%
}
%>
<html>
<head>
<Style>
@import url("css/csspassenger.css");
</style>
<script>
var a=-1;
var names=new Array();
var age=new Array();
var sex=new Array();

function store()
{
if(document.getElementById('name').value=="")
{
alert("Enter a name");return;
}
if(document.getElementById('age').value=="")
{
alert("Enter age");return;
}
a++;
var tab2=document.getElementById('display');
var row=tab2.insertRow(a);
var val1=row.insertCell(0);
var val2=row.insertCell(1);
var val3=row.insertCell(2);
var v3=document.getElementsByName('sex1');
names[a]=document.getElementById('name').value;
age[a]=document.getElementById('age').value;
val1.innerHTML=document.getElementById('name').value;
val2.innerHTML=document.getElementById('age').value;
if(v3[0].checked)
{val3.innerHTML=v3[0].value;
sex[a]=v3[0].value;
}
else
{val3.innerHTML=v3[1].value;sex[a]=v3[1].value;}
document.getElementById('tab').style.visibility='visible';
document.getElementById('name').value="";
document.getElementById('age').value="";
}
function delrow()
{
document.getElementById('display').deleteRow(a);
a--;
names.splice(a+1,1);
if(a==-1)
{
document.getElementById('tab').style.visibility='hidden';
}
}
function aja()
{
	var s1="names="+names+"&age="+age+"&sex="+sex;
	window.location="price.jsp?"+s1;
}
</script>
</head>
<body>
<h1><center>Enter Passenger Details</center></h1>
<div class='divmain'>
<BR><BR><BR>
<form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Enter Name:
<input class='ipc' type='text' id='name' name='name'>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Enter Age:
<input class='ipc' type='number' id='age' name='age'>
<BR><BR><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input class='ipc' type='radio' id='sex' name='sex1' value='m' checked>MALE
<input class='ipc' type='radio' id='sex' name='sex1' value='f'>FEMALE<BR>
<input class='mybutton2'type='button' value="ADD PASSENGER" onclick='store()'>
</form>
<div id='tab' class='div1'>
<table border=4 id='display'></table>
<form>
<input class='mybutton2'type='button' value='DELETE INFORM.' onclick='delrow()'></form>
</div>
<BR><input class='mybutton'type='button' value='GO' onclick='aja()'>
<div id="here"></div>
</div>
<div id="loginplease"></div>
</body>
</html>
