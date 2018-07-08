<html>
<head>
<title>Logged out</title>
</head>

<BODY>
	<CENTER>
	<H1> <u><a>Online Shopping Cart</a></u> </H1>
	</CENTER>
	
	<%

	session.setAttribute("username", null);
	session.invalidate();
	response.sendRedirect("index.html");
	
	%>
        <center>
	<BR><BR><BR><BR><b>You have logged out successfully.
        <BR><BR>Return to Shopping Cart? <a href="login.html">Click here</a></b>
        </center>
       
</body>
</html>
