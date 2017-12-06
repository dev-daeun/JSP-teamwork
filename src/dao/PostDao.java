package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import dto.PostDto;
import dto.UserDto;
import dto.UserPostDto;

public class PostDao {

	private Connection conn;
	private PreparedStatement statement;
	
	public void insert(PostDto newPost) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBConfig.getDBAddress(), DBConfig.getDBUser(), DBConfig.getDBPassword());
		
		String query = "insert into post(userId, category, title, content) values(?,?,?,?)";
		
		statement = conn.prepareStatement(query);
		statement.setInt(1, newPost.getUserId());
		statement.setString(2, newPost.getCategory());
		statement.setString(3, newPost.getTitle());
		statement.setString(4, newPost.getContent());
		statement.execute();
		
		statement.close();
		conn.close();
	}
	
	public ArrayList<UserPostDto> selectAll() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBConfig.getDBAddress(), DBConfig.getDBUser(), DBConfig.getDBPassword());
		
		String query = "select user.nickname, post.* from post join user on user.id = post.userId order by post.id desc";
		statement = conn.prepareStatement(query);
		ResultSet result = statement.executeQuery();
		
		ArrayList<UserPostDto> list = new ArrayList<UserPostDto>();
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
		PostDto post;
		UserDto user;
		while(result.next()){
			post = new PostDto();
			post.setCategory(result.getString("category"));
			post.setUserId(result.getInt("userId"));
			post.setTitle(result.getString("title"));
			post.setContent(result.getString("content"));
			Date postedDate = result.getDate("postedTime");
		   String date = DATE_FORMAT.format(postedDate);
		   post.setPostedTime(date);
   
		   user = new UserDto();
		   user.setNickname(result.getString("nickname"));
		   
		   UserPostDto element = new UserPostDto();
		   element.setUser(user);
		   element.setPost(post);
		   list.add(element);
		}
		result.close();
		statement.close();
		conn.close();
		
		return list;
		
	}
	
}
