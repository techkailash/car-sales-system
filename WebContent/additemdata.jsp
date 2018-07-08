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
String date=request.getParameter("date");
String imagelocation=request.getParameter("imagelocation");
String des=request.getParameter("des");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");


try{
PreparedStatement ps1=con.prepareStatement("select max(id) from additem");
ResultSet rs=ps1.executeQuery();
if(rs.next())
{
id=rs.getInt(1);
id++;
}
PreparedStatement ps=con.prepareStatement("insert into additem values(?,?,?,?,?,?)");
ps.setInt(1, id);
ps.setString(2,productname);
ps.setString(3,productprize);
ps.setString(4,date);
ps.setString(5,imagelocation);
ps.setString(6,des);
int s=ps.executeUpdate();
if(s>0){
	%>
<jsp:forward page="adminloginsuccess.jsp"/>

	<%
}
else{
	%>
	<jsp:forward page="error.html" />
	<%
}
}catch(SQLException e2){
	e2.printStackTrace();
	%>
	<jsp:forward page="error.html" />
	<%
}
%>

</body>
</html>