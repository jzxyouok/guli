<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
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
	<div class="home-search-wrapper">
        <span class="citydrop">酱油 <em><img src="images/dropbg.png" ></em></span>
        <div class="menu">
            <div class="menu-tags home-city-drop">
                <div class="fenlei-tit">食材谱</div>
                <div class="wrapper">
                	<div class="fenlei-left">
                    	<ul>
                        	<li><a href="#">食用油</a></li>
                            <li><a href="#">食用油</a></li>
                            <li class="active"><a href="#">食用油</a></li>
                            <li><a href="#">食用油</a></li>
                            <li><a href="#">食用油</a></li>
                        </ul>
                    </div>
                    <div class="fenlei-right">
                    	<a href="#">豆油</a>
                        <a href="#">菜籽油</a>
                        <a href="#">豆油</a>
                        <a href="#">菜籽油</a>
                        <a href="#">豆油</a>
                        <a href="#">菜籽油</a>
                        <a href="#">豆油</a>
                        <a href="#">菜籽油</a>
                    </div>
                </div>
            </div>
        </div>
        <input type="text" placeholder="请输入食材名称" />
        <a href="cart.jsp" class="gwc"><img src="images/gwc.png" ></a>
    </div>
    <div class="goods-wrapper">
        <ul class="home-hot-commodity">
      	    <li>
            	<span class="fl"><img src="images/pic1.jpg" ></span> 
                <h1>冬菇一品鲜 <span>（240ml*12瓶/箱）</span></h1>
                <div class="block"> 
                	<span>
                        <input type="radio" id="radio-1-5" name="radio-3-set" class="regular-radio" checked />
                        <label for="radio-1-5">单品价:<font class="font-oringe">￥5.00</font>/瓶</label>
                    </span>
                    <span>
                        <input type="radio" id="radio-1-6" name="radio-3-set" class="regular-radio" />
                        <label for="radio-1-6">套装价:<font class="font-oringe">￥60.00</font>/箱</label>
                    </span>
                </div>
                <div class="stock-num">
                    <span id="min" class="jian min">-</span>
                    <input class="text_box shuliang" name="danpin" type="text" value="0"> 
                    <span id="add" class="jia add">+</span>
                    
                    <span hidden="ture" class="jian min">-</span>
                    <input hidden="ture" class="text_box shuliang" name="taozhuan" type="text" value="0"> 
                    <span hidden="ture" class="jia add">+</span>
                    
                    <input type="checkbox" id="checkbox_a3" class="chk_1">
               		<label for="checkbox_a3"></label>
                </div>
            </li>
            <li>
            	<span class="fl"><img src="images/pic1.jpg" ></span> 
                <h1>冬菇一品鲜 <span>（240ml*12瓶/箱）</span></h1>
                <div class="block"> 
                	<span>
                        <input type="radio" id="1radio1" name="1radio" class="regular-radio" checked />
                        <label for="1radio1">单品价:<font class="font-oringe">￥5.00</font>/瓶</label>
                    </span>
                    <span>
                        <input type="radio" id="1radio2" name="1radio" class="regular-radio" />
                        <label for="1radio2">套装价:<font class="font-oringe">￥60.00</font>/箱</label>
                    </span>
                </div>
                <div class="stock-num">
                    <span class="jian min">-</span>
                    <input class="text_box shuliang" name="danpin" type="text" value="0"> 
                    <span class="jia add">+</span>
                    
                    <span hidden="ture" class="jian min">-</span>
                    <input hidden="ture" class="text_box shuliang" name="taozhuan" type="text" value="0"> 
                    <span hidden="ture" class="jia add">+</span>
                    
                    <input type="checkbox" id="1checkbox" class="chk_1">
               		<label for="1checkbox"></label>
                </div>
            </li>
        </ul>
    </div>


<div class="personal-center-nav">
    <ul>
        	<li><a href="index.jsp"><em class="ion-home"></em>首页</a></li>
            <li class="active"><a href="goods.jsp"><em class="ion-bag"></em>商城</a></li>
            <li><a href="order.jsp"><em class="ion-clipboard"></em>订单</a></li>
            <li><a href="mine.jsp"><em class="ion-android-person"></em>我的</a></li>
    </ul>
</div>
</div>

<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/jquery-dropdown.js"></script>
<script> 
var basePath = '<%=basePath%>';
$(function(){ 
	if(!window.localStorage.getItem("totalnum")){
		window.localStorage.setItem("totalnum",0);
	}
	if(!window.localStorage.getItem("totalmoney")){
		window.localStorage.setItem("totalmoney",0);
	}
	getJson(basePath+"GoodsviewAction.do",{method:"mselQuery"},initDishes,null);
})
function initDishes(data){
     $(".home-hot-commodity").html("");
 	 $.each(data.root, function(i, item) {
 		$(".home-hot-commodity").append('<li>'+
 	         	'<span class="fl"><img src="images/pic1.jpg" ></span> '+
 	             '<h1>'+item.goodsname+'<span>('+item.goodsunits+')</span></h1>'+
 	           '  <div class="block"> '+
 	             	'<span>'+
 	                 '    <input type="radio" id="'+item.goodsid+'radio1" name="'+item.goodsid+'radio" class="regular-radio" checked />'+
 	                 '    <label for="'+item.goodsid+'radio1">单品价:<font class="font-oringe">￥'+item.pricesprice+'</font>/'+item.pricesunit+'</label>'+
 	               '  </span>'+
 	               '  <span>'+
 	                   '  <input type="radio" id="'+item.goodsid+'radio2" name="'+item.goodsid+'radio" class="regular-radio" />'+
 	               '      <label for="'+item.goodsid+'radio2">套装价:<font class="font-oringe">￥'+item.pricesprice2+'</font>/'+item.pricesunit2+'</label>'+
 	               '  </span>'+
 	            ' </div>'+
 	           '  <div class="stock-num" name="'+item.goodsid+'">'+
 	                ' <span class="jian min" onclick="subnum(this,'+item.pricesprice
					   +')">-</span>'+
 	                 '<input class="text_box shuliang" name="danpin" type="text" value="'+
 	                 getcurrennumdanpin(item.goodsid)+'"> '+
 	                ' <span class="jia add" onclick="addnum(this,'+item.pricesprice
					   +',\''+item.goodsname+'\',\''+item.pricesunit+'\',\''+item.goodsunits
					   +'\')">+</span>'+
 	               '  <span hidden="ture" class="jian min" onclick="subnum(this,'+item.pricesprice2
				   +')">-</span>'+
 	                ' <input hidden="ture" class="text_box shuliang" name="taozhuan" type="text" value="'+
 	                getcurrennumtaozhuan(item.goodsid)+'"> '+
 	                ' <span hidden="ture" class="jia add" onclick="addnum(this,'+item.pricesprice2
					   +',\''+item.goodsname+'\',\''+item.pricesunit2+'\',\''+item.goodsunits
					   +'\')">+</span>'+
 	                ' <input type="checkbox" id="'+item.goodsid+'checkbox" class="chk_1">'+
 	            		'<label for="'+item.goodsid+'checkbox"></label>'+
 	             '</div>'+
 	         '</li>');
     });
 	$(".regular-radio").change(function(){ 
		var t = $(this).parent().parent().next().find('input[name*=danpin]');
		t.toggle();
		t.prev().toggle();
		t.next().toggle();
		var t2 = $(this).parent().parent().next().find('input[name*=taozhuan]');
		t2.toggle();
		t2.prev().toggle();
		t2.next().toggle();
	})
}
function getcurrennumdanpin(dishesid){
	//订单
	if(window.localStorage.getItem("sdishes")==null){
		return 0;
	}else{
		var orderdetnum = 0;
		var sdishes = JSON.parse(window.localStorage.getItem("sdishes"));
		$.each(sdishes, function(i, item) {
			if(item.goodsid==dishesid
					&&item.goodsdetail=="danpin"){
				orderdetnum = item.orderdetnum;
				return false;
			}
		});
		return orderdetnum;
	}
}
function getcurrennumtaozhuan(dishesid){
	//订单
	if(window.localStorage.getItem("sdishes")==null){
		return 0;
	}else{
		var orderdetnum = 0;
		var sdishes = JSON.parse(window.localStorage.getItem("sdishes"));
		$.each(sdishes, function(i, item) {
			if(item.goodsid==dishesid
					&&item.goodsdetail=="taozhuan"){
				orderdetnum = item.orderdetnum;
				return false;
			}
		});
		return orderdetnum;
	}
}
function addnum(obj,pricesprice,goodsname,pricesunit,goodsunits){
	//总价
	var tmoney = parseFloat(window.localStorage.getItem("totalmoney"));
	var newtmoney = (tmoney+pricesprice).toFixed(2);
	window.localStorage.setItem("totalmoney",newtmoney);
	//数量
	var numt = $(obj).prev(); 
	var num = parseInt(numt.val());
	numt.val(num+1);
	//订单
	if(window.localStorage.getItem("sdishes")==null){
		window.localStorage.setItem("sdishes","[]");
	}
	var sdishes = JSON.parse(window.localStorage.getItem("sdishes"));
	if(num == 0){
		//新增订单
		var mdishes = new Object();
		mdishes.goodsid = $(obj).parent().attr('name');
		mdishes.goodsdetail = $(obj).prev().attr('name');
		mdishes.pricesprice = pricesprice;
		mdishes.pricesunit = pricesunit;
		mdishes.goodsname = goodsname;
		mdishes.goodsunits = goodsunits;
		mdishes.orderdetnum = num + 1;
		sdishes.push(mdishes);
		//种类数
		var tnum = parseInt(window.localStorage.getItem("totalnum"));
		window.localStorage.setItem("totalnum",tnum+1);
	}else{
		//修改订单
		$.each(sdishes, function(i, item) {
			if(item.goodsid==$(obj).parent().attr('name')
					&&item.goodsdetail==$(obj).prev().attr('name')){
				item.orderdetnum = item.orderdetnum + 1;
				return false;
			}
		});
	}
	window.localStorage.setItem("sdishes",JSON.stringify(sdishes));
}
function subnum(obj,pricesprice){
	var numt = $(obj).next(); 
	var num = parseInt(numt.val());
	if(num > 0){
		//总价
		var tmoney = parseFloat(window.localStorage.getItem("totalmoney"));
		var newtmoney = (tmoney-pricesprice).toFixed(2);
		window.localStorage.setItem("totalmoney",newtmoney);
		//数量
		numt.val(num-1);
		//订单
		var sdishes = JSON.parse(window.localStorage.getItem("sdishes"));
		if(num == 1){
			//删除订单
			$.each(sdishes,function(i,item){
				if(item.goodsid==$(obj).parent().attr('name')){
					sdishes.splice(i,1);
					return false;
				};
			});
			//种类数
			var tnum = parseInt(window.localStorage.getItem("totalnum"));
			window.localStorage.setItem("totalnum",tnum-1);
		}else{
			//修改订单
			$.each(sdishes, function(i, item) {
				if(item.goodsid==$(obj).parent().attr('name')
						&&item.goodsdetail==$(obj).next().attr('name')){
					item.orderdetnum = item.orderdetnum - 1;
					return false;
				}
			});
		}
		window.localStorage.setItem("sdishes",JSON.stringify(sdishes));
	}
}
function testJsonp(data){
	//console.log(data);
}

function callbackparam(data){
	//console.log(data);
}

function successCB(r, cb) {
	cb && cb(r);
}

function getJson(url, param, sCallback, fCallBack) {
	try
	{
		$.ajax({
			url: url,
			data: param,
			dataType:"json",
			success: function(r) {
				successCB(r, sCallback);
				successCB(r, fCallBack);
			},
			error:function(r) {
				var resp = eval(r); 
				alert(resp.msg);
			}
		});
	}
	catch (ex)
	{
		alert(ex);
	}
}
</script> 
</body>
</html>