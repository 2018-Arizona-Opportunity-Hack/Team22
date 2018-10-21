package com.gcu.data;

public interface UserDataInterface <T>
{
	public T login(T t);
	public T register(T t);
	public T delete(T t);
	public T update(T t);
	public T create(T t);
	public T search(T t);
}
