<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html> 
<html>
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>谷粒网</title>
<link href="css/base.css" type="text/css" rel="stylesheet">
<link href="css/layout.css" type="text/css" rel="stylesheet">
</head>

<body>
<div class="gl-box">
<div class="filter-wrapper">
	<div class="wapper-nav">筛选</div>
    <ul>
    	<li><span>按时间</span> <input name="" type="text" placeholder="2015-10-10"> 至 <input name="" type="text" placeholder="2015-10-10"></li>
        <li><span>按金额</span> <input name="" type="text" placeholder="2000"> 至 <input name="" type="text" placeholder="3000"></li>
        <li><span>供应商</span> <input name="" type="text" class="supplier-name" placeholder="请输入供应商名称"></li>
    </ul>
</div>
</div>
<div class="footer">
	<div class="filter-footer">
        <a href="#">清除</a> <a href="order.jsp">确定</a>
    </div>
</div>
</body>
</html>