package com.zhangsys.service;

import java.util.List;

import com.zhangsys.po.Function;
import com.zhangsys.po.Role;
import com.zhangsys.po.Users;

public interface PrivilegeService {
	
	public int addUser(Users user);
	public List<Users> findAllUsers();
	public Users findUserById(Users user);
	public int delUser(Users users);
	public int updateUser(Users users);
	
	public int addRole(Role role);
	public List<Role> findAllRoles();
	public Role findRoleById(Integer id);
	public List<Role> findRoleByUserId(Users user);
	public int delRole(Role role);
	public int updateRole(Role role);

	public int addFunction(Function function);
	public List<Function> findAllFunctions();
	public List<Function> findFunctionByRoleId(Integer id);
	public Function findFunctionById(Function function);
	public int delFunction(Function function);
	public int updateFunction(Function function);

	public int grantRole2User(Users user,List<Role> roles);
	public int grantFunction2Role(String roleId,String[] functionIds);
}
