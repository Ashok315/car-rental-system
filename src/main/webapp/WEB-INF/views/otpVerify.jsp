<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
	<head>
    <title>OTP Verification | Car Rental</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/assets/css/open-iconic-bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/animate.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/owl.carousel.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/owl.theme.default.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/magnific-popup.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/aos.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/ionicons.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap-datepicker.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/jquery.timepicker.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/flaticon.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/icomoon.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/my_1.css' />">
 
</head>
<body style="background: url('<c:url value="/assets/images/bg_2.jpg"/>') no-repeat center center fixed;-webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">
	
	<div style="position:fixed; top:0; left:0; bottom:0; width:100%; heigth:100%; background-color:rgba(255,255,255,.5)">
		<div class="my-container row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="my-container" style="margin-top:25%; background-color:rgba(0,0,0,.8); border-radius:25px; box-shadow:5px 5px 20px #000" >
					<form action="${pageContext.request.contextPath}/SignUp/OtpVerifing" method="POST">
						<div  style="width:90%; margin-left:5%;">
							<br>
							<h1 class="my-text-orange" style="margin:5%;">OTP Verification</h1>
							<hr style="width:90%; margin-left:5%;">
							<input class="my-input my-text-white" type="number" name="otp" placeholder="Enter Otp " style="width:90%; margin:6% 5%; border-radius:8px; background-color:rgba(0,0,0,.3);" required="required" autocomplete="off"/>
							
							<button class="my-orange my-button my-text-white" type="submit" name="submit" style="width:50%; margin-left:30%; border-radius:8px;">OTP Verification</button>
							<br><br>
							<br>
						</div>
					</form>
				</div>
			</div>
	   	</div>
   	</div>
   	
</body>
</html>