<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<jsp:include page="/public/publicreference.jsp"></jsp:include>
</head>

<body>
	<div id="login" title="用户登录" style="width: 400px; height:200px; padding: 6px; text-align: center;">
			<table style="width:100%; padding-top: 20px">
				<tr align="right">
					<td width="80%">用户名：<input type="text" value="" style="width:150px"
						name="${users.name}" id="usersname" />
					</td>
					<td><span id="username" style="color:red;"></span>
					</td>
				</tr>
				<tr align="right">
					<td width="80%">密&nbsp;&nbsp;码：<input type="password" value=""
						style="width:150px" name="${users.password}" id="pass" />
					</td>
					<td><span id="password" style="color:red;"></span>
					</td>
				</tr>
				<tr align="left">
					<td colspan="2">　　　　&nbsp;&nbsp;<input type="checkbox" id="forget" />记住密码</td>
				</tr>
			</table>
	</div>
</body>
<script type="text/javascript">
	var login;
	$(function() {
		login = $("#login").dialog({
			closable : false,
			draggable : false,
			modal : true,
			buttons : [ {
				text : '登录',
				handler : function() {
					//$('#username').html("点击登录!");
					console.info('123');
					$.ajax({
						url : getPath() + '/users_login.action',
						type: 'POST',
						data : {
							usersname : $('#usersname').val(),
							password : $('#pass').val()
						},
						cache : false,
						dataType : 'json',
						success : function(result) {
							if(result.isSuccess){
								login.dialog('close');
								window.location.href=getPath()+"/users_inMain.action";
								$.messager.alert('提示',result.info);
							}else{
								$.messager.alert('Warning',result.info);
							}
						}
					});
				},
				iconCls : 'icon-ok'
			}, {
				text : '注册',
				handler : function() {
				},
				iconCls : 'icon-add'
			}, {
				text : '关闭',
				handler : function() {
				},
				iconCls : 'icon-cancel'
			} ],
		});
	});

	function getPath() {
		var currPath = window.document.location.href;
		var currName = window.document.location.pathname;
		var pos = currPath.indexOf(currName);
		var localhostPath = currPath.substring(0, pos);
		var projectName = currName.substring(0,
				currName.substr(1).indexOf("/") + 1);
		return (localhostPath + projectName);
	}
</script>
</html>
