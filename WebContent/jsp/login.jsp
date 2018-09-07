<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>淘淘书城登录页面</title>
<link rel="stylesheet" href="<%=basePath %>css/main.css" type="text/css" />
</head>
<body class="main">

	<div id="divcontent" style="background:#82D9E2; margin-top:40px;">
		<form action="${pageContext.request.contextPath }/user?method=login" method="post">
		
			<table width="900px"  border="0" cellspacing="0">
				<tr>
					<td style="padding:30px"><div style="height:470px" >
							<h4><b>首页 >> 个人用户登录</b></h4>
							<div>
								<table width="85%" border="0" cellspacing="0">
									<tr>
										<td>
											<div id="logindiv" style="background:#fff;">
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td style="text-align:center; padding-top:20px"><img
															src="<%=basePath %>images/logintitle.gif" width="150" height="30" />
														</td>
													</tr>
													<tr>
														<td style="text-align:center;padding-top:20px;"><font
															color="#ff0000">${requestScope["user_msg"]}</font>
														</td>
													</tr>
													<tr>
														<td style="text-align:center">
															<table width="80%" border="0" cellspacing="0"
																style="margin-top:15px ;margin-left:auto; margin-right:auto">
																<tr>
																	<td
																		style="text-align:right; padding:5px; width:25%"><h5>用户名：</h5></td>
																	<td style="text-align:left"><input name="username"
																		type="text" class="textinput input-style" />
																	</td>
																</tr>
																<tr>
																	<td style="text-align:right; padding-top:5px"><h5>密&nbsp;&nbsp;&nbsp;&nbsp;码：</h5></td>
																	<td style="text-align:left"><input name="password"
																		type="password" class="textinput" />
																	</td>
																</tr>
																<tr>
																	<td colspan="2" style="text-align:center"><input
																		type="checkbox" name="checkbox" value="checkbox" />
																		记住用户名&nbsp;&nbsp;<input type="checkbox"
																		name="checkbox" value="checkbox" /> 自动登录</td>
																</tr>
																<tr>
																<%-- src="<%=basePath %>images/loginbutton.gif"  --%>
																	<td colspan="2"
																		style="padding-top:10px; text-align:center"><input style="width:80px; margin: 10px 0;"
																		name="image" type="submit" class="mybtn btn-green" value=" 登 录 " onclick="return formcheck()"
																		width="83" height="22" />
																	</td>
																</tr>

																<tr>
																	<td colspan="2" style="padding-top:10px"><img
																		src="<%=basePath %>images/loginline.gif" width="241" height="10" />
																	</td>
																</tr>
																<tr>
																	<td colspan="2"
																		style="padding-top:10px; text-align:center"><a
																		href="register.jsp" class="mybtn btn-yellow">注册新用户
																	</a></td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</div></td>
										<td style="text-align:left; padding-top:30px; width:60%"><h1 >您还没有注册？</h1><br><br>
											<h5>注册新会员，享受更优惠价格!</h5>
											<h5>千种图书，供你挑选！注册即享受丰富折扣和优惠，便宜有好货！超过万本图书任您选。</h5>
											<h5>超人气社区！精彩活动每一天。买卖更安心！支付宝交易超安全。</h5>
											<h5 style="text-align:right">
												<a href="register.jsp" class="mybtn btn-yellow">注册新用户</a>
											</h5>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<jsp:include page="foot.jsp" />

</body>
</html>
