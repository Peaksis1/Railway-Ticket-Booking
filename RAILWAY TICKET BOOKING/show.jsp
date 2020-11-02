<%@page import="java.sql.*"%>

<%

int f=0;
    
    String sourc=request.getParameter("source");
    String dest=request.getParameter("destination");
    String date=request.getParameter("date");
    String clas=request.getParameter("Clas");
Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/railway","root","prakhar");
                PreparedStatement ps=con.prepareStatement("select * from trains natural join fair where source=? and destination=?;");
                ps.setString(1,sourc);
                ps.setString(2,dest);
                
                ResultSet rs=ps.executeQuery();
                
                    
                

                
                
                out.println("<label>"+sourc+"->"+dest+"</label>");
                out.println("<table align='center' class='trains'>");
                out.println("<tr><th>Train No.</th><th>Train Name</th><th>Source</th><th>Destination</th><th>Arrives</th><th>Departs</th><th>Running</th><th>Type</th><th>Duration</th><th>Availability</th><th>Class</th><th>Fare</th></tr>");

                while(rs.next())
                {   f=0;
                    String p=rs.getString(7);
                    String q=rs.getString(10);
                
                    if(p.equalsIgnoreCase("all days"))
                {
                    f=1;

                }
                else{

                
                    String s[]=rs.getString(7).split(",");
                    for(int i=0;i<s.length;i++)
                    {
                    if(date.equalsIgnoreCase(s[i]))
                    {
                        f=1;
                    }
                    }
                }
                if((f==1)&&(q.equalsIgnoreCase(clas))||(clas.equalsIgnoreCase("All class")))
                { 
                out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(12)+"</td><td>"+rs.getString(10)+"</td><td>"+rs.getString(11)+"</td><td><BUTTON onclick='calculate("+rs.getInt(1)+","+"\""+rs.getString(10)+"\""+","+rs.getInt(11)+","+"\""+sourc+"\""+","+"\""+dest+"\""+")'>GO</BUTTON></td></tr>");
                
            }
            }
                out.println("</table>");
                
                con.close();
                
            
        
            %>