<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<script type="text/javascript">
	$(document).ready(function() {
		var table = new ROOF.SelectableTable($('#role_select_dialog table'), true);

		var table2 = new ROOF.SelectableTable($('#staff_role_table'), true);
		$("#role_select_btn").click(function(event) {
			$("#role_select_dialog").dialog("open");
		});

		$("#role_delete_btn").click(function(event) {
			$("#staff_role_table").find(':checked').parent().parent().remove();
		});

		$("#role_select_dialog").dialog({
			autoOpen : false,
			width : 600,
			height : 400,
			modal : true,
			resizable : false,
			buttons : {
				"确定" : function() {
					$.each(table.getSelectedTr(), function(i, n) {
						var name = n.find(":checkbox").attr("name");
						var s = $("#staff_role_table").find(":checkbox[name='" + name + "']")
						if (s.length == 0) {
							$("#staff_role_table").append(n);
						}
					});
					$(this).dialog("close");
				},
				"取消" : function() {
					$(this).dialog("close");
				}
			}
		});
	});
</script>
<div class="ui-table-toolbar">
	<ul class="yright">
		<li><a id="role_select_btn" href="#"><i class="icon-plus icon-large"></i> 新增</a>
		</li>
		<li><a id="role_delete_btn" href="#"><i class="icon-trash icon-large"></i> 删除</a>
		</li>
	</ul>
</div>
<table id="staff_role_table" border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
	<tr>
		<td class="ui-table-header2" style="text-align: center;" width="10%"></td>
		<td class="ui-table-header2" style="text-align: center;" width="10%">序号</td>
		<td class="ui-table-header2" style="text-align: center;" width="20%">名称</td>
		<td class="ui-table-header2" style="text-align: center;" width="30%">说明</td>
	</tr>
	<c:forEach var="roles" items="${user.roles }" varStatus="status">
		<tr>
			<td style="text-align: center;"><input type="checkbox" name="roleses[${status.index }].id" value="${roles.id }" />
			</td>
			<td style="text-align: center;">${status.index + 1 }</td>
			<td style="text-align: center;">${roles.name }</td>
			<td style="text-align: center;">${roles.description }</td>
			</td>
		</tr>
	</c:forEach>
</table>
<div id="role_select_dialog" title="请选择角色">
	<table border="0" cellpadding="0" cellspacing="1" class="ui-table" width="100%">
		<tr>
			<td class="ui-table-header2" style="text-align: center;" width="10%"></td>
			<td class="ui-table-header2" style="text-align: center;" width="10%">序号</td>
			<td class="ui-table-header2" style="text-align: center;" width="20%">名称</td>
			<td class="ui-table-header2" style="text-align: center;" width="30%">说明</td>
		</tr>
		<c:forEach var="roles" items="${roleses }" varStatus="status">
			<tr>
				<td style="text-align: center;"><input type="checkbox" name="roleses[${status.index }].id" value="${roles.id }" />
				</td>
				<td style="text-align: center;">${status.index + 1 }</td>
				<td style="text-align: center;">${roles.name }</td>
				<td style="text-align: center;">${roles.description }</td>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>