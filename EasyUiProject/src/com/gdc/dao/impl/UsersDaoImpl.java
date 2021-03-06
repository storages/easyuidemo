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
		Query query = session
				.createQuery("select a from Users a where a.name = '"
						+ uaername + "' and a.password ='" + password + "'");
		List list = query.list();
		if (null != list && list.size() > 0) {
			return (Users) list.get(0);
		}
		return null;
	}

	@Override
	public List<Users> view(Users users, int page, int rows, String sort,String order) {
		List<Users> list = null;
		if (users != null) {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select u from Users u where 1=1 ";
			if (users.getName() != null && !"".equals(users.getName().trim())) {
				hql += " and u.name like '%" + users.getName() +"%'";
			}
			if (users.getAddress() != null && !"".equals(users.getAddress().trim())) {
				hql += " and u.address like '%" + users.getAddress() +"%'";
			}
			if ((sort != null && !"".equals(sort.trim()))&&(order != null && !"".equals(order.trim()))) {
				hql+=" order by u."+sort + " "+order;
			}
			Query query = session.createQuery(hql);
			query.setFirstResult((page - 1) * rows).setMaxResults(rows);
			list = query.list();
		}
		return list;
	}

	public Long getTotal(String clazz) {
		Long count = null;
		if (null != clazz && !"".equals(clazz.trim())) {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select count(*) from " + clazz + " u ";
			Query query = session.createQuery(hql);
			count = (Long) query.uniqueResult();
		}
		return count;
	}

	@Override
	public void delete(String[] ids) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "delete from Users u where u.id="+ids[0];
		if(ids!=null && ids.length>1){
			for(int i=1;i<ids.length;i++){
				hql+=" or u.id="+ids[i];
			}
		}
		Query query = session.createQuery(hql);
		query.executeUpdate();
	}
}
