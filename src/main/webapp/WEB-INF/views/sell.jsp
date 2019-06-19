<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
       href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
       src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
       src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
       <style>
       p.normal{
       border:2px solid lightgrey;
       
       }
       
       </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<body> 
 <br/>
<div class="container">
   <h2>POST UR AD</h2>
   <p class="normal">

 <div class="card">
    <div class="card-body">

       <form action="/olx_resale/additem" method="POST" enctype="multipart/form-data" class="form-horizontal" > 
    <div class="form-group">
      <label class="control-label col-sm-2" for="txt">Item Name:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="txt" placeholder="Enter item name" name="itemname">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Category Name:</label>
      <div class="col-sm-8">
        
      <select class="form-control" id="sel1" name="categoryname">
        			<c:forEach items="${categoryname}" var="category">
						<option value="${category}">${category}</option>
					</c:forEach>
					
					
      </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="txt">Price:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="txt" placeholder="Enter price" name="price">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="txt">Years of usage:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="txt" placeholder="Enter no of years" name="yearsofusage">
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="txt">Upload Image:</label>
      <div class="col-sm-8">          
        <input type="file"   name="image" accept="image/*"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="txt">Description:</label>
      <div class="col-sm-8">          
       <textarea rows = "5" cols = "50" name = "description">
            Describe your product
         </textarea>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-info">Submit</button>
      </div>
    </div>
  
  </form></div>
  </div>

  <h2>${msg}</h2>
</div>

<jsp:include page="Footer.jsp"/>
</body>
</html>
