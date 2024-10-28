<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Car Booking | Car Rental</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value="/assets/css/open-iconic-bootstrap.min.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/animate.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/owl.carousel.min.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/owl.theme.default.min.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/magnific-popup.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/aos.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/ionicons.min.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/bootstrap-datepicker.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/jquery.timepicker.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/flaticon.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/icomoon.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/style.css" />">
    <link rel="stylesheet" href="<c:url value="/assets/css/my_1.css" />">
 
  </head>
  <body style="background: url('<c:url value="/assets/images/bg_2-1.jpg"/>') no-repeat center center fixed;-webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" >
	    <div class="container">
	      <a class="navbar-brand" href="${pageContext.request.contextPath}">Car<span>Rental</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="${pageContext.request.contextPath}" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/About" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/Pricing" class="nav-link">Pricing</a></li>
	          <li class="nav-item active"><a href="${pageContext.request.contextPath}/Car" class="nav-link">Our Car</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/Contact" class="nav-link">Contact</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/Profile" class="nav-link">Profile</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/SignOut" class="nav-link">Sign Out</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
   	<div class="my-container row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="my-container" style="margin-top:25%; background-color:rgba(255,255,255,.7); border-radius:25px; box-shadow:5px 5px 20px #000" >
				<form action="${pageContext.request.contextPath}/Car/${car.getId() }/Registration/Submit" method="POST" enctype="multipart/form-data">
					<div  style="width:90%; margin-left:5%;">
						<br>
						<h1 class="my-text-orange" style="margin:5%;">${car.getName() } | Booking</h1>
						<hr style="width:90%; margin-left:5%;">
						<input class="my-input my-text-white" type="text" name="name" value="${user.getFirstName() } ${user.getLastName() }" placeholder="Name" style="width:90%; margin:6% 5%; border-radius:8px; background-color:rgba(0,0,0,.7);" required="required" autocomplete="off" readonly/>
						<input class="my-input my-text-white" type="email" name="email" value="${user.getEmail() }" placeholder="Email" style="width:90%; margin:6% 5%; border-radius:8px; background-color:rgba(0,0,0,.7);" required="required" autocomplete="off" readonly/>
						<input class="my-input my-text-white" type="number" name="contact" value="${user.getContact() }" placeholder="Contact" style="width:90%; margin:6% 5%; border-radius:8px; background-color:rgba(0,0,0,.7);" required="required" autocomplete="off" readonly/>
						
						<!--
						<input class="my-check my-text-white" id="driver" name="driver" type="checkbox" style="margin-left:6%;" autocomplete="off"/> <span style="color:black;">Include Driver</span>
						<br>
						-->
						
						<div id="license">
							<br>
							<div style="color:red; margin-left:6%; margin-bottom:-20px;">License*</div>												
							<input class="my-input my-text-white" type="file" name="licence" placeholder="Licence" style="width:90%; margin:6% 5%; border-radius:8px; background-color:rgba(0,0,0,.7);" required="required" autocomplete="off"/>
						</div>
						<select class="my-input my-text-white" name="pick" style="width:90%; margin:6% 5%; border-radius:8px; background-color:rgba(0,0,0,.7);" required="required" autocomplete="off">
							<option value="" disabled="disabled" selected="selected">--  Select car pickup location  --</option>
							<c:forEach var="city" items="${address }">
								<option value="${city.getId()}">${city.getCity() }</option>
							</c:forEach>
						</select>
						<input class="my-input my-text-white" type="datetime-local" name="pickDate" style="width:90%; margin:6% 5%; border-radius:8px; background-color:rgba(0,0,0,.7);" required="required" autocomplete="off"/>
						<h3 class="my-text-black my-center"><b>To</b></h3>
						<select class="my-input my-text-white" name="return" style="width:90%; margin:6% 5%; border-radius:8px; background-color:rgba(0,0,0,.7);" required="required" autocomplete="off">
							<option value="" disabled="disabled" selected="selected">--  Select car return location  --</option>
							<c:forEach var="city" items="${address }">
								<option value="${city.getId()}">${city.getCity() }</option>
							</c:forEach>
						</select>
						<input class="my-input my-text-white" type="datetime-local" name="returnDate" style="width:90%; margin:6% 5%; border-radius:8px; background-color:rgba(0,0,0,.7);" required="required" autocomplete="off"/>
						<input class="my-radio" type="radio" name="rate" style="margin-left:6%;" required="required" autocomplete="off"/> <span style="color:black;">Rate per Hours</span>
						<br>
						<input class="my-radio" type="radio" name="rate" style="margin-left:6%;" required="required" autocomplete="off"/> <span style="color:black;">Rate per Days</span>
						<br><br>
						<marquee class="my-text-red">Days or Hour Counting start from when you are pick the car.</marquee>
						<br><br>
						<button class="my-orange my-button my-text-white" type="submit" name="submit" style="width:40%; margin-left:30%; border-radius:8px;">Submit</button>
						<br><br>
						<br>
					</div>
				</form>
			</div>
		</div>
   	</div>
   	<br>
   	<br>
   	<br>
   	
   	
  <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">About Car Rental</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="${pageContext.request.contextPath}/About" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Services</a></li>
                <li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy &amp; Cookies Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="${pageContext.request.contextPath}/Contact" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
      </div>
    </footer>

    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="<c:url value="/assets/js/jquery.min.js" />"></script>
  <script src="<c:url value="/assets/js/jquery-migrate-3.0.1.min.js" />"></script>
  <script src="<c:url value="/assets/js/popper.min.js" />"></script>
  <script src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
  <script src="<c:url value="/assets/js/jquery.easing.1.3.js" />"></script>
  <script src="<c:url value="/assets/js/jquery.waypoints.min.js" />"></script>
  <script src="<c:url value="/assets/js/jquery.stellar.min.js" />"></script>
  <script src="<c:url value="/assets/js/owl.carousel.min.js" />"></script>
  <script src="<c:url value="/assets/js/jquery.magnific-popup.min.js" />"></script>
  <script src="<c:url value="/assets/js/aos.js" />"></script>
  <script src="<c:url value="/assets/js/jquery.animateNumber.min.js" />"></script>
  <script src="<c:url value="/assets/js/bootstrap-datepicker.js" />"></script>
  <script src="<c:url value="/assets/js/jquery.timepicker.min.js" />"></script>
  <script src="<c:url value="/assets/js/scrollax.min.js" />"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="<c:url value="/assets/js/google-map.js" />"></script>
  <script src="<c:url value="/assets/js/main.js" />"></script>
  
  <script type="text/javascript">
		$(document).ready(function() {
			$("#driver").click(function () {	
				if($("#driver").is(':checked')) {
					$("#license").hide();
				} else {
					$("#license").show();
				}
			});
			
		});
  </script>
  
  </body>
</html>