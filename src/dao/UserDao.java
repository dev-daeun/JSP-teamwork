package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.UserDto;

public class UserDao {

	private Connection conn;
	private PreparedStatement statement;
	
	public void insert(UserDto user) throws ClassNotFoundException, SQLException{
		
			//1.jdbc를 로드한다.
			Class.forName("com.mysql.jdbc.Driver");
			//2. 데이터베이스 접근에 필요한 커낵션 객체를 만든다.
			conn = DriverManager.getConnection(DBConfig.getDBAddress(), DBConfig.getDBUser(), DBConfig.getDBPassword());

			//3. sql 쿼리문을 만든다.
			String query = "insert into user(email, phone, password, nickname, address, mileage) values (?,?,?,?,?,?)";
			//4. 2.에서 만든 커낵션 객체와 3.의 쿼리문으로 PreparedStatment 객체를 만든다.
			statement = conn.prepareStatement(query);
			
			//5. 쿼리문에 있는 물음표에 들어갈 값들을 차례로 넣는다. (1,2,3...은 물음표에 들어갈 값의 순서를 나타냄)
			statement.setString(1, user.getEmail());
			statement.setString(2, user.getPhone());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getNickname());
			statement.setString(5, user.getAddress());
			statement.setInt(6, user.getMileage());
			
			//6. statement를 실행한다. 
			statement.executeUpdate();
			
			//7. statement와 conn은 close()메소드로 닫아준다.
			statement.close();
			conn.close();
			
	}
	
	public UserDto selectByEmail(String email) throws ClassNotFoundException, SQLException{
		//1.jdbc를 로드한다.
		Class.forName("com.mysql.jdbc.Driver");
		//2. 데이터베이스 접근에 필요한 커낵션 객체를 만든다.
		conn = DriverManager.getConnection(DBConfig.getDBAddress()+"&useSSL=false", DBConfig.getDBUser(), DBConfig.getDBPassword());


		//3. sql 쿼리문을 만든다.
		String query = "select id, email, password from user where email = ?";
		//4. 2.에서 만든 커낵션 객체와 3.의 쿼리문으로 PreparedStatment 객체를 만든다.
		statement = conn.prepareStatement(query);
		
		//5. 쿼리문에 있는 물음표에 들어갈 값들을 차례로 넣는다. (1,2,3...은 물음표에 들어갈 값의 순서를 나타냄)
		statement.setString(1, email);
		
		//6. statement를 실행한다. (select문의 경우 select한 결과가 ResultSet 형태로 리턴된다.)
		ResultSet result = statement.executeQuery();

		
		UserDto userInfo = new UserDto();
		
		//result.next()로 result 커서의 주소를 옮겨줘야 select문 결과를 가져올 수 있음.
		while(result.next()){
			userInfo.setId(result.getInt("id"));
			userInfo.setEmail(result.getString("email"));
			userInfo.setPassword(result.getString("password"));			
		}
		
		//7. statement와 conn은 close()메소드로 닫아준다.
		statement.close();
		conn.close();
		result.close();
		
		return userInfo;
		
	}
}
