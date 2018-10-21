package com.gcu.business;

public interface TableBusinessInterface <T>
{
	public boolean login(String email, String password);
	public T logout(T t);
	public T createTable(T t);
	public T updateTable(T t);
	public T search(T t);
	public T export(T t);
	

}
