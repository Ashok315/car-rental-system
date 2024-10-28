<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Car | Car Rental</title>
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
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="${pageContext.request.contextPath}">Car<span>Rental</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="${pageContext.request.contextPath}" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="About" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="Pricing" class="nav-link">Pricing</a></li>
	          <li class="nav-item active"><a href="Car" class="nav-link">Our Car</a></li>
	          <li class="nav-item"><a href="Contact" class="nav-link">Contact</a></li>
	          <li class="nav-item"><a href="Profile" class="nav-link">Profile</a></li>
	          <li class="nav-item"><a href="SignOut" class="nav-link">Sign Out</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('<c:url value="resources/images/bg_2.jpg"/>');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Cars <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">Choose Your Car</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<c:forEach var="car" items="${cars }">
	    			<div class="col-md-3">
	    				<div class="car-wrap ftco-animate">
	    					<div class="img d-flex align-items-end" style="background-image: url('<c:url value="/assets/images/car/${car.getId() }.jpg"/>');">
	    						<div class="price-wrap d-flex">
	    							<span class="rate">${car.getRate_per_day() }</span>
	    							<p class="from-day">
	    								<span>From</span>
	    								<span>/Day</span>
	    							</p>
	    						</div>
	    					</div>
	    					<div class="text p-4 text-center">
	    						<h2 class="mb-0"><a href="Car/${car.getCompany() }-${car.getName()}-${car.getId()}">${car.getName() }</a></h2>
	    						<span>${car.getCompany() }</span>
	    						<p class="d-flex mb-0 d-block"><a href="#" class="btn btn-black btn-outline-black mr-1">Book now</a> <a href="Car/${car.getCompany() }-${car.getName()}-${car.getId()}" class="btn btn-black btn-outline-black ml-1">Details</a></p>
	    					</div>
	    				</div>
	    			</div>
    			</c:forEach>
    		</div>
        </div>
    </section>


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
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="#" target="_blank">_BoBy_</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
  
  </body>
</html>