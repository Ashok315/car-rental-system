<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Pricing | Car Rental</title>
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
  
  
<%
	HttpSession ses = request.getSession();
	if(ses.getAttribute("userId") != null){
		%>
			<c:set var="userId" value="YES" />
		<%
	} else {
		%>
			<c:set var="userId" value="NO" />
		<%
	}
%>
  
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
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/About" class="nav-link">About</a></li>
	          <li class="nav-item active"><a href="${pageContext.request.contextPath}/Pricing" class="nav-link">Pricing</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/Car" class="nav-link">Our Car</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/Contact" class="nav-link">Contact</a></li>
			<c:choose>
				<c:when test="${userId == 'NO' }">
					<li class="nav-item"><a href="${pageContext.request.contextPath}/SignIn" class="nav-link">Sign In</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/Profile" class="nav-link">Profile</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/SignOut" class="nav-link">Sign Out</a></li>
				</c:otherwise>
			</c:choose>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('<c:url value="assets/images/bg_2.jpg"/>');height:108vh!important" data-stellar-background-ratio="0.5">
      <div class="overlay" style="opacity:0.5;height:108vh"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5 mb-5">
          	<p class="breadcrumbs mb-1"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Pricing <i class="ion-ios-arrow-forward"></i></span></p>
            <h2 class="mb-5 text-white">Car Rates Pricing</h2>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="car-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>&nbsp;</th>
						        <th class="bg-primary heading">Per Hour Rate</th>
						        <th class="bg-dark heading">Per Day Rate</th>
						      </tr>
						    </thead>
						    <tbody>
						     
					<c:forEach var="car" items="${cars }">
						     
						      <tr class="">
						      	<td class="car-image"><div class="img" style="background-image:url('<c:url value="resources/images/car/${car.getImage() }"/>');"></div></td>
						        <td class="product-name">
						        	<h3>${car.getCompany() } ${car.getName() }</h3>
						        	<p class="mb-0 rated">
						        		<span>rated:</span>
						        		<span class="ion-ios-star"></span>
						        		<span class="ion-ios-star"></span>
						        		<span class="ion-ios-star"></span>
						        		<span class="ion-ios-star"></span>
						        		<span class="ion-ios-star"></span>
						        	</p>
						        </td>
						        
						        <td class="price">
						        
						        	<c:choose>
						        		<c:when test="${userId == 'NO' }">
						        			<p class="btn-custom"><a style="cursor:pointer;" onclick="alert('Please Login.')">Rent a car</a></p>
						        		</c:when>
						        		<c:otherwise>
				    						<form action="Car/${car.getId() }/Registration" method="post">
					    						<center class="btn-custom"><button class="my-btn my-white" type="submit">Book now</button></center>
					    					</form>
						        		</c:otherwise>
						        	</c:choose>
						        
						        	<div class="price-rate">
							        	<h3>
							        		<span class="num"><small class="currency">&#8377</small> ${car.getRate_per_hour() }</span>
							        		<span class="per">/per hour</span>
							        	</h3>
							        	<span class="subheading">&#8377 3/hour fuel surcharges</span>
						        	</div>
						        </td>
						        
						        <td class="price">
						        
						        	<c:choose>
						        		<c:when test="${userId == 'NO' }">
						        			<p class="btn-custom"><a style="cursor:pointer;" onclick="alert('Please Login.')">Rent a car</a></p>
						        		</c:when>
						        		<c:otherwise>
				    						<form action="Car/${car.getId() }/Registration" method="post">
					    						<center class="btn-custom"><button class="my-btn my-white" type="submit">Book now</button></center>
					    					</form>
						        		</c:otherwise>
						        	</c:choose>
						        
						        	<div class="price-rate">
							        	<h3>
							        		<span class="num"><small class="currency">&#8377</small> ${car.getRate_per_day() }</span>
							        		<span class="per">/per day</span>
							        	</h3>
							        	<span class="subheading">&#8377 3/hour fuel surcharges</span>
						        	</div>
						        </td>

						      </tr><!-- END TR-->
						      
					</c:forEach>
						     
						    </tbody>
						  </table>
					  </div>
    			</div>
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