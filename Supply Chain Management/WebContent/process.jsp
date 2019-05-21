   
<jsp:useBean id="obj" class="scm.User"/> 
<jsp:useBean id="reg" class="scm.Register"/> 
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
String name = obj.getUname();
String email = obj.getUemail();
String pass = obj.getUpass();

int status = reg.register(name, email, pass);
if(status>0){
	out.print("registered");
}
else{
	out.print("not");
}
  
%>