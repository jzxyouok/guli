<%@page import="com.server.pojo.entity.Customer"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>

<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style"
	content="black-translucent">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="pragma" content="no-cache">  
<meta http-equiv="cache-control" content="no-cache">  
<meta http-equiv="expires" content="0">  
<title>谷粒网</title>
<link href="css/base.css" type="text/css" rel="stylesheet">
<link href="css/layout.css" type="text/css" rel="stylesheet">
<style type="text/css">
input {
	float: left;
	
  -webkit-appearance: none; /* remove default */
  display: block;
  margin: 38px 10px 10px 10px;
  width: 26px;
  height: 26px;
  border-radius: 13px;
  cursor: pointer;
  vertical-align: middle;
  box-shadow: inset hsla(0,0%,0%,1) 0 0 0 1px;
  background-color: white;
  background-repeat: no-repeat;
}



/* The up/down direction logic */

input:checked {
	box-shadow: none;
  background: url(images/price-rd.png) no-repeat;
  background-size: 24px 24px;
}
#cwn_a_xiadan{
	right: 16%;
}
</style>
</head>

<body>
	<form action="delCollect.action" method="post">
	<div class="gl-box">
		<div class="wapper-nav"><a onclick="javascript:window.history.go(-1)" class='goback'></a>
	我的收藏<a id="cwn_a_xiadan" onclick="xiadan()">下单</a><a id="cwn_a_bianji" onclick="editToDel()">编辑</a></div>
		</div>
		<div class="shoucang-wrap">
			<ul>
			</ul>
		</div>
	</form>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery-dropdown.js"></script>
<script type="text/javascript">
var customer = JSON.parse(window.localStorage.getItem("customeremp"));
$(function(){
	$.post("cusCollectInfoEmp.action",{"comid":customer.customerid,"pricesclass":customer.customertype},function(data){
		if(typeof(data.collectList) != 'undefined'){
			$.each(data.collectList,function(i,item){
				var jsonitem = JSON.stringify(item.goods);
				$(".shoucang-wrap ul").append(
					'<li name="'+item.collectid+'"><span hidden="true">'+jsonitem+'</span>'+
					'<a name="'+item.goods.goodsid+'" ><span class="fl">'+
					'<img src="../'+item.goods.goodsimage+'" alt="" onerror="javascript:this.src=\'images/default.jpg\'"/></span>'+
						'<h1>'+item.goods.goodsname+'<span>（'+item.goods.goodsunits+'）</span>'+
							'</h1>'+
							'<p>'+
										'<font>&nbsp;</font>'+
									'</p>'+
									'<p>'+
										'<font>&nbsp;</font>'+
									'</p>'+
						'</a>'+
					'</li>');
			})
		} else {
			window.location.href = 'collectnothing.html';
		}
	});
})
	//下单
	function xiadan(){
		$("#cwn_a_xiadan").text("确定");
		$("#cwn_a_bianji").text("取消");
		$("#cwn_a_xiadan").attr("onclick","collectDoCart()");
		$("#cwn_a_bianji").attr("onclick","cancel()");
		$.each($("li"),function(i,item){
			$(item).prepend("<input type='checkbox' value='"+$(item).attr("name")+"' name='collectids'>");
		})
	}
	//取消
	function cancel(){
		$("li input").remove();
		$(".wapper-nav").html('<a onclick="javascript:window.history.go(-1)" class="goback"></a>'+
				'我的收藏<a id="cwn_a_xiadan" onclick="xiadan()">下单</a><a id="cwn_a_bianji" onclick="editToDel()">编辑</a>');
	}
	//加入购物车
	function collectDoCart(){
		
		var goods = JSON.parse('[]');
		$.each($("[type='checkbox']"),function(i,item){
			if(item.checked){
				goods.push(JSON.parse($(item).next().text()));
			}
		})
		if(parseInt(goods.length) >0){
			$.each(goods,function(i,item){
				if (window.localStorage.getItem("sdishes") == null || window.localStorage.getItem("sdishes") == "[]") {				//判断有没有购物车
					//没有购物车
					window.localStorage.setItem("sdishes", "[]");						//创建一个购物车
					var sdishes = JSON.parse(window.localStorage.getItem("sdishes")); 	//将缓存中的sdishes(字符串)转换为json对象
					//新增订单
					var mdishes = new Object();
					mdishes.goodsid = item.goodsid;
					mdishes.goodsdetail = item.goodsdetail;
					mdishes.goodscompany = item.goodscompany;
					mdishes.companyshop = item.goodsCompany.companyshop;
					mdishes.companydetail = item.goodsCompany.companydetail;
					mdishes.goodsclassname = item.goodsclass;
					mdishes.goodscode = item.goodscode;
					mdishes.pricesprice = item.pricesList[0].pricesprice;
					mdishes.pricesunit = item.pricesList[0].pricesunit;
					mdishes.goodsname = item.goodsname;
					mdishes.goodsimage = item.goodsimage;
					mdishes.orderdtype = '商品';
					mdishes.timegoodsnum = item.goodsnum;
					mdishes.goodsunits = item.goodsunits;
					mdishes.orderdetnum = 1;
					sdishes.push(mdishes); 											//往json对象中添加一个新的元素(订单)
					window.localStorage.setItem("sdishes", JSON.stringify(sdishes));
					
					window.localStorage.setItem("totalnum", 1); 					//设置缓存中的种类数量等于一 
					window.localStorage.setItem("totalmoney", item.pricesList[0].pricesprice);	//总金额等于商品价
					var cartnum = parseInt(window.localStorage.getItem("cartnum"));
					window.localStorage.setItem("cartnum",cartnum+1);
				} else {
					
					//有购物车
					var sdishes = JSON.parse(window.localStorage.getItem("sdishes"));	//将缓存中的sdishes(字符串)转换为json对象
					var tnum = parseInt(window.localStorage.getItem("totalnum"));		//取出商品的总类数
					$.each(sdishes,function(j,item1) {								//遍历购物车中的商品
						//i是增量,item是迭代出来的元素.i从0开始
						if( item1.goodsid == item.goodsid){
							//如果商品id相同
							return false;
						} else if(j == (tnum-1)){
							//如果最后一次进入时goodsid不相同
							//新增订单
							var mdishes = new Object();
							mdishes.goodsid = item.goodsid;
							mdishes.goodsdetail = item.goodsdetail;
							mdishes.goodscompany = item.goodscompany;
							mdishes.companyshop = item.goodsCompany.companyshop;
							mdishes.companydetail = item.goodsCompany.companydetail;
							mdishes.goodsclassname = item.goodsclass;
							mdishes.goodscode = item.goodscode;
							mdishes.pricesprice = item.pricesList[0].pricesprice;
							mdishes.pricesunit = item.pricesList[0].pricesunit;
							mdishes.goodsname = item.goodsname;
							mdishes.goodsimage = item.goodsimage;
							mdishes.orderdtype = '商品';
							mdishes.timegoodsnum = item.goodsnum;
							mdishes.goodsunits = item.goodsunits;
							mdishes.orderdetnum = 1;
							sdishes.push(mdishes); 												//往json对象中添加一个新的元素(订单)
							window.localStorage.setItem("sdishes", JSON.stringify(sdishes));
							window.localStorage.setItem("totalnum", tnum + 1);					//商品种类数加一
							var tmoney = parseFloat(window.localStorage.getItem("totalmoney")); //从缓存中取出总金额
							var newtmoney = (tmoney+parseFloat(item.pricesList[0].pricesprice)).toFixed(2);
							window.localStorage.setItem("totalmoney",newtmoney);	
							var cartnum = parseInt(window.localStorage.getItem("cartnum"));
							window.localStorage.setItem("cartnum",cartnum+1);
						}	
					})
				}
			})
			window.location.href = "cart.jsp";
		} else {
			cancel();
		}
	}
	//修改
	function editToDel(){
		$("#cwn_a_xiadan").text("删除");
		$("#cwn_a_bianji").text("取消");
		$("#cwn_a_xiadan").attr("onclick","delCollects()");
		$("#cwn_a_bianji").attr("onclick","cancel()");
		$.each($("li"),function(i,item){
			$(item).prepend("<input style='background-color:whit;' type='checkbox' value='"+$(item).attr("name")+"' name='collectids'>");
		})
	}
	//删除收藏
	function delCollects(){
		var collectids = '';
		$.each($("[type='checkbox']"),function(i,item){
			if(item.checked){
				collectids += $(item).val()+',';
			}
		});
		if(collectids.length > 0){
			$.post("delCollectEmp.action",{"collectids":collectids},function(data){
				if(data == 'no'){
					alert("删除失败!");
				}
				window.location.reload();
			});
		} else {
			cancel();
		}
	}
</script>
</body>

</html>
