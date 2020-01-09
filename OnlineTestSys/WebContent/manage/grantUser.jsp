<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/manage/header.jsp"%>
    <h1>${user.username}&nbsp;用户权限分配</h1>
    <form action="${pageContext.request.contextPath}/manage/PrivilegeServlet/saveGrantUser" method="post">
    	<input type="hidden" name="userId" value="${user.id}"/>
	 	<table width="438">
	 		<tr>
	 			<td>
	 				该用户已分配的角色：<br/>
	 				<div style="border: 1px solid">
	 					<c:if test="${empty user.roleList}">没有分配任何角色</c:if>
	 					<c:if test="${!empty user.roleList}">
	 						<c:forEach items="${user.roleList}" var="r">
	 							*&nbsp;${r.name}<br/>
	 						</c:forEach>
	 					</c:if>
	 				</div>
	 			</td>
	 			<td>
	 			    　　系统全部角色：
	 				<div style="border: 1px solid">
	 					<c:forEach items="${roles}" var="r">
	 						<input type="checkbox" name="roleId" value="${r.id}"/>${r.name}<br/>
	 					</c:forEach>
	 				</div>
	 			</td>
	 		</tr>
	 	</table>
	    <input type="submit" value="保存"/>
    </form>
  </body>
</html>
