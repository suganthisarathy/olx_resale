<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cart</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:include page="header.jsp" />
	<br>


	<br>

	<div class="container-fluid">
		<c:if test="${empty cartitemlist}">
			<h2 style="text-align: center">Your cart is empty</h2>
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-9">
					<img src="images/empty-cart.png">
				</div>
				<div class="col-sm-2"></div>
			</div>
		</c:if>
	</div>

	<c:if test="${!empty cartitemlist}">
		<div class="container text-center">

			<c:forEach items="${cartitemlist}" var="cartitem">

				<div class="row">
					<div class="col-sm-4">
						<div class="thumbnail" style="width: 375%; height: 250px">
							<form
								action="/olx_resale/removefromcart/<c:out value='${cartitem.itemid}'/>">
								<table cellpadding="10">
									<tr>
										<td><img
											src="getItemImage/<c:out value='${cartitem.itemid}'/>"
											alt="Image" style="float: left" height="200" width="350"></td>

										<td><h2>${cartitem.itemname}</h2></td>
										<td><form
												action="/olx_resale/removefromcart/<c:out value='${cartitem.itemid}'/>">
												<button type="submit" class="btn btn-primary">Remove</button>
											</form>
											<form action="/olx_resale/buy">
												<button type="submit" class="btn btn-primary">BuyNow</button>
											</form></td>
									</tr>
								</table>
							</form>
						</div>
					</div>

				</div>

			</c:forEach>

		</div>
	</c:if>
	<div class="footer">

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
	</div>

</body>
</html>
