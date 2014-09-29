package com.gdc.service.impl;

import java.util.List;

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


	@Override
	public List<Users> view(Users users) {
		return this.usersDao.view(users);
	}

}
