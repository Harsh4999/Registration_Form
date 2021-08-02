import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
public class validation extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7134510658236318692L;

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		try {
			String filepath = getServletContext().getInitParameter("file-upload");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","toor");
			//Connection conn=DriverManager.getConnection(url, user, password);
			 String u = req.getParameter("username");
			String p = req.getParameter("password"); 
			PreparedStatement pstmt = conn.prepareStatement("SELECT USERNAME,PASSWORD,ROLL,IMG,NAME FROM STUD");
			ResultSet rs = pstmt.executeQuery();
			int q=0;

			while(rs.next()){
				
				if(u.equals(rs.getString(1))&&p.equals(rs.getString(2))){
					q++;
					System.out.println(rs.getString(1)+" "+rs.getString(2));
					Integer g = rs.getInt(3);
					String f = filepath+g.toString()+".png";
					Cookie cookie = new Cookie("filePath",f);
					Blob b = rs.getBlob(4);
					byte barr[] = b.getBytes(1,(int)b.length());
					FileOutputStream fout = new FileOutputStream("/home/harsh/eclipse-workspace/RegistrationForm/src/main/webapp/a.png");
					fout.write(barr);
					fout.close();
					res.addCookie(cookie);
					Cookie c  = new Cookie("Name",rs.getString(5));	
					res.addCookie(c);
					Cookie c2  = new Cookie("roll",g.toString());
					res.addCookie(c2);
					res.sendRedirect("http://localhost:8080/RegistrationForm/Account.jsp");
				}
			}
			if(q==0){
				/*
				 * String x="wrongusernameorpassword"; Cookie er = new Cookie("error",x);
				 * res.addCookie(er);
				 * res.sendRedirect("http://localhost:8080/RegistrationForm/Error.jsp");
				 */
				throw new Exception();
			}
		}catch(Exception e) {
			Cookie er = new Cookie("error",e.toString());
			res.addCookie(er);
			res.sendRedirect("http://localhost:8080/RegistrationForm/Error.jsp");
		}
		
		
	}
}
