<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<div id="shortcut-2013">
	<div class="w">
		<ul class="fl lh">
			<li class="fore1 ld" clstag="homepage|keycount|home2013|01a"><b></b>
			<a href="javascript:addToFavorite()" rel="nofollow">收藏淘淘</a></li>
		</ul>
		<ul class="fr lh">
			<li class="fore1" id="loginbar" clstag="homepage|keycount|home2013|01b"><%-- ${user.username } --%>您好！欢迎来到淘淘！
			<%
				if(session.getAttribute("user") == null){
			%>
			<a id="login-a"  href="${pageContext.request.contextPath }/MyAccountServlet">[登录]</a>&nbsp;<a id="register-a" href="register.jsp">[免费注册]</a>
			
			<%
				}else{
					%>
					<span id="user-name-span" style="display:none;"><%=session.getAttribute("user").toString() %></span>
					<%
				}
			%>
			 </li>
			<li class="fore2 ld" clstag="homepage|keycount|home2013|01c">
				<a href="${pageContext.request.contextPath }/findOrderByUserIdServlet" rel="nofollow">我的订单</a>
			</li>
		</ul>
		<span class="clr"></span>
	</div>
</div>