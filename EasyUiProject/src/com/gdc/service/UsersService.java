package com.gdc.service;

import java.util.List;

import com.gdc.domain.Users;

public interface UsersService {
	void save(Users users);
	public Users findUser(String uaername, String password);
	List<Users> view(Users users);
}
