<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display product</title>
</head>
<body>
<h3>List of Customer</h3>
<c:if test="${!empty itemlist}">
	<table class="customerTable">
		<c:forEach items="${itemlist}" var="item">
			<tr>
				<td>${item.itemname}</td>
				<td>${item.yearsofusage}</td>
				<td>${item.itemid}</td>
				<td><img src="${item.itemimage}" width="20" height="20"/>
				</td>
			</tr> 
		</c:forEach>
	</table>
</c:if>
</body>
</html>