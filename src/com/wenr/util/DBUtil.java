package com.wenr.util;
		import java.sql.Connection;
		import java.sql.DriverManager;
		import java.sql.SQLException;
public class DBUtil {
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url =  "jdbc:mysql://localhost:3306/bye?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false&allowPublicKeyRetrieval=true";
	private static final String username = "root";
	private static final String password = "705010610";
	private static Connection conn;
	static {
		try {
			Class.forName(driver);
			System.out.println("数据库连接成功");
		} catch (Exception ex) {
			System.out.println("连接失败");
			ex.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException {
		if (conn == null) {
			System.out.println(url);
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		}
		return conn;
	}
}
