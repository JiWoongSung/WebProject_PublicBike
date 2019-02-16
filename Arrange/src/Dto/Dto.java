package Dto;

public class Dto {
	
	private String loginID;
	private String password;
	private String cardID;
	private String name;
	private String gender;
	private String birth;
	private int count;
	private String date;
	private int balance;
	private String email;
	private String SHA256;
	
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCardID() {
		return cardID;
	}
	public void setCardID(String cardID) {
		this.cardID = cardID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDate() {
		return date;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public Dto(){
		
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSHA256() {
		return SHA256;
	}
	public void setSHA256(String SHA256) {
		this.SHA256 = SHA256;
	}	
	
	public Dto(String loginID,String password,String cardID, String name, String gender,String birth, int count, String date,int balance,String email,String SHA256) {
		super();
		this.loginID = loginID;
		this.password = password;
		this.cardID = cardID;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.count = count;
		this.date = date;
		this.balance = balance;
		this.email = email;
		this.SHA256 = SHA256;
	}

	
//	@Override
//	public String toString() {
//		return "Dto [id=]" + id + ", name=" + name + ", gender="+gender+"]";
//	}


	
}

