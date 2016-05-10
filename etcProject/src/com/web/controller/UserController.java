package com.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.bean.User;
import com.web.service.IUserManager;
import com.web.service.UserManager;



@Controller
@RequestMapping("user")
public class UserController {

	@Resource(name="userManager")
	private IUserManager userManager;
	
	@RequestMapping("/addUser")
	public String addUser(User user)
	{ 
		userManager.addUser(user);
		//return "redirect/forward:url";
		return "redirect:/user/getAllUser";
	}

	@RequestMapping("/getAllUser")
	public String getAllUser(HttpServletRequest request)
	{
		List<User>userList=userManager.getAllUser();
		request.setAttribute("userList", userList);
		return "/userManager";
	}
	
	@RequestMapping("/delUser")
	public void delUser(int id,HttpServletResponse response)
	{
		String result="{\"info\":\"error\"}";
		if(userManager.delUser(id))
		{
			result="{\"info\":\"success\"}";
		}
		response.setContentType("application/json");
		try 
		{
			PrintWriter out=response.getWriter();
			out.write(result);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		
			
	}
	@RequestMapping("/getUser")
	public String getUser(int id,HttpServletRequest request)
	{
		User user = userManager.getUser(id);
		System.out.println(user.getUsername());
		//HttpSession session = request.getSession();
		request.setAttribute("user", user);
		return "/editUser";
		
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(User user ,HttpServletRequest request)
	{
		if(userManager.updateUser(user))
		{
			return "redirect:/user/getAllUser";
		}
		else
		{
			return "/error";
		}
		
	}
	
	
}
