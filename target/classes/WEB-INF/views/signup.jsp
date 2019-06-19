<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>signup</title>
<style type="text/css">
              body {
                     font-family: verdana;
                     font-size: 12px;
                     margin: 40px;
              }
              .userLabel {
                     font-family: verdana;
                     font-size: 12px;
                     font-weight: bold;
              }
              .error {
      			color: red;
      			font-style: italic;
  			}
</style>
</head>
<body>
<h2>Sign Up Page</h2>
<c:url var="action" value="/user/add.html"></c:url>
<c:url var="action1" value="/user/login.html"></c:url>
<c:url var="action2" value="/user/post.html"></c:url>
<form action="${action}" method="POST">
	<table>
		<tr>
			<td>FIRST NAME:<input type="text" name="firstname"></td>
		</tr>
		<tr>
			<td>LAST NAME:<input type="text" name="lastname"></td>
		</tr>
		<tr>
			<td>AGE:<input type="text" name="age"></td>
		</tr>
		<tr>
			<td>GENDER:<select name="gender">
			<option value="male">MALE</option>
			<option value="female">FEMALE</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>CONTACT NUMBER:<input type="text" name="contactnumber"></td>
		</tr>
		<tr>
			<td>PASSWORD:<input type="password" name="password"></td>
		</tr>
		<tr>
			<td>EMAIL:<input type="text" name="email"></td>
		</tr>
		<tr>
			<td>CITY:<input type="text" name="city"></td>
		</tr>
		<tr>
			<td>SUBLOCATION:<input type="text" name="sublocation"></td>
		</tr>
		<tr>
			<td>STATE:<input type="text" name="state"></td>
		</tr>
		<tr>
			<td>PINCODE:<input type="text" name="pincode"></td>
		</tr>
		<tr>
			<td>COUNTRY:<input type="text" name="country"></td>
		</tr>
		<tr>
			<td>STREET:<input type="text" name="street"></td>
		</tr>
		<tr>
			<td><input type="submit" value="SUBMIT"/></td>
		</tr>
	</table>
</form>
<form action="${action1}">
	<table>
		<tr>
			<td>
				<input type="submit" value="LOGIN"/>
			</td>
		</tr>
	</table>
</form>

<form action="${action2}">
	<table>
		<tr>
			<td>
				<input type="submit" value="POST AD"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>