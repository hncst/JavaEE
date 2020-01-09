package com.zhangsys.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhangsys.po.Function;
import com.zhangsys.po.Role;
import com.zhangsys.po.Users;
import com.zhangsys.service.PrivilegeService;
import com.zhangsys.util.WebUtil;

@Controller
@RequestMapping(value="/manage/PrivilegeServlet")
public class PrivilegeServlet {
	@Autowired
	private PrivilegeService privilegeService;
	
	public PrivilegeServlet() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value="/saveGrantUser")
	private void saveGrantUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String userId = request.getParameter("userId");
		Users user=new Users();
		if(userId!=null){
			user.setId(Integer.parseInt(userId));
		}else{
			request.setAttribute("message", "角色分配处理失败！");
			request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
		}
		String[] roleIds = request.getParameterValues("roleId");
		int result=0;
		if(roleIds!=null&&roleIds.length>0){
			List<Role> roles=new ArrayList<Role>();
			for(int i=0;i<roleIds.length;i++){
				Role role=new Role();
				role.setId(Integer.parseInt(roleIds[i]));
				roles.add(role);
			}
			
			result=privilegeService.grantRole2User(user,roles);
		}
		if(result>0){
			request.setAttribute("message", "角色分配处理成功！");
			request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
		}else{
			request.setAttribute("message", "角色分配处理失败！");
			request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
		}
	}
	
	@RequestMapping(value="/grantUser", params = {"id"})
	private void grantUser(Integer id,HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		//根据id查询用户：查询用户同时把已经分配的角色查询出来
		Users pUser=new Users();
		pUser.setId(id);	
		Users user = privilegeService.findUserById(pUser);
		List<Role> uRoles = privilegeService.findRoleByUserId(pUser);
		user.setRoleList(uRoles);
		//查询所有的角色列表
		List<Role> roles = privilegeService.findAllRoles();
		//转向页面去显示
		request.setAttribute("user", user);
		request.setAttribute("roles", roles);
		request.getRequestDispatcher("/pmanage/grantUser.jsp").forward(request, response);
	}
	
	@RequestMapping(value="/updateUser", params = {"id"})
	private void updateUser(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//根据id查询用户：查询用户同时把已经分配的角色查询出来
		Users pUser=new Users();
		pUser.setId(id);	
		int delCount = privilegeService.updateUser(pUser);
		if(delCount>0){
			request.setAttribute("message", "修改成功！");
			request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
		}else{
			request.setAttribute("message", "修改失败！");
			request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
		}
	}

	@RequestMapping(value="/delUser", params = {"id"})
	private void delUser(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//根据id查询用户：查询用户同时把已经分配的角色查询出来
		Users pUser=new Users();
		pUser.setId(id);	
		int delCount = privilegeService.delUser(pUser);
		if(delCount>0){
			request.setAttribute("message", "删除成功！");
			request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
		}else{
			request.setAttribute("message", "删除失败！");
			request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
		}
	}

	
	@RequestMapping(value="/addUser")
	private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Users user = WebUtil.fillBean(request, Users.class);
		privilegeService.addUser(user);
		request.setAttribute("message", "添加成功");
		request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
	}
	
	//用户列表
	@RequestMapping(value="/listUsers")
	private void listUsers(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		List<Users> users = privilegeService.findAllUsers();
		List<Role> roles = privilegeService.findAllRoles();
		request.setAttribute("users", users);
		request.setAttribute("roles",roles);
		request.getRequestDispatcher("/pmanage/listUsers.jsp").forward(request, response);
	}

	//保存功能分配
	
	@RequestMapping(value="/saveGrantRole")
	private void saveGrantRole(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String roleId = request.getParameter("roleId");
		String[] functionIds = request.getParameterValues("functionId");
		if(functionIds!=null&&functionIds.length>0){
			privilegeService.grantFunction2Role(roleId,functionIds);
		}
		request.setAttribute("message", "处理成功");
		request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
	}
	
	//给角色分配功能
	@RequestMapping(value="/grantRole",params={"id"})
	private void grantRole(Integer id,HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//根据id查询角色：查询角色同时把已经分配的功能查询出来
		Role role = privilegeService.findRoleById(id);
		List<Function> rFunction = privilegeService.findFunctionByRoleId(id);
		role.setFunctions(rFunction);
		//查询所有的功能列表
		List<Function> functions = privilegeService.findAllFunctions();
		//转向页面去显示
		request.setAttribute("role", role);
		request.setAttribute("functions", functions);
		request.getRequestDispatcher("/manage/grantRole.jsp").forward(request, response);
	}
	
	@RequestMapping(value="/addRole")
	private void addRole(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Role role = WebUtil.fillBean(request, Role.class);
		privilegeService.addRole(role);
		request.setAttribute("message", "添加成功");
		request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
	}
	
	@RequestMapping(value="/listRoles")
	private void listRoles(HttpServletRequest request,
			HttpServletResponse response)  throws ServletException, IOException{
		List<Role> roles = privilegeService.findAllRoles();
		request.setAttribute("roles", roles);
		request.getRequestDispatcher("/manage/listRoles.jsp").forward(request, response);
	}
	
	//添加功能

	@RequestMapping(value="/addFunction")
    private void addFunction(HttpServletRequest request,
			HttpServletResponse response)  throws ServletException, IOException{
		Function function = WebUtil.fillBean(request, Function.class);
		privilegeService.addFunction(function);
		request.setAttribute("message", "添加成功");
		request.getRequestDispatcher("/manage/message.jsp").forward(request, response);
	}
	
	//列出所有的功能
	@RequestMapping(value="/listFunctions")
	private void listFunctions(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Function> functions = privilegeService.findAllFunctions();
		request.setAttribute("functions", functions);
		request.getRequestDispatcher("/manage/listFunctions.jsp").forward(request, response);
	}

}
