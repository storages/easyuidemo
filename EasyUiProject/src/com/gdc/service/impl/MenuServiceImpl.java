package com.gdc.service.impl;

import java.util.List;

import com.gdc.dao.MenuDao;
import com.gdc.domain.Menu;
import com.gdc.service.MenuService;

public class MenuServiceImpl implements MenuService {

	private MenuDao menuDao;
	
	public MenuDao getMenuDao() {
		return menuDao;
	}

	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}

	@Override
	public List<Menu> getMenu(String id) {
		return menuDao.getMenu(id);
	}

	@Override
	public Menu getreeNode(Integer id) {
		return menuDao.getreeNode(id);
	}

	@Override
	public List<Menu> queryTreeNode(Integer id) {
		return menuDao.queryTreeNode(id);
	}

	@Override
	public Integer countChildren(String id) {
		return menuDao.countChildren(id);
	}

}
