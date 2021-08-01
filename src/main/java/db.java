import java.sql.*;
import java.io.*;
public class db {
	public static int insert(String name,String std,int roll,String username,String password,String imgName,String imgPath){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","toor");
		
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM user_tables WHERE TABLE_NAME = 'STUD'");
			int c;
			String count = null;
			while(rs.next()) {
				 count  = rs.getString(1);
			}
			c=Integer.parseInt(count);
			System.out.println(c);
			if(c==0) {
			
				stmt.execute("call ppp(1)");		
			}
			String query = "insert into STUD values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,name);
			ps.setString(2,std);
			ps.setInt(3,roll);
			ps.setString(4,username);
			ps.setString(5, password);
			ps.setString(6,imgName);
			InputStream in = new FileInputStream(imgPath);
			ps.setBlob(7,in);
			ps.execute();
			ps.close();
			return 1;
		}catch(Exception e){
			System.out.println(e);
			return 0;
		}
	}
}
