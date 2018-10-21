package com.gcu.business;

import com.gcu.model.User;

import java.util.List;

import com.gcu.data.DataService;
import com.gcu.data.UserDataInterface;

public class TableBusiness implements TableBusinessInterface<T> {
	
	UserDataInterface data;

	@Override
	public boolean login(String thing, String password) {
		
		if(data.login(thing, password)!= null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	@Override
	public T logout(T t) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Table Tablelist(Table table)
	{
		
		data.
		/*
		Connection jdbcConnection = DriverManager.getConnection("", "", "");
		DatabaseMetaData md = conn.getMetaData();
		ResultSet rs = md.getTables(null, null, "%", null);
		while (rs.next()) {
		  System.out.println(rs.getString(3));
		}
		*/
		return Table
	}

}
