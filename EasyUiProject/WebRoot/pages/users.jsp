<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
	$(function(){
	  	$('#dg').datagrid({   
	  		url:getPath()+'/users_view.action',
	  		pagination:true,
	  		pageSize:10,
	  		pageList:[10,20,30,40],
	  		fit:true,
	  		rownumbers:true,
	  		fitColumns:true,
	  		nowarp:false,
	  		border:false,
	  		striped:true,
	  		checkOnSelect:true,
	  		idFiled:'id',
	  		sortName:'name',
	  		sortOrder:'desc',
	  		columns:[[{
	  			title:'编号',
	  			field:'id',
	  			width:50,
	  			sortable:true
	  		},{
	  			title:'姓名',
	  			field:'name',
	  			width:280,
	  			sortable:true
	  		},{
	  			title:'密码',
	  			field:'password',
	  			width:280,
	  			sortable:true
	  		},{
	  			title:'邮箱',
	  			field:'email',
	  			width:280,
	  			sortable:true
	  		},{
	  			title:'地址',
	  			field:'address',
	  			width:280,
	  			sortable:true
	  		}]],
	  		toolbar:[{
	  			text:'新增',
	  			iconCls:'icon-add',
	  			handler:function(){
	  				
	  			}
	  		},'-',{
	  			text:'删除',
	  			iconCls:'icon-del',
	  			handler:function(){
	  			
	  			}
	  		},'-',{
	  			text:'编辑',
	  			iconCls:'icon-edit',
	  			handler:function(){
	  			
	  			}
	  		}]
	  	});
	  	
	  	$('#sear').click(function(){
	  		$('#dg').datagrid('load',{
	  			usersname:$('#uname').val(),
	  			address:$('#dress').val()
	  		});
	  	});
  	});
  	
</script>
<div data-options="region:'center', border:false title:'查询条件'" style="height:70px;">
	<form id="users_action_findForm">
		<table class="tableCss datagrid-toolbar" style="width:100%;hight:100%;">
			<tr>
				<th style="text-align: right; font-size: 12px; width:80px;">用户名:</th>
				<th><input name="usersname" id="uname"/></th>
			</tr>
			<tr>
				<th style="text-align: right; font-size: 12px; width:80px;">地址:</th>
				<th>
					<input name="address" id="dress"/>
					<a href="javascript:void(0);" class="easyui-linkbutton" id="sear" iconCls="icon-search">查询</a>
				</th>
			</tr>
		</table>
	</form>
</div>
<table id="dg"></table>