package com.zhangsys.interceptor;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zhangsys.po.Function;
import com.zhangsys.po.Role;
import com.zhangsys.po.Users;
import com.zhangsys.service.PrivilegeService;

public class PrivilegeInterceptor implements HandlerInterceptor {
	@Autowired
	private PrivilegeService privilegeService;
	
	public PrivilegeInterceptor() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
	System.out.println("PrivilegeInterceptor");
		HttpSession session = arg0.getSession();
		Users user = (Users)session.getAttribute("user");
		if(user==null){
			arg1.sendRedirect(arg0.getContextPath()+"/mlogin/mlogin.jsp");
			return false;
		}
		//根据用户查询所有的角色，根据角色查询有哪些功能可以访问
		
		Set<Function> functions = new HashSet<Function>();//当前登陆用户可以访问的功能
		
		List<Role> roles = privilegeService.findUserById(user).getRoleList();//查询用户的同时能够查询用户对应的所有角色
		for(Role r:roles){
			List<Function> funs = privilegeService.findRoleById(r.getId()).getFunctions();//角色对应的可访问的功能
			functions.addAll(funs);
		}
		//获取当前用户访问的uri
		String uri = arg0.getRequestURI();//       /OA/manage/PrivilegeServlet          
		uri = uri.replace(arg0.getContextPath(), "");// /manage/PrivilegeServlet   
		// URL=/LoginController/mLogin 不需要参数queryString
		//与可以访问的功能的uri地址进行比对
System.out.println(uri);
		boolean hasPermission = false;//是否有权限
		for(Function f:functions){
			System.out.println("Fun="+f.getUri());
			if(uri.startsWith(f.getUri())){//分页时请注意
				hasPermission = true;
				break;
			}
		}
		//不OK：提示没有权限
		if(!hasPermission){
			arg1.getWriter().write("对不起，您没有权限");
			return false;
		}
		
		return true;
	}

}
