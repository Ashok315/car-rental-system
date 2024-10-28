<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Profile | Car Rental</title>
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
	 <style>
	 	#file-form, #password-form{display: none;}
	 </style>
  </head>
  <body>
    
    <c:choose>
		<c:when test="${err == 'success' }">
			<script>
				alert('Profile Photo is Changed.');
			</script>
		</c:when>
		<c:when test="${err == 'extension' }">
			<script>
				alert('Image Is not Valid.');
			</script>
		</c:when>
		<c:when test="${msg == 'success' }">
			<script>
				alert('Password is Changed.');
			</script>
		</c:when>
		<c:when test="${msg == 'error' }">
			<script>
				alert('Old Password is not Valid.');
			</script>
		</c:when>
		<c:when test="${reservation == 'YES' }">
			<script>
				alert('Car Booking Successfully');
			</script>
		</c:when>
	</c:choose>
    
    
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
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/Pricing" class="nav-link">Pricing</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/Car" class="nav-link">Our Car</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/Contact" class="nav-link">Contact</a></li>
	          <li class="nav-item active"><a href="${pageContext.request.contextPath}/Profile" class="nav-link">Profile</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/SignOut" class="nav-link">Sign Out</a></li>
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
          	<p class="breadcrumbs mb-1"><span class="mr-2"><a href="${pageContext.request.contextPath}">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Profile <i class="ion-ios-arrow-forward"></i></span></p>
            <h2 class="mb-5 text-white">Profile</h2>
          </div>
        </div>
      </div>
    </section>
  
  
  	<section class="my-container">
  		<br><br>
      	<div class="row">
      		<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="item" style="box-shadow:2px 2px 10px gray; border-radius:30px;">
					<div class="testimony-wrap text-center py-4 pb-5">
						<br>
						<img src="<c:url value="/assets/images/Profile/${userData.getProfile() }"/>" class="my-card my-shadow my-circle" style="width:250px; height:250px;"/>
						<div class="text pt-4">
							<p class="name">${userData.getFirstName() } ${userData.getLastName() }</p>
							<hr>
							<p class="mb-4">
								<i class="icon-envelope-o"></i>
								${userData.getEmail() }
								<br><br>
								<i class="icon-phone"></i>
								${userData.getContact() }
								<br><br>
								<i class="icon-birthday-cake"></i>
								<fmt:parseDate pattern="yyyy-MM-dd" value="${userData.getDob() }" var="dob" />
								<fmt:formatDate pattern="dd / MM / yyyy" value = "${dob }" />
								<br><br>
								<span class="my-text-red" id="changeFile" style="cursor:pointer;">Change Profile ?</span>
								<br>
								<span class="my-text-red" id="changePassword" style="cursor:pointer;">Change Password ?</span>
							</p>
						</div>
					</div>
				</div>
      		</div>
      	</div>
      	<br><br>
	</section>
  	
  	<div class="my-container" id="file-form" style="background-color:rgba(0,0,0,.8); z-index:100; position:fixed; top:0; left:0; width:100%; height:100%;">
		<div class="my-right">
			<i class="icon icon-close my-xxxlarge my-text-red" id="changeFileClose"></i>
		</div>
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="my-container" style="background-color:rgba(255,255,255,.7); margin-top:25%;">
					<br>
					<h3 class="my-center agileinfo-top-heading my-text-black">Change Profile</h3>
					<hr style="background-color:black;">
					<form action="${pageContext.request.contextPath}/Profile/ChangeProfile/" method="POST" enctype="multipart/form-data">
						<input type="file" name="profile" class="my-input my-text-white" style="width:70%; margin-left:15%;" required/>
						<br>
						<input type="submit" name="submit" class="my-btn my-red my-text-white" style="width:50%; margin-left:25%;"/>
					</form>
					<br><br>
				</div>
			</div>
		</div>
	</div>
	<div class="my-container" id="password-form" style="background-color:rgba(0,0,0,.8); z-index:100; position:fixed; top:0; left:0; width:100%; height:100%;">
		<div class="my-right">
			<i class="icon icon-close my-xxxlarge my-text-red" id="changePasswordClose"></i>
		</div>
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<div class="my-container" style="background-color:rgba(255,255,255,.7); margin-top:25%;">
					<br>
					<h3 class="my-center agileinfo-top-heading my-text-black">Change Password</h3>
					<hr style="background-color:black;">
					<form action="${pageContext.request.contextPath}/Profile/ChangePassword/" method="POST">
						<input type="password" name="oldPassword" class="my-input my-text-black" placeholder="Old Password" style="width:70%; margin-left:15%;" required/>
						<br>
						<input type="password" name="newPassword" class="my-input my-text-black" placeholder="New Password" style="width:70%; margin-left:15%;" required/>
						<br>
						<input type="submit" name="submit" class="my-btn my-red my-text-black" style="width:50%; margin-left:25%;"/>
					</form>
					<br><br>
				</div>
			</div>
		</div>
	</div>
  	
  	<c:if test="${not empty reservations }">
		<div class="my-container row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<center><h3>Your Reservation</h3></center>
				<div class="my-card my-medium" style="overflow: auto; white-space: nowrap; width:100%;">
					<table class="my-table my-striped my-overable my-medium">
						<tr class="my-center my-bold my-red">
							<th>Car Name</th>
							<th>Driver</th>
							<th>PickUp Location</th>
							<th>return Location</th>
							<th>Approved</th>
						</tr>
						<c:set var="i" value="0"></c:set>
						<c:forEach var="booking" items="${reservations }">
							<tr>
								<td>${process.getCarDetails(booking.getCar_id()).getName() }</td>
								<td>${booking.getDriver() }</td>
								<td>${city.get(booking.getPick_location() - 1).getCity() }</td>
								<td>${city.get(booking.getReturn_location() - 1).getCity() }</td>
								<td>
									<c:choose>
										<c:when test="${booking.getApproved() == '1' }">
											<i class="icon icon-check my-text-green"></i>
										</c:when>
										<c:otherwise>
											<i class="icon icon-close my-text-red"></i>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					
					</table>
				</div>
			</div>
		</div>
					<br><br>
	</c:if>
  
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
	
			$("#changeFile").on('click', function(event){
				$("#file-form").show();
			});	
			$("#changeFileClose").on('click', function(event){
				$("#file-form").hide();
			});	
			$("#changePassword").on('click', function(event){
				$("#password-form").show();
			});	
			$("#changePasswordClose").on('click', function(event){
				$("#password-form").hide();
			});		
		});
			
	</script>
    
</body>
</html>