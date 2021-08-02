<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<!-- navbar -->
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","toor");
Statement stmt = conn.createStatement();
Cookie cks[] = request.getCookies();
for(int i=0;i<cks.length;i++){
	String x1=cks[i].getName();
	if(x1.equals("roll")){
	%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="#"> <img src="http://localhost:8080/RegistrationForm/get_img?id=<%=cks[i].getValue()%>" alt="dd" class="rounded-circle" hieght="24" width="30"></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		       <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		        	<%
		        		Cookie cookies[] = request.getCookies();
		        		for(int j=0;j<cookies.length;j++){
		        			System.out.println(cookies[j].getName());
		        			System.out.println(cookies[j].getValue());
		        			String x=cookies[j].getName();
		        			if(x.equals("Name")){
		        				%>
		        					<B><%=cookies[j].getValue()%></B>
		        				<% 
		        			}
		        		}
		       		 %>
		        
		        </li>
		      </ul> 
		      
		      
		      <form class="d-flex" action="/RegistrationForm/index.jsp" method="post">
		        
		        <button class="btn btn-outline-success" type="submit">Logout</button>
		      </form>
		    </div>
		  </div>
		</nav>
		<%
		
	}
}
%>


 




<!-- Marks table -->
<div class="container-fluid  "  >
<div class="row text-center ">
<div class="col ">



<%


ResultSet rs = stmt.executeQuery("SELECT * FROM SMARK");
Cookie cookies[] = request.getCookies();
String l;
int roll;
for(int i=0;i<cookies.length;i++){
	String x=cookies[i].getName();
	if(x.equals("roll")){
		l=cookies[i].getValue();
		roll = Integer.parseInt(l);
	
		while(rs.next()){
			
			if(rs.getInt(1)==roll){
				if(rs.getInt(5)>120){
				%>	
					<div class="container-fluid bg-success">
					<div class="row text-center ">
					<div class="col ">
						<label >Marks</label>
					</div>
					</div>
					</div>
					
					<table class="table table-success" border="1">
							<tr >
								<td>RollNo</td>
								<td>Maths</td>
								<td>English</td>
								<td>Science</td>
								<td>Total</td>					
							</tr>
							<tr >
								<td><%=rs.getInt(1)%></td>
								<td><%=rs.getInt(2)%></td>
								<td><%=rs.getInt(3)%></td>
								<td><%=rs.getInt(4)%></td>
								<td><%=rs.getInt(5)%></td>
							</tr>
					</table>	
					<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  					<symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
  					  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
 					 </symbol>
 					 <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
  						  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
  						</symbol>
 					 <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
 					   <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
					  </symbol>
						</svg>
					<div class="alert alert-success d-flex align-items-center" role="alert">
  						<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
 						 <div>
   							 Congrats you have Passed!!
  							</div>
						</div>
					
					
					
					
					
				<% 			
					
				}else{
					System.out.println("else");
				%>	
					<div class="container-fluid bg-danger">
					<div class="row text-center ">
					<div class="col ">
						<label >Marks</label>
					</div>
					</div>
					</div>
					
					
					<table class="table table-danger">
							<tr >
								<td>RollNo</td>
								<td>Maths</td>
								<td>English</td>
								<td>Science</td>
								<td>Total</td>					
							</tr>
							<tr >
								<td><%=rs.getInt(1)%></td>
								<td><%=rs.getInt(2)%></td>
								<td><%=rs.getInt(3)%></td>
								<td><%=rs.getInt(4)%></td>
								<td><%=rs.getInt(5)%></td>
							</tr>
					</table>	
					<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  					<symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    				<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  					</symbol>
					 <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    					<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
 					 </symbol>
  					<symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    					<path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  					</symbol>
					</svg>
					
					
					<div class="alert alert-danger d-flex align-items-center" role="alert">
 						 <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
						  <div>
    							Failed for this year!
  						</div>
					</div>
					
				<% 
				}
			}
		}
	}
}



%>
</div>
</div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 
</body>
</html>