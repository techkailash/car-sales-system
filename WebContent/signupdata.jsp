<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
int id=1;
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String email=request.getParameter("email");
String username=request.getParameter("username");
String phonenumber=request.getParameter("phonenumber");
String cpassword=request.getParameter("cpassword");
String address=request.getParameter("address");
int flag=0;

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr"); 


try
{
 
	PreparedStatement ps1= con.prepareStatement("SELECT * FROM signupdata where username=?" );
	
        ps1.setString(1,username);
	 ResultSet rs = ps1.executeQuery();
	if(rs.next())
	{
		flag=1;
		%>
    	<jsp:forward page="usernamealready.html" />  
    	<%
		
	}
	else
	{
		flag=0; // conn.close();
	}
}
catch(Exception E)
{
	out.println("Error  "+E);
}

if(flag==0)
{
try
{
	
	PreparedStatement ps2=con.prepareStatement("select max(id) from signupdata");
	ResultSet rs=ps2.executeQuery();
	if(rs.next())
	{
	id=rs.getInt(1);
	id++;
	}

String sql="insert into signupdata values(?,?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,id);
ps.setString(2,firstname);
ps.setString(3,lastname);
ps.setString(4,email);
ps.setString(5, username);
ps.setString(6, phonenumber);
ps.setString(7, cpassword);
ps.setString(8, address);
int s=ps.executeUpdate();
if(s>0)
{
	%>
	<jsp:forward page="signupsuccess.html" />  
	<%
}
else
{
	%>
	<jsp:forward page="notregister.html" />  
	<%
}
}

catch(Exception e)
{
	%>
	<jsp:forward page="error.html" />  
	<%	
}
}

%>
</body>
</html>