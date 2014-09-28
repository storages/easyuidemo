package com.gdc.dao;

import java.util.List;

import com.gdc.domain.Menu;

public interface MenuDao {

	List<Menu> getMenu(String id);
	Menu getreeNode(Integer id);
	List queryTreeNode(Integer id);
	Integer countChildren(String id);
}
