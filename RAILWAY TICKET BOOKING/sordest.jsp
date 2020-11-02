<%@page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
    <head>
	<style>
	@import url("css/sordescss.css");
	</style>
        <meta charset="UTF-8">
      
        <script language="javascript" type="text/javascript">
			var obj=new XMLHttpRequest();
	obj.onreadystatechange=function()
	{
		if((obj.readyState==4)&&(obj.status==200))
		{
		document.getElementById("loginout").innerHTML=obj.responseText;
		}
		
	}
	obj.open("GET","checklog.jsp",true);
	obj.send();
			
		
		function calculate(a,b,c,d,e)
		{	
		
window.location.href="passengers.jsp"+"?val="+a+"&val2="+b+"&val3="+c+"&val4="+d+"&val5="+e;
		}
        function opens()
        {   var clas=document.getElementById("class").value;
            var sor=document.getElementById("t1").value;
            var dest=document.getElementById("t2").value;
            if(sor==""||dest=="")
            {
                document.getElementById("error").innerText="Above field required";
            }
        
        else{
            document.getElementById("error").innerText="";
        var dt=document.getElementById("date").value;
        var day=new Array(7);
        day[0]="Sun";
        day[1]="Mon";
        day[2]="Tue";
        day[3]="Wed";
        day[4]="Thu";
        day[5]="Fri";
        day[6]="Sat";

        var d=new Date(dt);
        
        var param="source="+sor+"&destination="+dest+"&date="+day[d.getDay()]+"&Clas="+clas;
            
        
        
         
         
                
            var obj=new XMLHttpRequest();
            obj.onreadystatechange=function()
            {
                if((obj.readyState==4)&&(obj.status==200))
                {
					
                    document.getElementById("disp").innerHTML=obj.responseText;
				
                }
        
            }
            obj.open("GET","show.jsp?"+param,true);
            obj.send();
        }

        }

        </script>
    </head>
    <body >
        <form method="get" action="">
            <div class="div1">
                
                <label>Source:</label>
            <input type="text" list="trains" id="t1" name="t1" required>
            <datalist id="trains">
                <%
					try{
						Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/railway","root","prakhar");
                Statement ps=con.createStatement();
                ResultSet rs=ps.executeQuery("select distinct(source) from trains;");
                while(rs.next())
                {
                out.println("<option>"+rs.getString(1)+"</option>");
                }
                
                %>
            </datalist><br>
            <label>destination:</label>
            <input type="text" list="trains2" id="t2" name="t2" required>
            <datalist id="trains2">
                <%Statement ps1=con.createStatement();
                ResultSet rs1=ps1.executeQuery("select distinct(destination) from trains;");
                while(rs1.next())
                {
                out.println("<option>"+rs1.getString(1)+"</option>");
                }
                con.close();
					}
					catch(Exception e)
					{
						out.println(e);
					}
            %>
            </datalist><br><br><br>
            <label>Date:</label>
            <input type="date" id="date" name="date">
            <label>Class</label>
            <select name="class" id="class">
                <option value="All Class" >All Class</option>
                <option value="sleeper">Sleeper</option>
                <option value="AC two tier">AC two tier</option>
                <option value="AC three tier">AC three tier</option>


                <option value="AC chair car">AC chair car</option>

            </select><br>
            <span id="error" style="font-size:22px;color:red"></span>
            <input type="button" class="butt" onclick="opens()" value="search">
        

        </div>
        </form>
        <div class="out" id="disp">
            <label >Hello Theree</label>           
                </div>
<div id="loginout">

</div>
        
    </body>
</html>