package com.web.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.web.bean.User;

public class UserDao implements IUserDao{

	private SessionFactory sessionfactory;
	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}
	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	public void addUser(User user) {
		sessionfactory.getCurrentSession().save(user);
	}
	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		String hql="from User";
		Query query=sessionfactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
	@Override
	public boolean delUser(int id) {
		// TODO Auto-generated method stub
		String hql="delete User u where u.id=?";
		Query q=sessionfactory.getCurrentSession().createQuery(hql);
		q.setInteger(0, id);
		return (q.executeUpdate()>0);
	}
	@Override
	public User getUser(int id) {
		// TODO Auto-generated method stub
		String hql="from User u where u.id=?";
		Query q = sessionfactory.getCurrentSession().createQuery(hql);
		q.setInteger(0, id);
		return (User)q.uniqueResult();
	}
	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		String hql="update User u set u.username=?,u.password=? where u.ID=?";
		Query q = sessionfactory.getCurrentSession().createQuery(hql);
		q.setString(0, user.getUsername());
		q.setString(1, user.getPassword());
		q.setInteger(2, user.getID());
		return (q.executeUpdate()>0);
	}

}
