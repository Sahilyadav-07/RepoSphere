package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/reposphere",
					"root",
					"your-password"
					);
					
		}catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
}
