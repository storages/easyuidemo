package com.gdc.service;

import com.gdc.domain.Users;

public interface UsersService {
	void save(Users users);
	public Users findUser(String uaername, String password);
}
