package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import dto.*;

public class ProductDao {
	
	private Connection conn;
	private PreparedStatement statement;
	
	/* 가장 최근에 등록되어서 메인페이지에 올라갈 상품들 조회*/
	public ArrayList<ProductDto> getNewest() throws ClassNotFoundException, SQLException{

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBConfig.getDBAddress()+"&useSSL=false", DBConfig.getDBUser(), DBConfig.getDBPassword());

		String query = "select * from product order by code desc limit 6";
		statement = conn.prepareStatement(query);
		ResultSet result = statement.executeQuery();

		ArrayList<ProductDto> products = new ArrayList<ProductDto>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//result.next()로 result 커서의 주소를 옮겨줘야 select문 결과를 가져올 수 있음.
		while(result.next()){
			ProductDto product = new ProductDto();
			product.setCode(result.getInt("code"));
			product.setCategory(result.getString("category"));
			product.setName(result.getString("name"));
			product.setPrice(result.getString("price"));
			product.setImagePath(result.getString("imagePath"));
			product.setDescription(result.getString("description"));
			product.setPostedTime(dateFormat.format(result.getDate("postedTime")));
			products.add(product);
		}
		
		statement.close();
		conn.close();
		result.close();
		
		return products;
	}
	
	/* 종류별로 상품 조회*/
	public ArrayList<ProductDto> getProductsByCategory(String category) throws ClassNotFoundException, SQLException{

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBConfig.getDBAddress()+"&useSSL=false", DBConfig.getDBUser(), DBConfig.getDBPassword());

		String query = "select * from product where category = ?";
		statement = conn.prepareStatement(query);
		statement.setString(1, category);
		ResultSet result = statement.executeQuery();

		ArrayList<ProductDto> products = new ArrayList<ProductDto>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//result.next()로 result 커서의 주소를 옮겨줘야 select문 결과를 가져올 수 있음.
		while(result.next()){
			ProductDto product = new ProductDto();
			product.setCode(result.getInt("code"));
			product.setCategory(result.getString("category"));
			product.setName(result.getString("name"));
			product.setPrice(result.getString("price"));
			product.setImagePath(result.getString("imagePath"));
			product.setDescription(result.getString("description"));
			product.setPostedTime(dateFormat.format(result.getDate("postedTime")));
			products.add(product);
		}
		
		statement.close();
		conn.close();
		result.close();
		
		return products;
	}
	
	/*특정 상품을 코드로 조회*/
	public ProductDto getProductByCode(int code) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBConfig.getDBAddress()+"&useSSL=false", DBConfig.getDBUser(), DBConfig.getDBPassword());

		String query = "select * from product where code = ?";
		statement = conn.prepareStatement(query);
		statement.setInt(1, code);
		ResultSet result = statement.executeQuery();

		ProductDto product = new ProductDto();;
		while(result.next()){
			product.setCode(result.getInt("code"));
			product.setCategory(result.getString("category"));
			product.setName(result.getString("name"));
			product.setPrice(result.getString("price"));
			product.setImagePath(result.getString("imagePath"));
			product.setDescription(result.getString("description"));
		}
	
		statement.close();
		result.close();
		conn.close();
		
		return product;
	}
	
}
