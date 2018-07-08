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
String username=request.getParameter("username");
String cpassword=request.getParameter("cpassword");
	
		try
		{
		    Class.forName("oracle.jdbc.driver.OracleDriver");
		    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
	        Statement st = con.createStatement();
	        ResultSet rs;
	        rs = st.executeQuery("select * from signupdata where username='" + username + "' and cpassword='" +cpassword + "'");
	       
	        if(username.equals("admin") && cpassword.equals("adminpass"))
		    {
		    
				session.setAttribute("username",username);
				%>
		    	<jsp:forward page="adminloginsuccess.jsp" />  
		    	<%
		    }
	        
	        else  if (rs.next())
		    {
		        session.setAttribute("username",username);  
				
		    	%>
		    	<jsp:forward page="loginsuccess.jsp" />  
		    	<%
		    	
		    }
		   
		else
		    {
			
			System.out.println("login not match");
			%>
	    	<jsp:forward page="notregister.html" />  
	    	<%
		    }
		}
		catch (Exception ex)
		{
		    System.out.println(ex);
		    %>
	    	<jsp:forward page="error.html" />  
	    	<%
		}

	
%>
</body>
</html>