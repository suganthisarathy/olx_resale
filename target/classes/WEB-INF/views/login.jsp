<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
</head>
<body>
	<h2>Login page</h2>
	<c:url var="action" value="/user/verify.html"></c:url>
	<form action="${action}" method="POST">
		<table>
			<tr>
				<td>EMAIL:<input type="text" name="email"></td>
			</tr>
			<tr>
				<td>PASSWORD:<input type="password" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="LOGIN"/></td>
			</tr>
		</table>
	</form>
</body>
</html>