import java.sql.*;
import java.util.*;
public class Mdb {
	public static int insert(int r){
		try {
			Random rm = new Random();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","toor");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM user_tables WHERE TABLE_NAME = 'SMARK'");
			int c;
			String count=null;
			while(rs.next()){
				count = rs.getString(1);
			}
			c = Integer.parseInt(count);
			if(c==0) {
				stmt.execute("call sss(1)");
			}
			String query = "insert into SMARK values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, r);
			System.out.println("hey");
			int sum=0;
			
			
				int low = 10;
				int high = 100;
				int result = rm.nextInt(high-low) + low;
				ps.setInt(2,result);
				result = rm.nextInt(high-low) + low;
				sum+=result;
				ps.setInt(3,result);
				result = rm.nextInt(high-low) + low;
				sum+=result;
				ps.setInt(4,result);
				sum+=result;
			
			ps.setInt(5,sum);
			ps.execute();
			ps.close();
			return 1;
		}catch(Exception t){
			System.out.println(t);
			return 0;
		}
	}
}
