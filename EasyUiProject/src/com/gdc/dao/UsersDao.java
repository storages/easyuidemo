package com.gdc.dao;

import com.gdc.domain.Users;

public interface UsersDao {
	void save(Users users);
	Users findUser(String uaername,String password);
}
