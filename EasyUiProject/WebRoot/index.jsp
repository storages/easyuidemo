<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<style type="text/css">
		#_easyui_tree_1 .tree-title{
			font-weight: bold;
		}
	</style>
  <jsp:include page="/public/publicreference.jsp"></jsp:include>
  </head>
  <body>
  	<!-- <div class="easyui-dialog" style="width:400px; height: 200px;" title="My Dialog" id="dd">123</div> -->
  	<div id="cc" class="easyui-layout" style="width:100%;height:100%;">  
    <div data-options="region:'north',split:false" class="head_title" style="height:80px;background-color: #6495ED;"></div>  
    <div data-options="region:'west',split:true" style="width:200px;">
    	<ul id="tt"></ul>  
    	
    </div>  
    <div data-options="region:'center'" id="tab" style="border: 0px; overflow: hidden;">
    	<div class="easyui-tabs" fit="true" id="tabsroot">
    		<div id="tomain" title="首页">首页</div>
    	</div>
    </div>  
</div>  
  	
  </body>
  <script type="text/javascript">
  //动态加载左边树菜单
  $(function(){
  		$("#tt").tree({
  			url:'menus_getMenu.action',
  			lines:true,
  			cache:false,
  			onClick:function(node){
  				addTabs(node);
  			}
  		});
  });
  	
  	//点击菜单，在功能区新增一个tabs
  	function addTabs(node){
  		//在新增之前，先判断该菜单的url是否为空并且是否已存在这个tabs【以防父节点也现tabs和重复新增相同tabs】
	  	if(node.attributes.url!=undefined && !$('#tabsroot').tabs('exists',node.text)){
	  		//新增tabs
	  		$('#tabsroot').tabs('add',{
	  			title:node.text,//设置标题
	  			id:node.text+'tabs',//设置id【用当前菜单的名称+字符tabs做id,这个id可随意，但要保证唯一】
	  			closable:true,//tabs上有关闭的叉叉
	  			href:node.attributes.url//从远程加载一个页面到tabs中
	  		});
	  	}
  	}
  	
  	
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
