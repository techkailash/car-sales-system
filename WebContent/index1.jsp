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
	margin-top:200px;
	margin-bottom:200px;
	
}
	</style>
</head>
<body>
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
	
<li class="active"><a href="#" >Home</a></li>
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


<!-- end logo and navigation-->
	<!--image slider-->
	<div class="container-fluid img_slider">
<div class="container">
  <div id="myCarousel" class="carousel slide slide_img" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="images/carousel/1.jpg" alt="Los Angeles" style="width:100%;">
        <div class="carousel-caption">
          <h3>Skoda Ocativa </h3>
          <p>Launch Data: Aug 2019 !</p>
        </div>
      </div>

      <div class="item">
        <img src="images/carousel/2.jpg" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
          <h3>Tata Nexon </h3>
          <p>Launch Data: Aug 2019 !</p>
        </div>
      </div>
    
      <div class="item">
        <img src="images/carousel/3.jpg" alt="New York" style="width:100%;">
        <div class="carousel-caption">
          <h3>Audi Q7 </h3>
          <p>Launch Data: Aug 2019 !</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

	</div><!--container-fluid end-->
	<!--end of image slider-->
	<!--start product-->
	<div class="container-fluid our_product">
	<div class="container">
	<h1 class="page-header text-center">Our Product</h1>
	<div class="row">
	<div class="col-sm-3 col-xs-6 thumbnail ">
	<img src="images/products/1.jpg" alt="productimgae" class="img-responsive img-thumbnail "/>
	  <div class="row text-center">
                            <div class="caption">
                                <h3><a href="#">Skoda Ocativa </a></h3>
                                <p>Price : <strong>$ 3,45,900</strong>  </p>
                                <p>Launch Data: Aug 2019</p>
								<p><a href="#" class="btn btn-primary" role="button">Coming soon</a></p>
                         
                    </div>	
	
	</div>
	</div>
	<div class="col-sm-3 col-xs-6 thumbnail ">
	<img src="images/products/2.jpg" alt="productimgae" class="img-responsive img-thumbnail "/>
	  <div class="row text-center">
                            <div class="caption">
                                <h3><a href="#">Bmw A1</a></h3>
                                <p>Price : <strong>$ 3,45,900</strong>  </p>
                                <p>Launch Data: Aug 2018</p>
                                <p><a href="#" class="btn btn-primary" role="button">Coming soon</a></p>
                         
                    </div>	
	
	</div>
	</div>
	<div class="col-sm-3 col-xs-6 thumbnail ">
	<img src="images/products/3.jpg" alt="productimgae" class="img-responsive img-thumbnail "/>
	  <div class="row text-center">
                            <div class="caption">
                                <h3><a href="#">Tata Nexon </a></h3>
                                <p>Price : <strong>$ 5,45,900</strong>  </p>
                                <p>Launch Data: Aug 2019</p>
                                <p><a href="#" class="btn btn-primary" role="button">Coming soon</a></p>
                         
                         
                    </div>	
	
	</div>
	</div>
	<div class="col-sm-3 col-xs-6 thumbnail ">
	<img src="images/products/4.jpg" alt="productimgae" class="img-responsive img-thumbnail "/>
	  <div class="row text-center">
                            <div class="caption">
                                <h3><a href="#">Audi Q7 </a></h3>
                                <p>Price : <strong>$ 9,45,900</strong>  </p>
                                <p>Launch Data: Aug 2019</p>
<p><a href="#" class="btn btn-primary" role="button">Coming soon</a></p>
                         
                         
                    </div>	
	
	</div>
	</div>
	</div>
	<!--product row second-->
	<div class="row">
	<div class="col-sm-3 col-xs-6 thumbnail ">
	<img src="images/products/5.jpg" alt="productimgae" class="img-responsive img-thumbnail "/>
	  <div class="row text-center">
                            <div class="caption">
                                <h3><a href="#">Alto 800 </a></h3>
                                <p>Price : <strong>$ 3,45,900</strong>  </p>
                                <p>Launch Data: Aug 2032</p>
<p><a href="#" class="btn btn-primary" role="button">Coming soon</a></p>
                         
                         
                    </div>	
	
	</div>
	</div>
	<div class="col-sm-3 col-xs-6 thumbnail ">
	<img src="images/products/6.jpg" alt="productimgae" class="img-responsive img-thumbnail "/>
	  <div class="row text-center">
                            <div class="caption">
                                <h3><a href="#">Nissan X-Trail </a></h3>
                                <p>Price : <strong>$ 9,45,900</strong>  </p>
                                <p>Launch Data: Aug 2019</p>
<p><a href="#" class="btn btn-primary" role="button">Coming soon</a></p>
                         
                         
                    </div>	
	
	</div>
	</div>
	<div class="col-sm-3 col-xs-6 thumbnail ">
	<img src="images/products/7.jpg" alt="productimgae" class="img-responsive img-thumbnail "/>
	  <div class="row text-center">
                            <div class="caption">
                                <h3><a href="#"> Renault Captur</a></h3>
                                <p>Price : <strong>$ 66,45,900</strong>  </p>
                                <p>Launch Data: Aug 2023</p>
<p><a href="#" class="btn btn-primary" role="button">Coming soon</a></p>
                         
                         
                    </div>	
	
	</div>
	</div>
	<div class="col-sm-3 col-xs-6 thumbnail ">
	<img src="images/products/8.jpg" alt="productimgae" class="img-responsive img-thumbnail "/>
	  <div class="row text-center">
                            <div class="caption">
                                <h3><a href="#"> Audi Q5 New </a></h3>
                                <p>Price : <strong>$ 77,45,900</strong>  </p>
                                <p>Launch Data: Aug 2017</p>
                                <p><a href="#" class="btn btn-primary" role="button">Coming soon</a></p>
                         
                         
                    </div>	
	
	</div>
	</div>
	
</div>

</div>
</div>
	<!--end of product-->
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