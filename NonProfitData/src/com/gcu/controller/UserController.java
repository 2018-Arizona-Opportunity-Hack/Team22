package com.gcu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gcu.business.TableBusinessInterface;
import com.gcu.data.UserDataInterface;
import com.gcu.model.Donations;
import com.gcu.model.User;


/*Pages:
 * index.jsp
 * Main.jsp
 * TableList.jsp
 * TableView.jsp
 * TableEdit.jsp
 * TableSearch.jsp
 * UserSettings.jsp
 * ServeyList.jsp
 * createServey.jsp
 * 
 */
@Controller
@RequestMapping(path ="/user")
public class UserController 
{
	TableBusinessInterface service;
	UserDataInterface data;
	
	@RequestMapping(path="/splash",method=RequestMethod.GET)
	public ModelAndView displayForm() 
	{
		return new ModelAndView("index", "user", new User("","", 0));
	}
	
	@RequestMapping(path="/login",method=RequestMethod.POST)
	public ModelAndView Table(@Valid @ModelAttribute("user")User user, BindingResult result) 
	{
		if(result.hasErrors()) 
		{
			return new ModelAndView("index", "user", user);
		}
		String Email = user.getEmail();
		String password = user.getPassword();
		boolean loginPass = service.login(Email, password);
		
		if (loginPass = false) 
		{
			return new ModelAndView("main", "user", new User("", "", 0));
			
		}
		else 
			return new ModelAndView("index", "user", new User("", "", 0));
	}
	
	@RequestMapping(path="/displayTable",method=RequestMethod.POST)
	public ModelAndView TableList(@Valid @ModelAttribute("Donations")Donations donations, BindingResult result)
	{
		//List<Tables> tables1 = new ArrayList<Tables>();
		service.
		
		return new ModelAndView("main", "user", new User("", "", 0));
	}
	
	
	@Autowired
	public void setService(TableBusinessInterface service) {
		this.service = service;
	}
	
	@Autowired
	public void setData(UserDataInterface data) {
		this.data = data;
	}
}
