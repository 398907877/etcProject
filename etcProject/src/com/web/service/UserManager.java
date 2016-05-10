package com.web.service;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;

import com.web.bean.User;
import com.web.dao.IUserDao;
import com.web.dao.UserDao;

public class UserManager implements IUserManager{

	@Resource(name="userDao")
	private IUserDao userDao;
	
	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return userDao.getAllUser();
	}

	@Override
	public boolean delUser(int id) {
		// TODO Auto-generated method stub
		return userDao.delUser(id);
	}

	@Override
	public User getUser(int id) {
		// TODO Auto-generated method stub
		return userDao.getUser(id);
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		
		return userDao.updateUser(user);
	}

	

}
