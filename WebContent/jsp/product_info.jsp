<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
	//图片基础路径
	String urlBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/BookStoreManager/upload/";
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
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="<%=basePath %>jsp/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath}/pageServlet?category=${book.category }">&nbsp;${book.category }</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${book.name }
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td><img src="<%=basePath %>ad/page_ad.jpg" width="645" height="84" />
								<table width="100%%" border="0" cellspacing="0">
									<tr>
										<td width="30%">
											<div class="divbookcover">
												<p>
													<img src="<%=urlBasePath %>${book.img_url }"
														width="213" height="269" border="0" />
												</p>
											</div>
											<div style="text-align:center; margin-top:25px">
												<a href="${pageContext.request.contextPath }/addCartServlet?id=${book.id }">
													<img src="<%=basePath %>images/buybutton.gif" border="0" /> 
												</a>
											</div></td>
										<td style="padding:20px 5px 5px 5px"><img
											src="#" width="16" height="13" />
											<font class="bookname">&nbsp;&nbsp;${book.name }</font>

											<hr />售价：<font color="#FF0000">￥${book.price }</font>
											<hr /> 类别：${book.category }
											<hr />
											<p>
												<b>内容简介：</b>
											</p> ${book.description }</td>
									</tr>
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
