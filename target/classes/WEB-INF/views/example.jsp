<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>
		WELCOME
		<%=session.getAttribute("email")%></h2>
		<c:url var="action2" value="/insertimage"></c:url>
		<c:url var="action3" value="/user/view.html"></c:url>
		<c:url var="action4" value="/fetch"></c:url>
	<form action="${action2}" method="POST" enctype="multipart/form-data">
		<table>
			<tr>
				<td>ITEM NAME:<input type="text" name="itemname"></td>
			</tr>
			<tr>
				<td>ITEM CATEGORY:<select name="categoryname">
						<option value="car">Car</option>
						<option value="furniture">Furniture</option>
						<option value="bike">bike</option>
						<option value="laptop">Car</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>YEARS OF USAGE:<input type="text" name="yearsofusage"></td>
			</tr>
			<tr>
				<td>ITEM IMAGE:<input type="file" name="image" accept="image/*"></td>
			</tr>
			<tr>
				<td><input type="submit" value="SELL PRODUCT"/></td>
			</tr>
		</table>
	</form>
	<form action="${action3}" method="POST">
		<table>
			<tr>
				<td><input type="submit" value="VIEW PRODUCT"/></td>
			</tr>
		</table>
	</form>
	<form action="${action4}" method="POST">
		<table>
			<tr>
				<td><input type="submit" value="VIEW EXAMPLE"/></td>
			</tr>
		</table>
	</form>
	<h2>${msg}</h2>
</body>
</html>