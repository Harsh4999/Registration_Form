<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>
<%
Cookie cs[] = request.getCookies();
for(int i=1;i<cs.length;i++){
	String x=cs[i].getName();
	if(x.equals("error")){
	%>
		<B><%=cs[i].getValue()%></B>
	
	<% 
	}
}

%>
<a href="index.jsp"><input type="button" value="back"></a>

</body>
</html>