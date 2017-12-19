package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.AdminDto;

public class AdminDao {
	
	private Connection conn;
	private PreparedStatement statement;
	
	public AdminDto selectByUsername(String username) throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBConfig.getDBAddress(), DBConfig.getDBUser(), DBConfig.getDBPassword());
		
		String query = "select * from administrator where username = ?";
		statement = conn.prepareStatement(query);
		statement.setString(1, username);
		ResultSet result = statement.executeQuery();
		
		AdminDto admin = new AdminDto();
		while(result.next()){
			admin.setUsername(result.getString("username"));
			admin.setPassword(result.getString("password"));
			admin.setId(result.getInt("id"));
		}
		
		result.close();
		statement.close();
		
		return admin;
	}
}
