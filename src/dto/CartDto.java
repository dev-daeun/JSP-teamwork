package dto;

public class CartDto {

	private int id;
	private int userId;
	private int productCode;
	private short isPurchased;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public short getIsPurchased() {
		return isPurchased;
	}
	public void setIsPurchased(short isPurchased) {
		this.isPurchased = isPurchased;
	}
	
	
}
