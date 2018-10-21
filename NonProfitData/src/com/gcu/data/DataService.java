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
	/*mydb = dbConnect(MySQL(), user='u425692621_root', 
            password="YellowFinch"; 
            dbname = "u425692621_table"; 
            host="sql167.main-hosting.eu";
            port=3306)
	*/
	
	private String url = "sql167.main-hosting.eu";
	private String username = "u425692621_root";
	private String password = "YellowFinch";
	
	@Override
	public boolean register(String Email, String password, int check) 
	{
		Connection conn = null;	
		String sql = "INSERT INTO u425692621_table.USER(EMAIL, PASSWORD, ADMINCHK)"
				+ " VALUES('" + Email + "', '" + password + "','" + check + "')";

		boolean create = true;
		try {
			conn = DriverManager.getConnection(url, username, password);
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return create;
	}
	@Override
	public User login(String Email, String password) {
		System.out.println(Email + "->");
		User userInfo = new User();
		Connection conn = null;
		String sql = "SELECT * FROM u425692621_table.USER WHERE EMAIL = '" + Email + "' AND PASSWORD = '"
				+ password + "'";
		System.out.println(sql);
		int count = 0;
		try {
			conn = DriverManager.getConnection(url, username, password);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			System.out.println("Test 1.");
			System.out.println(count);

			while (rs.next()) { 
				count++;
				userInfo.setPassword(rs.getString("PASSWORD"));
				userInfo.setEmail(rs.getString("EMAIL"));
			}
			if (count == 1) {

				return userInfo;
			} else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
}

