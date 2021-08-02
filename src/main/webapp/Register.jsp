<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 <style>
      #b {
        background-image: url("https://media.giphy.com/media/l2Sqf1fbj1qrmaJ6E/giphy.gif");
        height: 100vh;
      }
   </style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body id="b">
<!-- <form method="post" action="http://localhost:8080/RegistrationForm/Form" enctype = "multipart/form-data" >
	<label>Name</label>
	<input type="text" name="name" required>
	<label>Std</label>
	<select name="std">
		<option>10th</option>
		<option>11th</option>
		<option>12th</option>
	</select>
	<label>RollNo</label>
	<input type="text" name='roll' required>
	<label>Username</label>
	<input type="text" name="username" required>
	<label>Password</label>
	<input type="password" name="password" required>
	<label>ProfilePic</label>
	<input type = "file" name = "file" size = "50" required/> 
	<input type="submit" value="submit">
	 
</form> -->

<div class="container-fluid  "  >
<div class="row ">
<div class="col ">

 <form class="form-inline" method="post" action="http://localhost:8080/RegistrationForm/Form" enctype = "multipart/form-data">
  <div class="form-group mt-5">
    <label for="email">Full-Name:</label>
    <input type="text" class="form-control"  name="name" required>
  </div>
   <div class="form-group">
    <label for="email">Roll-Number:</label>
    <input type="text" class="form-control" name="roll" required>
  </div>
  
   <div class="form-group">
    <label for="exampleFormControlSelect1">STD</label>
    <select class="form-control"  name="std">
      <option>10th</option>
      <option>11th</option>
      <option>12th</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="email">Username:</label>
    <input type="text" class="form-control" name="username"  required>
  </div>
  
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" name="password" required>
  </div>
  
  <div class="form-group mt-5">
    <label for="exampleFormControlFile1">ProfilePic:  </label>
    <input type="file" class="form-control-file"  name = "file">
  </div>
 
    <div class="text-center">
      <button type="submit" class="btn btn-primary">Register</button>
    </div>
 
	 
</form>
</div> 
</div>
</div>

<div class="text-center mt-5">
  		<form action="index.jsp">
  			<button type="submit" class="btn btn-primary">Back</button>
  		</form>
 </div>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>