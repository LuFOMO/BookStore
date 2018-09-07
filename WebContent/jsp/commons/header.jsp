<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
	String path = request.getContextPath();  
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<script type="text/javascript" src="<%=basePath %>js/base-v1.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.6.4.js" charset="utf-8"></script>
<title>淘淘书城</title>
<meta name="description" content="云阅读提供最丰富正版内容的专业数字阅读和听书平台。现有超过50万种正版数字读物，涵盖电子书、听书、网络文学、漫画等全媒体数字阅读形式。 "/>
<meta name="Keywords" content="云阅读，电子书下载，新书速递，在线阅读，网络文学，听书，畅销书，阅读器"/>

<link href="<%=basePath %>css/taotao.css" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/common.min.css?1513074853243"/>
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/index_new_page.min.css?1513074853243"/>
<link href="http://static.dangdang.com/css/header2012/header_150611.css?20151117" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" />
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<!--shortcut start-->
<jsp:include page="shortcut.jsp" />
<!--shortcut end-->
<div class="public_headersearch_module new" dd_name="头部搜索"
	style="padding-top: 40px;">
	<div class="search_bag clearfix">
		<a href="" class="ddreader_logo"> <img src="<%=basePath %>images/logo.png"
			target="_blank" alt="淘淘云阅读" style="width: 200px;">
		</a>
		<div class="clearfix new_searchbox">
			<div class="new_search">
				<input id="search" type="text" class="new_searchtext" style="font-size:15px"/> <span type="button"
					value="提交" class="new_searchbtn" onclick="searchBooks()">搜索</span>
				<ul class="new_list clearfix" id="content">
				</ul>
			</div>
			<p class="hotword"></p>
		</div>
		<ul class="new_icon">
			<li><a href="<%=basePath %>jsp/cart.jsp" name="购物车"
				dd_name="购物车" class="shoppingCartWrap"><img
					src="<%=basePath %>images/new_car.png" />购物车</a></li>
		</ul>
	</div>
</div>
<!-- <script type="text/javascript">
	var nick_num = 1;
	initHeaderOperate();
</script> -->

<script>
	window.onload = function(){
		//得到搜索框对象
		var searchElement = document.getElementById("search");
		//得到DIV元素
		var div = document.getElementById("content");
		
		searchElement.onkeyup = function(){//给文件框注册按键弹起事件
			//获取文本框的值
			var names = this.value;
			//如果文本框没有数据时，把div隐藏，且不向服务器发送请求
			if(names==""){
				div.style.display="none";
				return;
			} 
			
			$.post("${pageContext.request.contextPath}/searchBookNames",{name: names}, function(data){
				var str = data;//得到服务器返回的数据
				var ss = str.split(",");
				var childDivs = "";
				//循环把数据放入小的div中
				for(var i=0;i<ss.length;i++){
					childDivs+="<li onclick='writeText(this)' onmouseover='changeBackground_over(this)' onmouseout='changeBackground_out(this)'>"+ss[i]+"</li>";//把数组中的每个元素放到div中
				}
				
				div.innerHTML= childDivs;//把多个childDivs（div）放入列表div中
				div.style.display="block";//把列表隐藏
			});
		}
	};

	//鼠标悬浮时，改变背景色
	function changeBackground_over(div){
		div.style.backgroundColor = "gray";
	}
	//鼠标离开时，恢复背景色
	function changeBackground_out(div){
		div.style.backgroundColor = "";
	}
	
	//填充文本到搜索框
	function writeText(div){
		//得到搜索框
		var searchElement = document.getElementById("search");
		searchElement.value = div.innerHTML;//把div中的文本添加到搜索框中
		div.parentNode.style.display="none";//把content的div隐藏
	}

	function searchBooks(){
		var $search = $("#search").val();
		window.location.href = "${pageContext.request.contextPath }/searchBooks?name="+$search;
	}

</script>

<!-- 导航 -->
<div class="public_headernav_module padding_top_10" dd_name="头部导航"
	style="padding-top: 70px;">
	<div class="new_headernav">
		<div class="new_nav">
			<p class="bookclass">图书分类</p>
			<ul class="new_bar nav">
				<li><a href="http://e.dangdang.com/index_page.html"
					target="_blank">电子书</a></li>
				<li class="yuanchuangnav"><a
					href="http://e.dangdang.com/new_original_index_page.html"
					target="_blank">网络文学</a></li>
				<li class="cur"><a href="http://e.dangdang.com/vip_page.html"
					target="_blank">租阅</a><img class="new_hot"
					src="http://img60.ddimg.cn/ddreader/images/hot_logo.png?123" /></li>
				<li><a href="http://book.dangdang.com/20161128_zl3t"
					target="_blank">淘淘阅读器</a></li>
				<li><a href="http://book.dangdang.com/ddapp" target="_blank">淘淘云阅读客户端</a></li>
				<li><a href="http://chuban.dangdang.com/" target="_blank">我要写书</a></li>
			</ul>
			<div class="new_help">
				<p class="left">
					<a href="${pageContext.request.contextPath }/MyAccountServlet" id="readingCenterBtn"><img
						src="<%=basePath %>images/new_per_center.png">个人中心</a>
				</p>
				<p class="want_to_recharge">
					<a href="javascript:;" class="has_logo">我要充值 <img
						src="http://img62.ddimg.cn/ddreader/images/more20.png?123"
						alt="赠送20%"></a>
				</p>
			</div>
		</div>
	</div>
</div>
