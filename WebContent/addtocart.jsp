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

int id=Integer.parseInt(request.getParameter("id"));
   
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
	try{	
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		Statement st=con.createStatement();
		String sql ="select * from additem where  id= '"+id+"'";

		ResultSet rs= st.executeQuery(sql);
		while(rs.next()){
	
	String sql2="insert into addtocart values(?,?,?,?,?,?)";
	PreparedStatement ps2=con.prepareStatement(sql2);
	ps2.setString(1,rs.getString("id"));
	ps2.setString(2,rs.getString("productname"));
	ps2.setString(3,rs.getString("productprize"));
	ps2.setString(4,rs.getString("launchdate"));
	ps2.setString(5,rs.getString("imagelocation"));
	ps2.setString(6, rs.getString("des"));
	int s=ps2.executeUpdate();
	response.sendRedirect("cartitem.jsp");
		}
		
	} catch (Exception e) 
	{
		e.printStackTrace();
		
	}
%>

</body>
</html>
