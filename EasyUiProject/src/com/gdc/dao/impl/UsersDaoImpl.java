package com.gdc.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.gdc.dao.UsersDao;
import com.gdc.domain.Users;

public class UsersDaoImpl implements UsersDao {

	private SessionFactory sessionFactory = null;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	public void save(Users users) {
		System.out.println(sessionFactory);
		Session session = sessionFactory.getCurrentSession();
		session.save(users);
		
	}


	@Override
	public Users findUser(String uaername, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select a from Users a where a.name = '"+ uaername +"' and a.password ='"+password+"'");
		List list = query.list();
		if(null!=list && list.size()>0){
			return (Users) list.get(0);
		}
		return null;
	}


	@Override
	public List<Users> view(Users users) {
		List<Users> list = null;
		if(users!=null){
			Session session = sessionFactory.getCurrentSession();
			String hql = "select u from Users u where 1=1 ";
			if(users.getName()!=null && !"".equals(users.getName().trim())){
				hql+=" and u.name ="+users.getName();
			}
			Query query = session.createQuery(hql);
			list = query.list();
		}
		return list;
	}

}
