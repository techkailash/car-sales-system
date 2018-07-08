<!DOCTYPE HTML>
<%@page import="java.sql.*"%>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-compatible" Content="IE-edge">
	<meta name="viewport" content="width=device-width">
	<title>BuyCar</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
   <!-- Fontawesome core CSS -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <!--GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="css/signupcss.css"/>
    <link rel="stylesheet" href="css/mystyle.css" />
	<style>
	.center {text-align: center; margin-left: auto; margin-right: auto; margin-bottom: auto; margin-top: auto;}
	.error
{
	margin-top:30px;
	
	
}
	</style>
</head>
<BODY>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
<jsp:forward page="sessionout.html"/>
<%} else {
%>
<!--Logo bar active-->
<!--logo and navigation-->
<div class="container-fluid nav_bar navbar-fixed-top">
<div class="container">
	       <nav class="navbar navbar-inverse">
		   <div class="container-fluid">
		   <div class="navbar-header">
		   <a href="#" class="navbar-brand">
	<p><span style="font-family:impact; font:bold; font-size:20px; color:white;">BuyCar</span>.com</p></a>

<button type="button"  class="navbar-toggle" data-toggle="collapse" data-target="#kailash" >
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span> 
</button>
</div>
		    <div class="collapse navbar-collapse navbar-right" id="kailash">
		   <ul class="nav navbar-nav">
		  <li>	<form class="navbar-form" action="searchItem1.jsp" method="get">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form></li>
	
<li class="active"><a href="index1.jsp" >Home</a></li>
<li><a href="product1.jsp">Product</a></li>
<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
 <%
	try{	
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		Statement statement=connection.createStatement();
		String sql1 ="SELECT count(id) FROM addtocart";

		ResultSet resultSet = statement.executeQuery(sql1);
		while(resultSet.next()){
	%>
<li><a href="cartitem.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><span style="color:white;"><b><%=resultSet.getString("count(id)") %></b></span></a></ul></li>
<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</div>
</div>
</nav>
</div>
</div>
	<!-- product page-->
<div class="container-fluid our_product">
	<div class="container  error">
	<h1 class="page-header text-center">Latest Product</h1>
	<div class="row">
	
	
 <%
 String search=request.getParameter("search");
	try{	
		Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		Statement statement=connection.createStatement();

		String sql ="select * from additem where productname like '"+search+"%'";

		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
	
	
	<div class="col-sm-3 col-xs-6 thumbnail ">
	<img src="<%=resultSet.getString("imagelocation") %>" alt="productimgae" class="img-responsive img-thumbnail "/>
	  <div class="row text-center">
                            <div class="caption">
                                <h3><a href="#"><%=resultSet.getString("productname") %></a></h3>
                                <p>Price : <strong>$<%=resultSet.getString("productprize") %></strong>  </p>
                                <p>Launch Date:<%=resultSet.getString("launchdate") %></p>
                                <p><a href="addtocart.jsp?id=<%=resultSet.getString("id")%>" class="btn btn-success" role="button" >Add To Cart</a> 
								<a href="#" class="btn btn-primary" role="button">See Details</a></p>
                         
                    </div>	
	
	</div>
	</div>
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
	</div>
	</div>
	</div>
	<!--product page-->
	<!--download app box-->
	<div class="col-md-12 download-app-box text-center">

        <span class="glyphicon glyphicon-download-alt"></span>Download Our Android App and Get 10% additional Off on all Products . <a href="#" class="btn btn-danger btn-lg">DOWNLOAD  NOW</a>

    </div>
    <!--Footer -->
    <div class="col-md-12 footer-box">

        <div class="row">
            <div class="col-md-4">
                <strong>Send a Quick Query </strong>
                <hr>
                <form>
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <input type="text" class="form-control" required="required" placeholder="Name">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <input type="text" class="form-control" required="required" placeholder="Email address">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="form-group">
                                <textarea name="message" id="message" required="required" class="form-control" rows="3" placeholder="Message"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Submit Request</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="col-md-4">
                <strong>Our Location</strong>
                <hr>
                <p>
                     358/1, Bhim Garh Kheri,<br />
                                    Gurgaon, Haryana</br>
                    Call: +91-9818087912<br>
                    Email: BuyCar@hotmail.com<br>
                </p>

                2017 www.BuyCar.com | All Right Reserved
            </div>
            <div class="col-md-4 social-box">
                <strong>We are Social </strong>
                <hr>
                <a href="#"><i class="fa fa-facebook-square fa-3x "></i></a>
                <a href="#"><i class="fa fa-twitter-square fa-3x "></i></a>
                <a href="#"><i class="fa fa-google-plus-square fa-3x c"></i></a>
                <a href="#"><i class="fa fa-linkedin-square fa-3x "></i></a>
                <a href="#"><i class="fa fa-pinterest-square fa-3x "></i></a>
                <p style="text-align:justify;">
                  BuyCar.com is India's leading car search venture that helps users buy cars that are right for them. Its website and app carry rich automotive content such as expert reviews, detailed specs and prices, comparisons as well as videos and pictures of all car brands and models available in India. The company has tie-ups with many auto manufacturers, more than 4000 car dealers and numerous financial institutions to facilitate the purchase of vehicles. 

				  </p>
            </div>
			
        </div>
        <hr>
    </div>
    <!-- /.col -->
    <div class="col-md-12 end-box ">
        &copy; 2014 | &nbsp; All Rights Reserved | &nbsp; www.BuyCar.com | &nbsp; 24x7 support | &nbsp; Email us: BuyCar@hotmail.com
    </div>
  
	<!--end of footer-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
<%
    }
%>

</body>
</html>