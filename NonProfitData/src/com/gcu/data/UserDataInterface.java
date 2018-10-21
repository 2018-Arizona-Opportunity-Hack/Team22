package com.gcu.data;

import com.gcu.model.User;

public interface UserDataInterface <T>
{
	public T login(T t);
	public T register(T t);
	public T delete(T t);
	public T update(T t);
	public T create(T t);
	public T search(T t);
	public boolean register(String t, String s, int e);
	public User login(String t, String s);
}
