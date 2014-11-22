<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript">
	$(function() {
		var editRow = undefined;
		$('#dg').datagrid({
			url : getPath() + '/users_view.action',
			pagination : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40 ],
			//fit : true,
			rownumbers : true,
			fitColumns : true,
			nowarp : false,
			border : false,
			striped : true,
			checkOnSelect : true,
			idFiled : 'id',
			sortName : 'name',
			sortOrder : 'desc',
			columns : [ [ {
				title : '编号',
				field : 'id',
				width : 50,
				sortable : true,
				checkbox:true
			}, {
				title : '姓名',
				field : 'name',
				width : 280,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			}, {
				title : '密码',
				field : 'password',
				width : 280,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			}, {
				title : '邮箱',
				field : 'email',
				width : 280,
				sortable : true,
				editor : {
					type : 'text'
				}
			}, {
				title : '地址',
				field : 'address',
				width : 280,
				sortable : true,
				editor : {
					type : 'text'
				}
			} ] ],
			toolbar : [ {
				text : '新增',
				iconCls : 'icon-add',
				handler : function() {
					if (editRow != undefined) {
						$('#dg').datagrid('endEdit', editRow);
						//editRow=undefined;
					}
					if (editRow == undefined) {
						$('#dg').datagrid('insertRow', {
							index : 0,
							row : {

							}
						});
						$('#dg').datagrid('beginEdit', 0);
						editRow = 0;
					}
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-refresh',
				handler : function() {
					editRow = undefined;
					$('#dg').datagrid('reload',{
						
					});
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-del',
				handler : function() {
					var rows = $('#dg').datagrid('getSelections');
					if(rows.length>0){
						$.messager.confirm('警告','你确定要删除选择的内容吗?',function(b){
							if(b){
								var ids =[];
								for(var i=0;i<rows.length;i++){
									ids.push(rows[i].id);
								}
								$.ajax(function(){
									
								});
							}
						});
					}else{
						$.messager.alert('提示','请选择要删除的行!','error');
					}
				}
			}, '-', {
				text : '编辑',
				iconCls : 'icon-edit',
				handler : function() {
					var rows = $('#dg').datagrid('getSelections');
					if(rows.length==1){
						if (editRow != undefined) {
							$('#dg').datagrid('endEdit', editRow);
						}
						if (editRow == undefined) {
							var index = $('#dg').datagrid('getRowIndex',rows[0]);
							$('#dg').datagrid('beginEdit', index);
							editRow = index;
							$('#dg').datagrid('unselectAll');
						}
					}else if(rows.length>1){
						$.messager.alert('提示','只能选择一行编辑!','error');
					}else{
						$.messager.alert('提示','请选择要编辑的行!','error');
					}
				}
			}, '-', {
				text : '取消编辑',
				iconCls : 'icon-undo',
				handler : function() {
					editRow = undefined;
					$('#dg').datagrid('rejectChanges');
					$('#dg').datagrid('unselectAll');
				}
			}, '-', {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					$('#dg').datagrid('endEdit', editRow);
					
				}
			},'-' ],
			onAfterEdit : function(rowIndex, rowData, changes) {
				console.info(rowData);
				editRow = undefined;
				$.ajax({
						url : getPath() + '/users_saveUsers.action',
						type: 'POST',
						data : {
							
						},
						cache : false,
						dataType : 'json',
						success : function(result) {
							if(result.isSuccess){
								login.dialog('close');
								window.location.href=getPath()+"/users_inMain.action";
								$.messager.alert('提示',result.info);
							}else{
								$.messager.alert('提示',result.info);
							}
						}
					});
			},
			onDblClickRow:function(rowIndex, rowData){
				if (editRow != undefined) {
						$('#dg').datagrid('endEdit', editRow);
				}
				if (editRow == undefined) {
					$('#dg').datagrid('beginEdit', rowIndex);
					editRow = rowIndex;
				}
			}
		});
		$('#sear').click(function() {
			$('#dg').datagrid('load', {
				usersname : $('#uname').val(),
				address : $('#dress').val()
			});
		});
		
		
	});
	
	
</script>
<div id="searchbox">
	<form id="users_action_findForm">
		<table class="tableCss datagrid-toolbar" style="width:100%;hight:100%;">
			<tr>
				<th style="text-align: right; font-size: 12px; width:35px;">姓名:</th>
				<th style="width: 80px;"><input name="usersname" id="uname" /></th>
				<th style="text-align: right; font-size: 12px; width: 35px;">地址:</th>
				<th style="padding-right: 670px;"><input name="address" id="dress" /><a href="javascript:void(0);" class="easyui-linkbutton" id="sear" iconCls="icon-search" style="float: right;">查询</a> <!-- <input type="button" value="查询" id="sear" style="width:50px;"/> --> </th>
			</tr>
			<!-- <tr>
				<th style="text-align: right; font-size: 12px; width:80px;">地址:</th>
				<th><input name="address" id="dress" /><input type="button" value="查询" id="sear" style="width:50px;"/> </th>
				<a href="javascript:void(0);" class="easyui-linkbutton" id="sear" iconCls="icon-search">查询</a> 
			</tr> -->
		</table>
	</form>
</div>
<table id="dg"></table>