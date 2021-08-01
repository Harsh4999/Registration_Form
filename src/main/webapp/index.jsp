<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="validation">
<label>UserName</label>
<input type="text" name="username">
<label>Password</label>
<input type="password" name="password">
<input type="submit">
</form>
<label>New User?</label>
<a href="Register.html"><input type="submit" value="Register"></a>

</body>
</html>