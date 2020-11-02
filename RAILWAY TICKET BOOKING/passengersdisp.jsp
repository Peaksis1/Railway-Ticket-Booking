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
	/*var obj=new XMLHttpRequest();
	obj.onreadystatechange=function()
	{
		if((obj.readyState==4)&&(obj.status==200))
		{
		window.location="price.jsp";
		}
		
	}
	var s1="names="+names+"&age="+age+"&sex="+sex;
	obj.open("GET","price.jsp?"+s1,true);
	obj.send();
*/
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
</body>
</html>
