package com.web.dao;

import java.util.List;

import com.web.bean.User;

public interface IUserDao {
	
	public void addUser(User user);
	
	public List<User>getAllUser();
	
	public boolean delUser(int id);
	
	public User getUser(int id);
	
	public boolean updateUser(User user);
}
