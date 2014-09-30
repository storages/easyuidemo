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
    		<div id="tomain" title="首页" class="easyui-layout" style="height:100%;" fit="true">
				   <div data-options="region:'east',iconCls:'icon-reload',title:'附加功能区',split:false,collapsible:false" style="width:200px;">
				   	 <div id="dates" style="width:200px;height:180px;"></div><!-- 日历 -->
				   	 <p id="notice" style="width:auto;height:100%;margin-top: 0px; padding:5px;word-break:break-all; word-wrap:break-word;"></p>
				   </div>  
				   <div data-options="region:'center',title:'消息提示区',border:false" id="messarea" fit="true">
				   	<p id="stockwar" style="margin:0px;border:0px;"></p><!-- 仓库预警 -->
				   	<p id="moneypay" style="margin:0px;border:0px;"></p><!-- 付款提醒 -->
				   	<p id="moneyget" style="margin:0px;border:0px;"></p><!-- 收款提醒 -->
				   </div>  			
    		</div>
    	</div>
    </div>  
</div>  
  	
  </body>
  <script type="text/javascript">
  $(function(){
  
		var tabsOneHight = ($('#tabsroot').tabs('getSelected').height()-120)/3;
		$('#stockwar').height(tabsOneHight);
		$('#moneypay').height(tabsOneHight);
		$('#moneyget').height(tabsOneHight);
  		//ajax动态加载左边树菜单
  		$("#tt").tree({
  			url:'menus_getMenu.action',
  			lines:true,
  			cache:false,
  			onClick:function(node){
  				addTabs(node);
  			}
  		});
  		
  		//仓库预警
  		$('#stockwar').panel({
  		  fit:true,
		  height:tabsOneHight,   
		  title: '仓库预警',   
		  tools: [{   
		    iconCls:'icon-reload',   
		    handler:function(){alert('new')}   
		  }]   
		});   
  		//付款提醒
  		$('#moneypay').panel({
  		  fit:true,
		  height:tabsOneHight,   
		  title: '付款提醒',   
		  tools: [{   
		    iconCls:'icon-reload',   
		    handler:function(){alert('new')}   
		  }]   
		});   
  		//收款提醒
  		$('#moneyget').panel({
  		  fit:true,
		  height:tabsOneHight,   
		  title: '收款提醒',   
		  tools: [{   
		    iconCls:'icon-reload',   
		    handler:function(){alert('new')}   
		  }]   
		});
		
		//附加功能区：日历
		$('#dates').calendar({   
    		current:new Date(),
    		border:true   
		});
		   
		//附加功能区：公告栏
		$('#notice').panel({
  		  fit:true,
  		  iconCls:'icon-notice',
  		  title:'公告栏',
  		  border:true,
		  height:300,
		  href:getPath()+'/pages/scroll.jsp'   
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
