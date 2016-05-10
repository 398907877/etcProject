<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	 $("#tiJia2o").click(function(){
	   var username=$("#username").val();
	   var password=$("#password").val();
	   var user={username:username,password:password};
	   
	   $.ajax({
	     type:"POST",
	     url:"<%=path%>/user/addUser",
	     data:user,
	     success:function(data){
	       alert(data[0]+">>"+data.password);
	     },
	     error:function(){
	       alert("323");
	     }
	     
	   });
	 });
	 
	});
	
	</script>
  </head>

<body>
	<h1>添加用户：</h1>
	<form action="<%=path%>/user/addUser" method="post">
		姓名：<input type="text" id="username" name="username"> 
		密码：<input type="text" id="password" name="password">
		<input type="submit" id = "tiJiao" value="提交"/>
	</form>
</body>
</html>
