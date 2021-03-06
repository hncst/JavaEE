<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="utf-8">
   <title>在线考试后台管理</title>
   <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
   <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
   <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
		<!--  导航条  -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">在线考试后台管理系统</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#">首页</a></li>
		        <li><a href="#">维护</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">功能 <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">订餐</a></li>
		            <li><a href="#">投诉</a></li>
		            <li><a href="#">建议</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">管理链接</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">更多消息</a></li>
		          </ul>
		        </li>
		        <li><a href="javascript:;">帮助</a></li>
		      </ul>
		      <form class="navbar-form navbar-right">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="姓名">
		        </div>
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="密码">
		        </div>
		        <button type="submit" class="btn btn-default top-right">登录</button>
		      </form>		      
		    </div>
		  </div>
		</nav>
	
		<!-- main主界面内容 -->
		<div id="main" class="row" style="margin-top: 50px;">
			<div id="left" class="col-md-3 col-sm-3 col-xs-3" >
			<div class="panel-group" id="accordion">
	        <div class="panel panel-admin">
		       <div class="panel-heading">
			    <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseOne">
					管理员
				</a>
			   </h4>
		    </div>
		    <div id="collapseOne" class="panel-collapse collapse">
			  <div class="panel-body">
				<ul class="nav nav-pills nav-stacked">
				  <li><a href="#">学科管理</a></li>
				  <li><a href="#">章节管理</a></li>
				  <li><a href="#">学生管理</a></li>
				  <li><a href="#">班级管理</a></li>
				  <li><a href="#">班级成员管理</a></li>
				  <li><a href="#">班级学科管理</a></li>
				  <li><a href="#">考试发布管理</a></li>
				  <li><a href="#">学生成绩查询</a></li>
				  <li><a href="#">班级成绩查询</a></li>
				</ul>
			  </div>
		    </div>
	     </div>
	     <div class="panel panel-teacher">
		     <div class="panel-heading">
			   <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseTwo">
					老师管理
				</a>
			  </h4>
		    </div>
		    <div id="collapseTwo" class="panel-collapse collapse">
			   <div class="panel-body">
				<ul class="nav nav-pills nav-stacked">
				  <li><a href="#">查看试卷</a></li>
				  <li><a href="#">批阅试卷</a></li>
				  <li><a href="#">学生成绩查询</a></li>
				  <li><a href="#">班级成绩查询</a></li>
				  <li><a href="#">试题模块管理</a></li>
				  <li><a href="#">试题管理</a></li>
				</ul>
			   </div>
		    </div>
	       </div>

	      	<div class="panel panel-privil">
		     <div class="panel-heading">
			   <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseThree">
					权限管理
				</a>
			  </h4>
		    </div>
		    <div id="collapseThree" class="panel-collapse collapse">
			   <div class="panel-body">
				<ul class="nav nav-pills nav-stacked">
				  <li><a href="#">用户管理</a></li>
				  <li><a href="#">用户角色管理</a></li>
				  <li><a href="#">用户功能管理</a></li>
				</ul>
			   </div>
		    </div>
	       </div> 
          </div>
<script type="text/javascript">
   $(function () { $('#collapseOne').collapse('toggle')});
   $(function () { $('#collapseTwo').collapse('toggle')});
   $(function () { $('#collapseThree').collapse('toggle')});

</script> 
		</div>
		<div id="right" class="col-md-9 col-sm-9 col-xs-9" style="border-left: 2px solid darkgray;height: 1800px;">
				<h1>管理控制后台</h1>
				
				<div class="input-group">
                    <span class="input-group-addon">查询条件：</span>
                    <input type="text" class="form-control" placeholder="请输入学科名称">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Go!</button>
                    </span>
                </div>
 				<div class="btn-toolbar" role="toolbar" >
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">审批</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-primary">对账</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-success">汇款</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-info">发订单</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-warning">收款通知</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-danger">boss通道</button>
					</div>
				</div>
				<div id="box" style="margin: 30px 0px;">
					<div id="box1" class="col-md-12 col-sm-12 col-xs-24 panel panel-primary">
  					   <div class="panel-heading">学科管理：</div>	
						<table class="table table-bordered">
						    <thead>
                               <tr>
                                   <th>序号</th><th>学科名称</th>
                                   <th>操作
                                     <div class="btn-group" role="group">
						               <button type="button" class="btn btn-default">添加</button>
					                 </div>
                                  </th>
                             </tr>
                            </thead>
                            <tbody>
                              <tr>
                                  <td>1</td><td>C++程序设计</td>
                                  <td>
                                      <div class="btn-group" role="group">
						               <button type="button" class="btn btn-primary">章节管理</button>
					                 </div>
                                     <div class="btn-group" role="group">
						               <button type="button" class="btn btn-warning">修改</button>
					                 </div>
                                     <div class="btn-group" role="group">
						               <button type="button" class="btn btn-danger">删除</button>
					                 </div>
                                   </td>
                             </tr>
                            </tbody>
						</table>
						<button type="button" class="btn btn-success">提交</button>
					</div>
				</div>
			
			</div>
		</div>
	</body>
	<script src="js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/bootstrap.min.js" charset="utf-8"></script>
</html>