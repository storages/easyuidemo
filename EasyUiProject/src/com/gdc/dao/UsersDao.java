package com.gdc.dao;

import java.util.List;

import com.gdc.domain.Users;

public interface UsersDao {
	void save(Users users);
	Users findUser(String uaername,String password);
	List<Users> view(Users users);
}
