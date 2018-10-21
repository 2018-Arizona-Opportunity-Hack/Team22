package com.gcu;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

import com.gcu.business.*;
import com.gcu.controller.*;
import com.gcu.model.*;


@Configuration
public class ApplicationConfig 
{
	@Bean(name="userController")
	public UserController getUserController()
	{
		System.out.println("test");
		return new UserController();
	}
	
	/*List of scopes:
	 * singleton
	 * prototype
	 * request
	 * session
	 */
	
	@Bean(name="ordersService", initMethod="init", destroyMethod="destroy")
	@Scope(value="session", proxyMode=ScopedProxyMode.TARGET_CLASS)
	public TableBusinessInterface getOrdersService()
	{
		return new TableBusinessInterface();
	}
}
