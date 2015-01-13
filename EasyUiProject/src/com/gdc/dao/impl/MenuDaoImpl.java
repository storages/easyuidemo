package com.gdc.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.gdc.dao.MenuDao;
import com.gdc.domain.Menu;
import com.gdc.domain.Users;

public class MenuDaoImpl implements MenuDao {

	private SessionFactory sessionFactory = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Menu> getMenu(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = null;
		if (id == null || id.trim().equals("")) {
			query = session
					.createQuery("SELECT t FROM Menu t WHERE t.pid is null ");
		} else {
			query = session.createQuery("SELECT t FROM Menu t WHERE t.pid="
					+ id);
		}
		// Query query = session.createQuery("from Menu");
		List<Menu> list = query.list();
		return list;
	}

	@Override
	public Menu getreeNode(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("SELECT t FROM Menu t WHERE t.id="
				+ id);
		List<Menu> list = query.list();
		if (null != list && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Menu> queryTreeNode(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("SELECT t FROM Menu t WHERE t.pid="
				+ id);
		List<Menu> list = query.list();
		return list;
	}

	@Override
	public Integer countChildren(String id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("SELECT count(t) FROM Menu t WHERE t.pid=" + id);
		List list = query.list();
		Integer count = null;
		if (list != null && list.size() > 0) {
			count = Integer.parseInt(list.get(0).toString());
		}
		return count;
	}

	@Override
	public void invocationInsertSql(String sql) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		query.executeUpdate();
		
	}

}
