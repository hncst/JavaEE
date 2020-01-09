<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>在线考试系统管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/calendar.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/calendar.js"></script>
  </head>
  <body>
    欢迎您：${user.username}
    <hr/>
           管理员：
    <a href="">学科管理</a>
    <a href="">章节管理</a>
    <a href="">学生管理</a>
    <a href="">班级管理</a>
    <a href="">班级成员管理</a>
    <a href="">班级学科管理</a>
    <br/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="">考试发布管理</a>
    <a href="">学生成绩查询</a>
    <a href="">班级成绩查询</a>
    <br/>
	老师管理：
    <a href="">批阅试卷</a>
    <a href="">查看试卷</a>
    <a href="">学生成绩查询</a>
    <a href="">班级成绩查询</a>
    <a href="">试题模块管理</a>
    <a href="">试题管理</a>
    <br/>
         学生管理：
    <a href="">学生成线考试</a>
    <a href="">学生成绩查询</a>
    <br/>
         权限管理：
    <a href="${pageContext.request.contextPath}/manage/PrivilegeServlet/listFunctions">功能管理</a>
    <a href="${pageContext.request.contextPath}/manage/PrivilegeServlet/listRoles">角色管理</a>
    <a href="${pageContext.request.contextPath}/manage/PrivilegeServlet/listUsers">用户管理</a>
<hr/>