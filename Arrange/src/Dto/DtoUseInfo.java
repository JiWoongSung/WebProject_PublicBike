package Dto;

public class DtoUseInfo {
	private String latitude;
	private String longitude;
	private String cardID;

	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getCardID() {
		return cardID;
	}
	public void setCardID(String cardID) {
		this.cardID = cardID;
	}

	
	public DtoUseInfo() {
		
	}
	
	public DtoUseInfo(String latitude,String longitude, String cardID) {
		this.latitude = latitude;
		this.longitude = longitude;
		this.cardID = cardID;
	}

}
