package com.zhangsys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhangsys.dao.UsersDao;
import com.zhangsys.po.Users;
import com.zhangsys.service.LoginSerivce;

@Service
@Transactional
public class LoginSerivceImpl implements LoginSerivce {

	@Autowired
	private UsersDao usersDao;
	LoginSerivceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Users login(String username, String password) {
		// TODO Auto-generated method stub
		Users user=new Users();
		user.setUsername(username);
		user.setPassword(password);
		Users u=new Users();
		return usersDao.login(user);
	}

}
