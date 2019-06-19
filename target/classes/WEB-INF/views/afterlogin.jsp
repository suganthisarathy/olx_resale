<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HomePage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

.inner-addon {
	position: relative;
}

/* style icon */
.inner-addon .glyphicon {
	position: absolute;
	padding: 10px;
	pointer-events: none;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
	background-color: #555;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	opacity: 0.8;
	position: fixed;
	top: 23px;
	center: 28px;
	width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
	display: none;
	position: fixed;
	center: 15px;
	border: 3px solid #f1f1f1;
	z-index: 9;
}

/* Add styles to the form container */
.form-container {
	max-width: 100%;
	padding: 10px;
	background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	border: none;
	background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus
	{
	background-color: #ddd;
	outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
	background-color: #2980B9;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
	opacity: 1;
}
/* align icon */
.left-addon .glyphicon {
	left: 0px;
}

.right-addon .glyphicon {
	right: 0px;
}

/* add padding  */
.left-addon input {
	padding-left: 30px;
}

.right-addon input {
	padding-right: 30px;
}
/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

.log {
	float: right;
}

.modal-dialog {
	width: 20%;
}

.md1 {
	width: 50%;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container"></div>
	<br />
	<div id="myCarousel" style="width: 1900px; min-height: 200px"
		class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>


		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="images/car1.jpg" alt="Image"
					style="width: 60%; height: 400px">
				<div class="carousel-caption">
					<h3>Sell $</h3>
					<p>old mercedes ben</p>
				</div>
			</div>

			<div class="item">
				<img src="images/bike1.jpg" alt="Image"
					style="width: 60%; height: 400px">
				<div class="carousel-caption">
					<h3>More Sell $</h3>
					<p>yamaha RX100</p>
				</div>
			</div>
			<div class="item">
				<img src="images/swing.jpg" alt="Image"
					style="width: 60%; height: 400px">
				<div class="carousel-caption">
					<h3>More Sell $</h3>
					<p>wooden swing</p>
				</div>
			</div>
			<div class="item">
				<img src="images/laptops.jpg" alt="Image"
					style="width: 60%; height: 400px">
				<div class="carousel-caption">
					<h3>More Sell $</h3>
					<p>laptop</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<br />
	<div class="container text-center">
		<div class="row">
			<c:forEach var="item" items="${itemslist}">
				<div class="col-sm-4">
					<div class="thumbnail"
						style="width: 75%; height: 250px;">
						<a href="/olx_resale/itempage/<c:out value='${item.itemid}'/>">
							<img width="200" height="200"
							src="getItemImage/<c:out value='${item.itemid}'/>" />
						</a>
						<h4>${item.itemname}</h4>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- <div class="col-sm-4">
                           <div class="thumbnail" style="width: 75%; height: 250px">
                                  <img src="images/bike1.jpg" style="width: 70%" alt="Image">
                                  <p>Current Project</p>
                           </div>
                     </div>
                     <div class="col-sm-4">
                           <div class="thumbnail" style="width: 75%; height: 250px">
                                  <img src="images/swing.jpg" style="width: 70%" alt="Image">
                                  <p>Current Project</p>
                           </div>
                     </div>
                     <div class="col-sm-4">
                           <div class="thumbnail" style="width: 75%; height: 250px">
                                  <img src="images/laptops.jpg" style="width: 70%" alt="Image">
                                  <p>Current Project</p>
                           </div>
                     </div> -->

	</div>
	<br>

	<div class="jumbotron" style="background-color: #D7DBDD; color: black">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 VL">
					<p>
						POPULAR SEARCHES<small><br> Mobile<br> Cars<br>
							Bikes</small>
					</p>

				</div>
				<div class="col-lg-3 VL">
					<p>
						TRENDING<small><br> Mobile<br> Cars<br>
							Bikes</small>
					</p>
				</div>
				<div class="col-lg-3 VL">
					<p>
						ABOUT US<small><br> About OLX Group<br> Careers<br>Contact
							Us</small>
					</p>
				</div>
				<div class="col-lg-3 VL">
					<p>
						OLX<small><br> Legal and Privacy information<br>Site
							Map<br>Help</small>
					</p>
				</div>

			</div>
		</div>

	</div>
</body>
</html>
