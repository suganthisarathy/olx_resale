
<!DOCTYPE html>
<html lang="en">
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



/* Add styles to the form container */
.form-container {
       max-width: 100%;
       padding: 10px;
       background-color: white;
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



</style>
</head>
<body>
       <nav class="navbar navbar-inverse">
              <div class="container ">
                     <div class="navbar-header">
                           <a class="navbar-brand" href="#" style="color: white">OLX</a>
                     </div>
                     <ul class="navbar-form navbar-left">
                           <div class="form-group">
                                  <div class="inner-addon left-addon">
                                         <i class="glyphicon glyphicon-search"></i> <label
                                                for="focusedInput"></label> <input type="text"
                                                class="form-control" />
                                  </div>
                           </div>
                     </ul>

                     <ul class="navbar-form navbar-right">
                       <form action="/olx_resale/logout" method="POST">
              <button type="submit" class="btn btn-info">
              <span class="glyphicon glyphicon-log-out"></span> Logout</button> </form> </ul>
             <ul class="navbar-form navbar-right">
                <form action="/olx_resale/cartpage"> <button type="submit" class="btn btn-info">
                <span class="glyphicon glyphicon-shopping-cart"></span> Cart</button> </form></ul>
                <ul class="navbar-form navbar-right">
                 <form action="/olx_resale/sell"><button type="submit" class="btn btn-info">
                <span class="glyphicon glyphicon-camera"></span> Sell</button> </form></ul>
				<ul class="navbar-form navbar-right">
                 <form action="/olx_resale/myadspage"><button type="submit" class="btn btn-info">
                <span class="glyphicon glyphicon-camera"></span> My ads</button> </form></ul>
                <ul class="navbar-form navbar-right"> 
                 <form action="/olx_resale/inter"><button type="submit" class="btn btn-info">
                <span class="glyphicon glyphicon-camera"></span> Homepage</button> </form></ul>    
              </div>
       </nav>
       </body>
</html>
