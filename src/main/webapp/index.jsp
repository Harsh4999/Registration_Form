<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
      #b {
        background-image: url("https://media.giphy.com/media/l2Sqf1fbj1qrmaJ6E/giphy.gif");
        height: 100vh;
      }
 </style>
  <link rel="stylesheet" href="index.css">
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
</head>
<body id="b">

<!-- <form method="post" action="validation">
<label>UserName</label>
<input type="text" name="username">
<label>Password</label>
<input type="password" name="password">
<input type="submit">
</form>
<label>New User?</label>
<a href="Register.jsp"><input type="submit" value="Register"></a> 
 -->


<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="https://icons.getbootstrap.com/assets/img/icons-hero.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form method="post" action="validation">
      <input type="text" id="login" class="fadeIn second" name="username" placeholder="login">
      <input type="text" id="password" class="fadeIn third" name="password" placeholder="password">
      <input type="submit" class="fadeIn fourth" value="Log In">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="Register.jsp">New-User?</a>
    </div>

  </div>
</div>



</body>
</html>