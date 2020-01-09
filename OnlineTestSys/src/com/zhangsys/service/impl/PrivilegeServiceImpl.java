package com.zhangsys.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhangsys.dao.FunctionDao;
import com.zhangsys.dao.RoleDao;
import com.zhangsys.dao.UsersDao;
import com.zhangsys.po.Function;
import com.zhangsys.po.Role;
import com.zhangsys.po.Users;
import com.zhangsys.service.PrivilegeService;


@Service
@Transactional
public class PrivilegeServiceImpl implements PrivilegeService {
   @Autowired
   private UsersDao usersDao;
   @Autowired
   private FunctionDao functionDao;
   @Autowired
   private RoleDao roleDao;
	
	public PrivilegeServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int addUser(Users user) {
		// TODO Auto-generated method stub
		return usersDao.addUsers(user);
	}

	@Override
	public List<Users> findAllUsers() {
		// TODO Auto-generated method stub
		return usersDao.findAllUsers();
	}

	@Override
	public Users findUserById(Users user) {
		// TODO Auto-generated method stub
		List<Role> roles=findRoleByUserId(user);
		Users us=usersDao.findUsersById(user);
		us.setRoleList(roles);
		return us;
	}

	@Override
	public int addRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.addRole(role);
	}

	@Override
	public List<Role> findAllRoles() {
		// TODO Auto-generated method stub
		return roleDao.findAllRoles();
	}

	@Override
	public Role findRoleById(Integer id) {
		// TODO Auto-generated method stub
		List<Function> fus=findFunctionByRoleId(id);
		Role role=roleDao.findRoleById(id);
		role.setFunctions(fus);
		return role;
	}

	@Override
	public int delUser(Users users) {
		// TODO Auto-generated method stub
		return usersDao.delUsers(users);
	}

	@Override
	public int updateUser(Users users) {
		// TODO Auto-generated method stub
		return usersDao.updateUsers(users);
	}

	@Override
	public int updateRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.updateRole(role);
	}

	@Override
	public int delRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.delRole(role);
	}

	@Override
	public List<Role> findRoleByUserId(Users user) {
		// TODO Auto-generated method stub
		return roleDao.findRoleByUserId(user);
	}

	@Override
	public int grantRole2User(Users user, List<Role> roles) {
		// TODO Auto-generated method stub
		int result=0;
		for(Role role:roles ){
			System.out.print("grant roleID= "+role.getId().toString());
			Map<String, Integer> map=new HashMap<String, Integer>();
			map.put("userId", user.getId());
			map.put("roleId",role.getId());
			result+=usersDao.updateUsersRoles(map);
		}
		return result;
	}

	
	@Override
	public int addFunction(Function function) {
		// TODO Auto-generated method stub
		return functionDao.addFunction(function);
	}

	@Override
	public List<Function> findAllFunctions() {
		// TODO Auto-generated method stub
		return functionDao.findAllFunctions();
	}

	@Override
	public Function findFunctionById(Function function) {
		// TODO Auto-generated method stub
		return functionDao.findFunctionById(function);
	}

	@Override
	public int delFunction(Function function) {
		// TODO Auto-generated method stub
		return functionDao.delFunction(function);
	}

	@Override
	public int updateFunction(Function function) {
		// TODO Auto-generated method stub
		return functionDao.updateFunction(function);
	}

	@Override
	public int grantFunction2Role(String roleId, String[] functionIds) {
		// TODO Auto-generated method stub
		int result=0;
		for(int i=0;i<functionIds.length;i++ ){
			Map<String, Integer> map=new HashMap<String, Integer>();
			map.put("roleId", Integer.parseInt(roleId));
			map.put("functionId",Integer.parseInt(functionIds[i]));
			result+=roleDao.updateRolesFunction(map);
		}
		return result;
	}

	@Override
	public List<Function> findFunctionByRoleId(Integer id) {
		// TODO Auto-generated method stub
		return functionDao.findFunctionByRoleId(id);
	}

}
