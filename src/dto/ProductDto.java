package dto;

import java.sql.Timestamp;

public class ProductDto {
	
	private int code;
	private String category;
	private String name;
	private String price;
	private String imagePath;
	private String description;
	private String postedTime;
	
	public ProductDto(){
		this.code = 0;
		this.category = null;
		this.name = null;
		this.price = null;
		this.imagePath = null;
		this.description = null;
		this.postedTime = null;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPostedTime() {
		return postedTime;
	}
	public void setPostedTime(String postedTime) {
		this.postedTime = postedTime;
	}
	
}
