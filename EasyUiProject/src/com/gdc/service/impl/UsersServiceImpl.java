package com.gdc.service.impl;

import com.gdc.dao.UsersDao;
import com.gdc.domain.Users;
import com.gdc.service.UsersService;

public class UsersServiceImpl implements UsersService{

	private UsersDao usersDao = null;
	
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}


	public void save(Users users) {
		System.out.println("-----UsersDaoService------");
		usersDao.save(users);
	}
	
	public Users findUser(String uaername, String password){
		return this.usersDao.findUser(uaername, password);
	}

}
