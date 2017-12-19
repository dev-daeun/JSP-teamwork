package dao;


public class DBConfig {

	static public String getDBAddress(){
		return "jdbc:mysql://localhost:3306/ShoppingMall?characterEncoding=UTF-8&useSSL=false";
	}
	
	static public String getDBUser(){
		return "root";
	}
	
	static public String getDBPassword(){
		return "";
	}

}
