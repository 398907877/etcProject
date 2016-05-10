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
			<a href="./ETC/moban.jsp" class=""> FTP文件上传工具 <%=basePath%></a>
		</h1>



		<div class="am-container">
			<div class="am-g">
				<div class="am-u-sm-0"></div>
				<div class="am-u-sm-12">











					<form class="am-form" id="wujiajunfrom" action="etc/pushfile"    enctype="multipart/form-data" method="post">
						<fieldset>


							<br>

							<!-- 按钮触发器， 需要指定 target -->
							<button class="am-btn am-btn-primary"
								data-am-offcanvas="{target: '#doc-oc-demo2', effect: 'push'}">功能说明</button>

							<!-- 侧边栏内容 -->
							<div id="doc-oc-demo2" class="am-offcanvas">
								<div class="am-offcanvas-bar">
									<div class="am-offcanvas-content">
										<p>集文件命名、图像压缩、上传一体的工具。</p>


										<p class="am-kai">

											<small>
												操作人员输入车牌、湘通卡号，选择受理日期、车型、图像类型（01或02），并选定照片（证件照片可多张选择）后，按照命名规则压缩称小于50k的文件。
												文件命名规则：照片命名规则：“机构代码”+“_”+yyyymmdd+“_”+车牌+“_”+车型+“_”+湘通卡号+“_”+图像类型+2位顺序号+“.jpg”
												。 将照片上传至ftp服务器</small>
										</p>

									</div>
								</div>
							</div>




                            <br><br>                
							<div class="am-form-group">
								<label for="doc-ipt-pwd-1">机构号码</label>
								<p>
									<input type="text"   name="orgcode" class="am-form-field am-round"
										placeholder="机构号码" />
								</p>

							</div>


							<div class="am-form-group">
								<label for="doc-ipt-email-1">日期</label>
								<p>
									<input type="text"  name="datetime" class="am-form-field" placeholder="请选择日期"
										data-am-datepicker="{theme: 'success'}" readonly />
								</p>
							</div>

							<div class="am-form-group">
								<label for="doc-ipt-pwd-1">车牌</label>
								<p>
									<input    name="cardno" type="text" class="am-form-field am-round"
										placeholder="输入你的车牌号" />
								</p>

							</div>


							<div class="am-form-group">
								<label for="doc-ipt-pwd-1">车型</label>
								<p>
									<input type="text"   name="cardtype"  class="am-form-field am-round"
										placeholder="车型为：01、02、03、04、07（分别代表1-4型客车，07代表货车）" />
								</p>

							</div>


							<div class="am-form-group">
								<label for="doc-ipt-pwd-1">湘通卡号</label>
								<p>
									<input type="text"     name="idcard"  class="am-form-field am-round"
										placeholder="湘通卡号" />
								</p>

							</div>




							<!--文件上传，可以添加多个附件 -->




							<div class="am-form-group">
								<label for="doc-ipt-pwd-1">选择需要上传文件</label>



								<section class="am-panel am-panel-default">
									<main class="am-panel-bd"> 车辆照片

									<div class="am-form-group am-form-file">
										<button type="button" class="am-btn am-btn-danger am-btn-sm">
											<i class="am-icon-cloud-upload"></i> 选择要上传的文件
										</button>
										<input id="doc-form-file" type="file"  name="cardpic"   multiple="multiple">
									</div>

									<div id="file-list"></div>
									 </main>

								</section>

							</div>



							<!--文件上传，可以添加多个附件  end-->

							<!--文件上传，可以添加多个附件 -->






							<section class="am-panel am-panel-default">
								<main class="am-panel-bd"> 证件照片1

								<div class="am-form-group am-form-file">
									<button type="button" class="am-btn am-btn-danger am-btn-sm">
										<i class="am-icon-cloud-upload"></i> 选择要上传的文件
									</button>
									<input id="doc-form-file1"      type="file"   name="picone"  multiple="multiple">
								</div>

								<div id="file-list1"></div>
							 </main>

							</section>





							<!--文件上传，可以添加多个附件  end-->



							<!--文件上传，可以添加多个附件 -->






							<section class="am-panel am-panel-default">
								<main class="am-panel-bd"> 证件照片2

								<div class="am-form-group am-form-file">
									<button type="button" class="am-btn am-btn-danger am-btn-sm">
										<i class="am-icon-cloud-upload"></i> 选择要上传的文件
									</button>
									<input id="doc-form-file2"    name="pictwo"    type="file" multiple="multiple">
								</div>

								<div id="file-list2"></div>
								 </main>

							</section>





							<!--文件上传，可以添加多个附件  end-->






							<div class="am-form-group">
								<label for="doc-ta-1">备注（描述）</label>
								<textarea    class="" rows="5" id="doc-ta-1" name="textlong"></textarea>
							</div>


<br>

							<div data-am-widget="tabs" class="am-tabs am-tabs-d2">
								<ul class="am-tabs-nav am-cf">
									<li class="am-active"><a href="[data-tab-panel-0]">日</a></li>
									<li class=""><a href="[data-tab-panel-1]">了</a></li>
									<li class=""><a href="[data-tab-panel-2]">狗</a></li>
								</ul>
								<div class="am-tabs-bd">
									<div data-tab-panel-0 class="am-tab-panel am-active">
										【青春】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。
									</div>
									<div data-tab-panel-1 class="am-tab-panel ">
										【彩虹】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。
									</div>
									<div data-tab-panel-2 class="am-tab-panel ">
										【歌唱】那时候有多好，任雨打湿裙角。忍不住哼起，心爱的旋律。绿油油的树叶，自由地在说笑。燕子忙归巢，风铃在舞蹈。经过青春的草地，彩虹忽然升起。即使视线渐渐模糊，它也在我心里。就像爱过的旋律，没人能抹去。因为生命存在失望，歌唱，所以才要歌唱。
									</div>
								</div>
							</div>




							<br>

							<button type="submit"
								class="am-btn am-btn-success am-btn-block am-animation-reverse"
								data-doc-animation="scale-down">提交</button>
						</fieldset>
					</form>




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
		<script>
									$(function() {
										$('#doc-form-file2')
												.on(
														'change',
														function() {
															var fileNames = '';
															$
																	.each(
																			this.files,
																			function() {
																				fileNames += '<span class="am-badge">'
																						+ this.name
																						+ '</span> ';
																			});
															$('#file-list2')
																	.html(
																			fileNames);
														});
									});
								</script>
			<script>
									$(function() {
										$('#doc-form-file1')
												.on(
														'change',
														function() {
															var fileNames = '';
															$
																	.each(
																			this.files,
																			function() {
																				fileNames += '<span class="am-badge">'
																						+ this.name
																						+ '</span> ';
																			});
															$('#file-list1')
																	.html(
																			fileNames);
														});
									});
								</script>
		<script>
										$(function() {
											$('#doc-form-file')
													.on(
															'change',
															function() {
																var fileNames = '';
																$
																		.each(
																				this.files,
																				function() {
																					fileNames += '<span class="am-badge">'
																							+ this.name
																							+ '</span> ';
																				});
																$('#file-list')
																		.html(
																				fileNames);
															});
										});
									</script> 
</body>
</html>