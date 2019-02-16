package Dto;

public class DtoPlace {
	private String placeName;
	private double latitude;
	private double longitude;
	private int count;
	private int money;
	
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	public DtoPlace(){
		
	}
	public DtoPlace(String placeName, double latitude, double longitude, int count, int money) {
		this.placeName = placeName;
		this.latitude = latitude;
		this.longitude = longitude;
		this.count = count;
		this.money = money;
	}
	
	
}
