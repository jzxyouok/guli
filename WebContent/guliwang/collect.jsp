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
  width: 24px;
  height: 24px;
  border-radius: 12px;
  cursor: pointer;
  vertical-align: middle;
  box-shadow: hsla(0,0%,100%,.15) 0 1px 1px, inset hsla(0,0%,0%,.5) 0 0 0 1px;
  background-color: white;
  background-image: -webkit-radial-gradient( red 0%, red 15%, red 28%, hsla(200,100%,30%,0) 70% );
  background-repeat: no-repeat;
  -webkit-transition: background-position .15s cubic-bezier(.8, 0, 1, 1),
    -webkit-transform .25s cubic-bezier(.8, 0, 1, 1);
}
input:checked {
  -webkit-transition: background-position .2s .15s cubic-bezier(0, 0, .2, 1),
    -webkit-transform .25s cubic-bezier(0, 0, .2, 1);
}
input:active {
  -webkit-transform: scale(1.5);
  -webkit-transition: -webkit-transform .1s cubic-bezier(0, 0, .2, 1);
}



/* The up/down direction logic */

input,
input:active {
  background-position: 0 24px;
}
input:checked {
  background-position: 0 0;
}
input:checked ~ input,
input:checked ~ input:active {
  background-position: 0 -24px;
}
</style>
</head>

<body>
	<form action="delCollect.action" method="post">
	<div class="gl-box">
		<div class="wapper-nav"><a href='mine.jsp' class='goback'></a>
	我的收藏<a onclick="editToDel()">编辑</a></div>
		</div>
		<input type="hidden" value="${requestScope.customerCollect.customerid }" name="comid"/>
		<div class="shoucang-wrap">
			<ul>
				<c:forEach items="${requestScope.customerCollect.collectList }" var="collect">
					<li name="${collect.collectid }"><a href="goods.jsp?searchdishes=${collect.goods.goodscode }"><span class="fl">
					<img src="../${collect.goods.goodsimage }" alt="" onerror="javascript:this.src='images/default.jpg'"/></span>
						<h1>${collect.goods.goodsname }<span>（${collect.goods.goodsunits }）</span>
							</h1>
							<p>
										<font>&nbsp;</font>
									</p>
									<p>
										<font>&nbsp;</font>
									</p>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</form>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery-dropdown.js"></script>
<script type="text/javascript">
	function editToDel(){
		$(".wapper-nav").html("<a href='mine.jsp' class='goback'></a>"+
				"我的收藏<a onclick='delCollects()'>删除</a>");
		
		$.each($("li"),function(i,item){
			$(item).prepend("<input style='background-color:whit;' type='checkbox' value='"+$(item).attr("name")+"' name='collectids'>");
		})
	}
	
	function delCollects(){
		$.each($("[type='checkbox']"),function(i,item){
			if(item.checked){
				document.forms[0].submit(); 
			}
		})
		$(".wapper-nav").html("<a href='mine.jsp' class='goback'></a>"+
				"我的收藏<a onclick='editToDel()'>编辑</a>");
		$("li input").remove();
	}
</script>
</body>

</html>
