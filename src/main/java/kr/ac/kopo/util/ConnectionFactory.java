package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.DriverManager;

// DB접속한 다음 접속 객제 넘겨주는게 목적
public class ConnectionFactory {

	public Connection getConnection() { //throws Exception
		
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@192.168.119.119:1521:dink";
			String user = "scott";
			String password = "tiger";
			
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
