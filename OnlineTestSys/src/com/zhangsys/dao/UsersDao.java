/**
 * 
 */
package com.zhangsys.dao;

import java.util.List;
import java.util.Map;
import com.zhangsys.po.Users;

/**
 * @author Administrator
 *
 */
public interface UsersDao {
	public Users login(Users users);
	public int addUsers(Users users);
	public List<Users> findAllUsers();
	public int delUsers(Users users);
	public Users findUsersById(Users users);
	public int updateUsers(Users users);
	public int updateUsersRoles(Map<String, Integer> map);
    
}
