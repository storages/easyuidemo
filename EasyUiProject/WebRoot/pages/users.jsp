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
	  			field:'id',
	  			width:100
	  		},{
	  			title:'姓名',
	  			field:'name',
	  			width:300
	  		},{
	  			title:'密码',
	  			field:'password',
	  			width:300
	  		},{
	  			title:'邮箱',
	  			field:'email',
	  			width:300
	  		},{
	  			title:'地址',
	  			field:'address',
	  			width:500
	  		}]]
	  	});
  	});
  	
  	
</script>
<!-- <div class="easyui-tabs" fit="true" border="false">
	<div title="用户管理" border="false">
		
	</div>
</div> -->
<table id="dg"></table>