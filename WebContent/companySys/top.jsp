<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.system.pojo.System_power_quickview"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>谷粒管理平台</title>
<style type="text/css">
body{
background: url(../sysimages/top_repeat.gif) repeat;
margin: 0px auto;
}
.title{
	float:left;
	height: 100px;
	width: 200px;
	text-align: center;
}
.title .guliwang{
	font-size: 24px;.
	width: 200px;
	margin-top: 20px;
}
.title .gong{
	font-size: 18px;
	width: 200px;
}
.mokuai{
	float: right;
	width: 650px;
}

.mokuai ul{
	
}

.mokuai ul li{
	list-style: none;
	float: right;
	height: 60px;
	width: 60px;
	font-size: 24px;
	margin-right: 10%;
}
</style>
</head>
<body>
	<div class="title">
		<div class="guliwang">谷粒网</div>
		<div class="gong">供应商后台管理系统</div>
	</div>
	<div class="mokuai">
		<ul>
			<li>系统管理</li>
			<li>合作管理</li>
			<li>客户管理</li>
			<li>商品管理</li>
			<li onclick="">订单管理</li>
		</ul>
	</div>
</body>
</html>