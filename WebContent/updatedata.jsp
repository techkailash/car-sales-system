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
String productname=request.getParameter("productname");
String productprize=request.getParameter("productprize");
String launchdate=request.getParameter("launchdate");
String imagelocation=request.getParameter("imagelocation");
String des=request.getParameter("des");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");


try{

	Statement st=null;
	st=con.createStatement();
	st.executeUpdate("UPDATE additem set productname='"+productname+"' , productprize= '"+productprize+"', launchdate = '"+launchdate+"',imagelocation = '"+imagelocation+"',des = '"+des+"'Where id= '"+id+"'");
	System.out.println("done!! updating1");
	{
	%>
	<jsp:forward page="allProduct.jsp"></jsp:forward>
	<% 
	}
}
catch(SQLException e2){
	e2.printStackTrace();
	%>
	<jsp:forward page="error.html" />
	<%
}
%>

</body>
</html>