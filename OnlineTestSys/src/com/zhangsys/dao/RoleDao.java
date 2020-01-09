/**
 * 
 */
package com.zhangsys.dao;

import java.util.List;
import java.util.Map;

import com.zhangsys.po.Role;
import com.zhangsys.po.Users;


/**
 * @author Administrator
 *
 */
public interface RoleDao {
	public int addRole(Role role);
	public List<Role> findAllRoles();
	public int delRole(Role role);
	public Role findRoleById(Integer id);
	public List<Role> findRoleByUserId(Users user);
	public int updateRole(Role role);
	public int updateRolesFunction(Map<String, Integer> map);
}
