<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>淘淘书城</title>
<link rel="stylesheet" href="<%=basePath %>css/main.css" type="text/css" />
</head>
<body class="main">

<!--head start-->
	<jsp:include page="head.jsp" />
<!--head end-->

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%"><table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd"><img src="<%=basePath %>images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath }/user?method=findUser&id=${user.id}">用户信息修改</a></td>
						</tr>

						<tr>
							<td class="listtd"><img src="<%=basePath %>images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/findOrderByUserIdServlet">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd"><img src="<%=basePath %>images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/user?method=logout">用戶退出</a>
							</td>
						</tr>
					</table></td>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="<%=basePath %>jsp/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="<%=basePath %>jsp/myAccount.jsp">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;欢迎
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p>
									<img src="<%=basePath %>ad/myad.jpg" width="631" height="436" />
								</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<jsp:include page="foot.jsp" />


</body>
</html>
