package Dto;

public class DtoEmail {
	
	private String userID;
	private String userPassword;
	private String userEmail;
	private String SHA256;
	private boolean flag;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getSHA256() {
		return SHA256;
	}
	public void setSHA256(String sHA256) {
		SHA256 = sHA256;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
	public DtoEmail(String userID,String userPassword, String userEmail, String SHA256, boolean flag) {
		this.userID = userID;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.SHA256 = SHA256;
		this.flag = flag;
		
	}


	

}
