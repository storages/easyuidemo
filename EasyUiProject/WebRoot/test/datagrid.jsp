<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
	$(function(){
	  	$('#dg').datagrid({   
	  		url:getPath()+'/users_view.action',
	  		title:'用户列表',
	  		iconCls:'icon-save',
	  		pagination:true,
	  		pageSize:10,
	  		pageList:[10,20,30,40],
	  		fit:true,
	  		fitColumns:false,
	  		nowarp:false,
	  		border:false,
	  		idFiled:'id',
	  		columns:[[{
	  			title:'编号',
	  			filed:'id',
	  			width:100
	  		},{
	  			title:'姓名',
	  			filed:'name',
	  			width:100
	  		},{
	  			title:'密码',
	  			filed:'password',
	  			width:100
	  		},{
	  			title:'邮箱',
	  			filed:'email',
	  			width:100
	  		},{
	  			title:'地址',
	  			filed:'address',
	  			width:100
	  		}]]
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
<!-- <div class="easyui-tabs" fit="true" border="false">
	<div title="用户管理" border="false">
		
	</div>
</div> -->
<table id="dg"></table>