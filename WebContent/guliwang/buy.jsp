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
	<div class="jiesuan">
    	<div class="wapper-nav">结算</div>
    	<div class="shouhuo-wrap">
        	<a href="address.jsp"><span>收货人：王金宝 13888888888</span><span class="add">收货地址: 嘉兴市沿海向城东路89号706室</span></a>
        </div>
        <div class="jiesuan-info">
        	<h1>结算信息</h1>
        	<ul>
            	<li>供应商: <font class="font-grey">天然粮油有限公司</font> <br>订单金额: <font class="font-oringe">600元</font></li>
                <li>供应商: <font class="font-grey">天然粮油有限公司</font> <br>订单金额: <font class="font-oringe">600元</font></li>
            </ul>
        </div>
        <div class="jiesuan-info">
        	<h1>支付方式</h1>
        	<div class="payment">
            	<span>
                    <input type="radio" id="radio-1-1" name="radio-1-set" class="regular-radio" checked />
                    <label for="radio-1-1">微信支付</label>
                </span>
                <span>
                    <input type="radio" id="radio-1-2" name="radio-1-set" class="regular-radio" />
                    <label for="radio-1-2">货到付款</label>
                </span>
            </div>
        </div>
    </div>
</div>
<div class="footer">
	<div class="jiesuan-foot-info">合计金额: 1400.00元 </div><a href="全部订单.html" class="jiesuan-button">提交</a>
</div>
</body>
</html>
