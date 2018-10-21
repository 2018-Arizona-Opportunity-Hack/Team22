package com.gcu.data;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gcu.model.User;


public class DataService implements UserDataInterface<T> 
{
	mydb = dbConnect(MySQL(), user='u425692621_root', 
            password='YellowFinch', 
            dbname = 'u425692621_table', 
            host='sql167.main-hosting.eu',
            port=3306)
	
	
	private String url = "sql167.main-hosting.eu";
	private String username = "u425692621_root";
	private String password = "YellowFinch";
	
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public T register(T t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public T delete(T t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public T update(T t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public T create(T t) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public T search(T t) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
