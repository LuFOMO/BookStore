<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
								href="${pageContext.request.contextPath }/user?method=findUser&id=${user.id}">用户信息修改</a>
							</td>
						</tr>

						<tr>
							<td class="listtd"><img src="<%=basePath %>images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/findOrderByUserIdServlet">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd"><img src="<%=basePath %>images/miniicon.gif" width="9"
								height="6" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath }/user?method=logout">用戶退出</a></td>
						</tr>
					</table>
				</td>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="<%=basePath %>jsp/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="<%=basePath %>jsp/myAccount.jsp">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单查询
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p>欢迎&nbsp;&nbsp;${user.username }&nbsp;&nbsp;</font>光临商城！</p>
								<p>
									您有<font style="color:#FF0000">${count }</font>个订单
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#A3E6DF" class="tableopentd01">订单号</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">收件人</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">订单时间</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">状态</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
									</tr>
								<c:set var="count" value="0"></c:set>
								<c:forEach items="${order }" var="order" varStatus="vs">
									<tr>
										<td class="tableopentd02">${vs.count }</td>
										<td class="tableopentd02">${order.receiverName }</td>
										<td class="tableopentd02">${order.ordertime }</td>
										<td class="tableopentd02">${order.paystate==0?"未支付":"已支付" }</td>
										<td class="tableopentd03"><a href="${pageContext.request.contextPath }/findOrderItemsByOrderId?orderid=${order.id }">查看</a>&nbsp;&nbsp;
											<a href="#">刪除</a>
										</td>
									</tr>
									<c:set var="count" value="${vs.count }"></c:set>
								</c:forEach>
								</table>
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
