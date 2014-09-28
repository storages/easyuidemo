package com.gdc.service;

import java.util.List;

import com.gdc.domain.Menu;

public interface MenuService {
	List<Menu> getMenu(String id);
	Menu getreeNode(Integer id);
	List<Menu> queryTreeNode(Integer id);
	Integer countChildren(String id);
}
