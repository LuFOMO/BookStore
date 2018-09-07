<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%  
	String path = request.getContextPath();  
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线支付</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

<style>
    #pay-all-div{
        background:white;
        margin-top: 40px;
        padding: 20px;
    }
    .choose-style{
        border: 1px solid #66afe9;
        outline: 0;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102,175,233,.6);
    }
</style>
<script>
    $(document).ready(function(){
        $(".pay-style-div").click(function(){
            $(this).addClass("choose-style").siblings('.pay-style-div').removeClass('choose-style');
        });
    });
</script>
</head>
<body style="background:#F2F4F3;">
<div id="pay-all-div" class="container text-center">
        <form action="${pageContext.request.contextPath }/payOnlineServlet" class="form-inline"  method="post">
           <label>订单号：</label> <INPUT TYPE="text" style="margin-bottom:10px;" class="form-control" NAME="orderid" value="${orderid }">
            <br><label>支付金额：</label> <INPUT
                TYPE="text" NAME="money" class="form-control" value="0.01"> 元
                <hr style="margin:10px 0;">
            <div class="divBank">
                <h3 class="divText">选择网上银行</h3>
                <div>
                    <div style="margin-bottom: 20px;">
                            <div class="col-sm-4 pay-style-div" >
                                    <img src="<%=basePath %>images/zfb.png" class="col-md-4" style="width:80%;" alt="支付宝">
                            </div>
                            <div class="col-sm-4 pay-style-div" >
                                    <img src="<%=basePath %>images/weixin.png" class="col-md-4" style="width:80%;" alt="支付宝">
                            </div>
                            <div class="col-sm-4 pay-style-div" >
                                    <img src="<%=basePath %>images/yinlian.png" class="col-md-4" style="width:80%;" alt="支付宝">
                            </div>
                          
                    </div>
                   <hr class="col-sm-12"/>
                <div class="col-sm-12" style="margin-top: 30px;">
                    <INPUT TYPE="submit" class="btn btn-success" value="确定支付">
                </div>
            </div>
</div>


</form>
</body>
</html>
