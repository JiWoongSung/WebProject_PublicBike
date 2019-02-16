package Dto;

public class DtoRtime {
	private String useTime;
	private String returnTime;
	private String latitude;
	private String longitude;
	private String Rlatitude;
	private String Rlongitude;
	private String cardId;
	
	public String getUseTime() {
		return useTime;
	}


	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}



	public String getReturnTime() {
		return returnTime;
	}



	public void setReturnTime(String returnTime) {
		this.returnTime = returnTime;
	}



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



	public String getRlatitude() {
		return Rlatitude;
	}



	public void setRlatitude(String rlatitude) {
		Rlatitude = rlatitude;
	}



	public String getRlongitude() {
		return Rlongitude;
	}



	public void setRlongitude(String rlongitude) {
		Rlongitude = rlongitude;
	}



	public String getCardId() {
		return cardId;
	}



	public void setCardId(String loginId) {
		this.cardId = loginId;
	}
	public DtoRtime() {
		
	}

	public DtoRtime(String useTime,String returnTime,String latitude,String longitude, String Rlatitude, String Rlongitude, String cardId) {
		super();
		this.useTime = useTime;
		this.returnTime = returnTime;
		this.latitude = latitude;
		this.longitude = longitude;
		this.Rlatitude = Rlatitude;
		this.Rlongitude = Rlongitude;
		this.cardId = cardId;
	}
}
