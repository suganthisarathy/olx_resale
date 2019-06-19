<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style>
.chip {
	display: inline-block;
	padding: 0 25px;
	height: 50px;
	font-size: 16px;
	line-height: 50px;
	border-radius: 25px;
	background-color: #f1f1f1;
}

.chip img {
	float: left;
	margin: 0 10px 0 -25px;
	height: 50px;
	width: 50px;
	border-radius: 50%;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

#myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

#myImg:hover {
	opacity: 0.7;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
}

/* Caption of Modal Image */
#caption {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

/* Add Animation */
.modal-content, #caption {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* The Close Button */
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: white;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: white;
	text-decoration: none;
	cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
}
</style>
<%-- getItemImage/<c:out value='${singleitem.itemid}'/> --%>
<body>

	<jsp:include page="header.jsp" />
	<br>
	<div class="container text-center">

		<div class="row">

			<div class="col-sm-6">

				<div class="thumbnail" style="width: 150%; height: 450px">
					<br /> <img width="610" height="600" id="myImg"
						src="getItemImage/<c:out value='${singleitem.itemid}'/>"
						alt="itemimage" />

					<!-- The Modal -->
					<div id="myModal" class="modal">
						<span class="close">&times;</span> <img class="modal-content"
							id="img01">
						<div id="caption"></div>
					</div>

					<script>
						// Get the modal
						var modal = document.getElementById("myModal");

						// Get the image and insert it inside the modal - use its "alt" text as a caption
						var img = document.getElementById("myImg");
						var modalImg = document.getElementById("img01");
						var captionText = document.getElementById("caption");
						img.onclick = function() {
							modal.style.display = "block";
							modalImg.src = this.src;
							captionText.innerHTML = this.alt;
						}

						// Get the <span> element that closes the modal
						var span = document.getElementsByClassName("close")[0];

						// When the user clicks on <span> (x), close the modal
						span.onclick = function() {
							modal.style.display = "none";
						}
					</script>


				</div>
				<div class="thumbnail" style="width: 150%; height: 200px">
					<h4>${singleitem.description}</h4>


				</div>
			</div>
			<div class="col-sm-3"></div>
			<div class="col-sm-3">
				<div class="thumbnail" style="width: 150%; height: 200px">
					<h2>
						Rs.<span>${singleitem.price}</span>
					</h2>
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-2">
							<form
								action="/olx_resale/cart/<c:out value='${singleitem.itemid}'/>">
								<button type="submit" class="btn btn-primary">Add to
									cart</button>
							</form>
						</div>
						<div class="col-sm-2"></div>
						<div class="col-sm-1">

							<form action="/olx_resale/buy">
								<button type="submit" class="btn btn-primary">Buy Now</button>
							</form>

						</div>
					</div>

				</div>

				<div class="thumbnail" style="width: 150%; height: 200px">
					<!-- for displaying seller name -->
					<div class="chip">
						<img src="images/contactimage.png"
							alt="Person" width="96" height="96" style="float: left">
						<h2>${singleuser.firstname}</h2>
						<h3>${singleuser.contactnumber}</h3>
						<h3>${singleuser.email}</h3>
					</div>


				</div>
			</div>
		</div>
	</div>
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
