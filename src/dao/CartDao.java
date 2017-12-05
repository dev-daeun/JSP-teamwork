package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dto.*;

public class CartDao {

	private Connection conn;
	private PreparedStatement statement;
	
	public void insert(CartDto cart) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBConfig.getDBAddress(), DBConfig.getDBUser(), DBConfig.getDBPassword());
		
		String query = "insert into cart(userId, productCode) values (?,?)";
		statement = conn.prepareStatement(query);
		statement.setInt(1, cart.getUserId());
		statement.setInt(2, cart.getProductCode());
		statement.executeUpdate();
		
		statement.close();
		conn.close();
		
	}
	

	public ArrayList<CartProductDto> getCartByUserId(int userId, int isPurchased) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBConfig.getDBAddress(), DBConfig.getDBUser(), DBConfig.getDBPassword());
		
		String query = 
				"select cart.id as cartId, cart.userId, cart.isPurchased, cart.productCode, cart.amount, product.code, product.name, product.price, product.imagePath "+ 
				"from cart join product on product.code = cart.productCode and cart.isPurchased = ? and cart.userId = ? order by id desc";
		statement = conn.prepareStatement(query);
		statement.setInt(1, isPurchased);
		statement.setInt(2, userId);
		ResultSet result = statement.executeQuery();
		ArrayList<CartProductDto> cartList = new ArrayList<CartProductDto>();
		CartDto cart;
		ProductDto product;
		CartProductDto cartElement;
		
		while(result.next()){
			cart = new CartDto();
			cart.setId(result.getInt("cartId"));
			cart.setUserId(result.getInt("userId"));
			cart.setProductCode(result.getInt("productCode"));
			cart.setIsPurchased(result.getShort("isPurchased"));
			cart.setAmount(result.getInt("amount"));
			product = new ProductDto();
			product.setCode(result.getInt("code"));
			product.setName(result.getString("name"));
			product.setPrice(result.getInt("price"));
			product.setImagePath(result.getString("imagePath"));
			
			cartElement = new CartProductDto();
			cartElement.setCart(cart);
			cartElement.setProduct(product);
			cartList.add(cartElement);
			

		}
		
		result.close();
		statement.close();
		conn.close();
		
		return cartList;
		
	}
	
	public void updatePurchased(int userId, String[] productCodes) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(DBConfig.getDBAddress(), DBConfig.getDBUser(), DBConfig.getDBPassword());
		
		String query = "update cart set isPurchased = 1 where userId = ? and productCode in (";
		String subSql = "";
		for(String code: productCodes){
			if(code==null) continue;
			else subSql += code + ",";
		}
		String result = subSql.substring(1, subSql.length()-2);
		query += result;
		query += ");";
		
		statement = conn.prepareStatement(query);
		statement.setInt(1, userId);
		statement.executeUpdate();
		
		statement.close();
		conn.close();
	}
	

}
