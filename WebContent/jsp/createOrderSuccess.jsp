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
<script type="text/javascript" src="<%=basePath %>js/my.js">
</script>
</head>
<body class="main" onload="startSecond();">

<!--head start-->
	<jsp:include page="head.jsp" />
<!--head end-->
	
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center"><table width="60%"
						border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98"><img
								src="<%=basePath %>images/IconTexto_WebDev_009.jpg" width="128" height="128" />
							</td>
							<td style="padding-top:30px"><font
								style="font-weight:bold; color:#FF0000">订单生成成功</font><br /> <br />
								<a href="index.html"><span id="second">5</span>秒后自动为您转跳回首页</a></td>
						</tr>
					</table>
					<h1>&nbsp;</h1>
				</td>
			</tr>
		</table>
	</div>

	<jsp:include page="foot.jsp" />

</body>
</html>
