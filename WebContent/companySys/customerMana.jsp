<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String customertype = request.getParameter("customer.customertype");
%>

<!DOCTYPE>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../sysjs/jquery.min.js"></script>
<link href="css/tabsty.css" rel="stylesheet" type="text/css">

</head>
<body>
<form action="allCustomer.action" method="post" id="main_form">
<input type="hidden" name="ccustomercompany" value="${requestScope.ccustomerCon.ccustomercompany }">
<input type="hidden" name="customer.customertype" value="${requestScope.ccustomerCon.customer.customertype }">
<div class="nowposition">当前位置：客户管理》全部客户</div>
<div class="navigation">
查询条件:&nbsp;&nbsp;<input type="text" id="customercode" name="customer.customercode" value="${requestScope.ccustomerCon.customer.customercode }">
<input class="button" type="button" value="查询" onclick="subcustomerfor()">
<input class="button" type="button" value="导出" onclick="reportCustomer()">
</div>
<table class="bordered">
    <thead>
    <tr>
        <th>序号</th>
		<th>客户编码</th>
		<th>名称</th>
		<th>地址</th>
		<th>联系人</th>
		<th>手机</th>
		<th>客户类型</th>
		<th>价格层级</th>
		<th>修改时间</th>
		<th>操作</th>
    </tr>
    </thead>
    <c:if test="${fn:length(requestScope.ccustomerList) != 0 }">
	<c:forEach var="ccustomer" items="${requestScope.ccustomerList }" varStatus="ccustomerSta">
		<tr>
			<td><c:out value="${ccustomerSta.count}"></c:out></td>
			<td>${ccustomer.customer.customercode}</td>
			<td>${ccustomer.customer.customershop}</td>
			<td>${ccustomer.customer.customercity}${ccustomer.customer.customerxian}${ccustomer.customer.customeraddress}</td>
			<td>${ccustomer.customer.customername}</td>
			<td>${ccustomer.customer.customerphone}</td>
			<td>${ccustomer.customer.customertype == 3?'餐饮客户':(ccustomer.customer.customertype == 2?'商超客户':'组织单位客户')}</td>
			<td>${ccustomer.ccustomerdetail}</td>
			<td>${ccustomer.customer.updtime}</td>
			<td><a href="editCusInfo.jsp?customerid=${ccustomer.customer.customerid}&ccustomerid=${ccustomer.ccustomerid}">修改</a></td>
		</tr>
	</c:forEach>
	</c:if>
	<c:if test="${fn:length(requestScope.ccustomerList)==0 }">
		<tr><td colspan="10" align="center" style="font-size: 20px;color: red;"> 没有信息</td></tr>
	</c:if>
    	<tr>
		 <td colspan="10" align="center">
		 <c:if test="${requestScope.pagenow > 1 }">
		 	<a onclick="fenye('1')">第一页</a>
		 </c:if>
		 <c:if test="${requestScope.pagenow == 1 }">
		 	<span>第一页</span>
		 </c:if>
		  <c:if test="${requestScope.pagenow > 1 }">
		 	<a onclick="fenye('${requestScope.pagenow - 1 }')">上一页</a>
		 </c:if>
		 <c:if test="${requestScope.pagenow == 1 }">
		 	<span>上一页</span>
		 </c:if>
		 	
		 	<span>当前第${requestScope.pagenow }页</span>
		 	
		 <c:if test="${requestScope.pagenow < requestScope.pageCount }">
		 	<a onclick="fenye('${requestScope.pagenow + 1 }')">下一页</a>
		 </c:if>
		 <c:if test="${requestScope.pagenow == requestScope.pageCount }">
		 	<span>下一页</span>
		 </c:if>
		 <c:if test="${requestScope.pagenow < requestScope.pageCount }">
		 	<a onclick="fenye('${requestScope.pageCount }')">最后一页</a>
		 </c:if>
		 <c:if test="${requestScope.pagenow == requestScope.pageCount }">
		 	<span>最后一页&nbsp;</span>
		 </c:if>
		 	<span>跳转到第<input style="width: 22px;text-align: center;" size="1" type="text" id="pagenow" name="pagenow" value="${requestScope.pagenow }">页</span>
		 	<input type="submit" value="GO" style="width: 40px;height: 20px;font-size:8px; text-align: center;cursor:pointer;">
		 	<span>一共 ${requestScope.count } 条数据</span>
		 </td>
	 </tr>       
</table>
</form>
<script type="text/javascript">
var customertype = '<%=customertype %>';
$(function(){
	if(customertype == null || customertype == ''){
		$(".nowposition").html("当前位置：客户管理》全部客户");
	} else if(customertype == '3'){
		$(".nowposition").html("当前位置：客户管理》餐饮客户");
	} else if(customertype == '2'){
		$(".nowposition").html("当前位置：客户管理》商超客户");
	} else if(customertype == '1'){
		$(".nowposition").html("当前位置：客户管理》组织单位客户");
	}
	$("#main_form").on("submit",function(){
		checkCondition();
	});
})
//检查查询条件是否变化
function checkCondition(){
	if($("#customercode").val() != '${requestScope.ccustomerCon.customer.customercode }'){
		$("#pagenow").val('1');
	}
	if(parseInt($("#pagenow").val()) > '${requestScope.pageCount }' ){
		$("#pagenow").val('${requestScope.pageCount }');
	}
}
//提交查询条件
function subcustomerfor(){
	$("#customercode").val($.trim($("#customercode").val()));
	checkCondition();
	document.forms[0].submit();
}
//分页
function fenye(targetPage){
	$("#pagenow").val(targetPage);
	checkCondition()
	document.forms[0].submit();
}
//导出
function reportCustomer(){
	window.location.href ="exportCustomerReport.action?"+
			"ccustomercompany=${requestScope.ccustomerCon.ccustomercompany }"+
			"&customer.customertype=${requestScope.ccustomerCon.customer.customertype }"+
			"&customer.customercode=${requestScope.ccustomerCon.customer.customercode }";
}
</script>
</body>
</html>