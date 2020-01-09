<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
   <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="myModalLabel">${user.username}&nbsp;用户权限分配</h4>
   </div>
   <form action="${pageContext.request.contextPath}/manage/PrivilegeServlet/saveGrantUser" method="post">
   <div class="modal-body">
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
   </div>
   <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
         <button type="button" class="btn btn-primary">提交更改</button>
   </div>
   </form>
