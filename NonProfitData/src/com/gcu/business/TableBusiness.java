package com.gcu.business;

import com.gcu.model.User;
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

}
