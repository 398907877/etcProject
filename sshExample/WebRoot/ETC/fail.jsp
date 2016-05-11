<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FTP功能</title>

<!-- Set render engine for 360 browser -->
<meta name="renderer" content="webkit">

<!-- No Baidu Siteapp-->
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="icon" type="image/png" href=" ./assets/i/favicon.png">

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="./assets/i/app-icon72x72@2x.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="apple-touch-icon-precomposed"
	href="./assets/i/app-icon72x72@2x.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="./assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#0e90d2">

<link rel="stylesheet" href=" ./assets/css/amazeui.min.css">
<link rel="stylesheet" href=" ./assets/css/app.css">
<style type="text/css">
*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

#wujiajunfrom { * {
	margin: 0;
	padding: 0;
	border: 0;
}
}
</style>


</head>
<body>











	<header data-am-widget="header" class="am-header am-header-default">
		<div class="am-header-left am-header-nav">
			<a href="./ETC/moban.jsp" class=""> <i
				class="am-header-icon am-icon-home"></i>
			</a>
		</div>

		<h1 class="am-header-title">
			<a href="./ETC/moban.jsp" class=""> FTP文件上传工具 </a>
		</h1>



		<div class="am-container">
			<div class="am-g">
				<div class="am-u-sm-0"></div>
				<div class="am-u-sm-12">








<br>

<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
    <h2 class="am-titlebar-title " >
      <span  style="color: red">  保存失败，请确认是否正确使用</span>
    </h2>

    <nav class="am-titlebar-nav">
        <a href="./ETC/moban.jsp" class="">回到主页 &raquo;</a>
    </nav>
</div>



				</div>
				<div class="am-u-sm-1"></div>
			</div>
		</div>
<br><br><br><br><br><br>		




				</div>
				<div class="am-u-sm-1"></div>
			</div>
		</div>


		<!-- 回到顶部 -->

		<div data-am-widget="gotop" class="am-gotop am-gotop-fixed">
			<a href="#top" title="回到顶部"> <span class="am-gotop-title">回到顶部</span>
				<i class="am-gotop-icon am-icon-chevron-up"></i>
			</a>
		</div>

		<footer data-am-widget="footer" class="am-footer am-footer-default"
			data-am-footer="{  }">
			<div class="am-footer-switch">
				<span class="am-footer-ysp" data-rel="mobile"
					data-am-modal="{target: '#am-switch-mode'}"> 欢迎使用 </span> <span
					class="am-footer-divider"> | </span> <a id="godesktop"
					data-rel="desktop" class="am-footer-desktop" href="javascript:">
					电脑版 </a>
			</div>
			<div class="am-footer-miscs ">

				<p>
					由 <a href="http://www.yunshipei.com/" title="国通科技" target="_blank"
						class="">国通科技</a> 提供技术支持
				</p>
				<p>CopyRight©2016 wujiajunGotop Inc.</p>
				<p>京ICP备 88888888</p>
			</div>
		</footer>


		<!--[if (gte IE 9)|!(IE)]><!-->
		<script src=" ./assets/js/jquery.min.js"></script>
		<!--<![endif]-->
		<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
		<script src="./assets/js/amazeui.min.js"></script>
		
</body>
</html>