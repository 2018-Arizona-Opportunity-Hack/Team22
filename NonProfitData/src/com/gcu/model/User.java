package com.gcu.model;

public class User 
{
	private String email;
	private String password;
	private int adminCheck;
	
	//One kind of constructor
	public User()
	{
		email = "";
		password = "";
		adminCheck =0;
	}
	
	//Another kind of constructor
	public User(String email, String password, int adminCheck) {
		super();
		this.email = email;
		this.password = password;
		this.adminCheck = adminCheck;
	}

	//Getters and Setters
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAdminCheck() {
		return adminCheck;
	}

	public void setAdminCheck(int adminCheck) {
		this.adminCheck = adminCheck;
	}
	

}
