import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
@WebServlet(name = "img", urlPatterns = {"/get_img"})
//see stackoverflow links
public class get_img extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8381309985367821684L;

	public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","toor");
			String i= req.getParameter("id");
			int id = Integer.parseInt(i);
			System.out.println("in img");
			String query = "Select IMG from STUD where ROLL='"+id+"'";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			res.setContentType("image/jpg");
			while(rs.next()) {
				Blob b = rs.getBlob(1);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				byte[] buf = new byte[1024];
				InputStream in = b.getBinaryStream();
				int n = 0;
				while ((n=in.read(buf))>=0)
				{
				   baos.write(buf, 0, n);
				}
				in.close();
				byte[] bytes = baos.toByteArray();
				if (bytes != null && bytes.length > 0) {
					 res.setContentType("image/jpg");
					 res.getOutputStream().write(bytes);
					 res.getOutputStream().flush();
					 res.getOutputStream().close();
				}
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
