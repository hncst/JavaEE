package com.zhangsys.controller;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhangsys.StaticStatus;
import com.zhangsys.po.Users;
import com.zhangsys.service.LoginSerivce;
import com.zhangsys.service.impl.LoginSerivceImpl;
import com.zhangsys.util.Captcha;

/**
 * 控制器类
 */
@Controller
@RequestMapping(value="/LoginController")
public class LoginController{
	@Autowired
	private LoginSerivce loginSerive;

	@RequestMapping(value="/Login")
	private void Login(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		//判断验证码是否正确
		String sCaptcha = (String) request.getSession().getAttribute("code");
		if(!captcha.equals(sCaptcha)){
			response.getWriter().write("验证码有误！1秒后转向登陆页面");
			response.setHeader("Refresh", "1;URL="+request.getContextPath());
			return;
		}
		//验证用户名和密码
		Users user = loginSerive.login(username,password);
		if(user==null){
			response.getWriter().write("错误的用户名或密码！1秒后转向登陆页面");
			response.setHeader("Refresh", "1;URL="+request.getContextPath());
			return;
		}
		request.getSession().setAttribute(StaticStatus.CUSTOMER_LOGIN_FLAG, user);
		System.out.print("username= "+user.getUsername());
		//提示
		response.getWriter().write("登陆成功！1秒后转向主页");
		response.setHeader("Refresh", "1;URL="+request.getContextPath()+"/index.jsp");
	}

	@RequestMapping(value="/mLogin")
	private String mLogin(HttpServletRequest request, HttpServletResponse response,Model model)  throws ServletException, IOException{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		//判断验证码是否正确
		String sCaptcha = (String) request.getSession().getAttribute("code");
		if(!captcha.equals(sCaptcha)){
			response.getWriter().write("验证码有误！1秒后转向登陆页面");
			//response.setHeader("Refresh", "1;URL="+request.getContextPath()+"/login/mlogin.jsp");
			return "/mlogin/mlogin.jsp";
		}
		//验证用户名和密码
		Users user = loginSerive.login(username,password);
		if(user==null){
			response.getWriter().write("错误的用户名或密码！1秒后转向登陆页面");
			response.setHeader("Refresh", "1;URL="+request.getContextPath()+"/login/mlogin.jsp");
			return "/mlogin/mlogin.jsp";
		}
		//request.setAttribute("user", user);
		request.getSession().setAttribute("user", user);
		
		//提示
		//response.getWriter().write("登陆成功！1秒后转向主页");
		//response.setHeader("Refresh", "1;URL="+request.getContextPath()+"/manage/index.jsp");
		return "/manage/index.jsp";
	}
	
	@RequestMapping(value="/Captcha")
	public void Captcha(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//控制不要缓存
		response.setHeader("Expires", "-1");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		
		int width=90;
		int height=22;
		BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		//产生验证码。
		image=Captcha.CaptchaImage();
		String vcode=Captcha.getvCode();

		System.out.println(vcode);
//		把验证码存放到HttpSession中
		request.getSession().setAttribute("code", vcode);
		//用字节流输出对应的图片
		ImageIO.write(image, "jpg", response.getOutputStream());
	}
}
