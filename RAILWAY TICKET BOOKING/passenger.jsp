<% 	
try{
String a=request.getParameter("names");
String b=request.getParameter("sex");
out.println(a);
out.println(b);
}
catch(Exception e){
out.println(e);
}
%>