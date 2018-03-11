$(document).ready(function() {
	var parent_path = $('#parent_path').val();
	var parent_pattern = $('#parent_pattern').val();
	var privilege_path_input = $('input[name="path"]');
	var privilege_pattern_input = $('input[name="pattern"]');
	var parent_class = $('#parent_class').val();
	var parent_type = "";
	if (parent_class == "org.roof.web.resources.entity.Module") {
		parent_type = "Module";
	} else {
		parent_type = "Resource";
	}
	$('a[name="addresource"]').click(function() {
		$.post($(this).attr('href'), {}, function(d) {
			if (d.state == 'success') {
				ROOF.Utils.alert(d.message, function() {
					window.location.reload();
					if (parent.reAsyncChildNodes) {
						parent.reAsyncChildNodes();
					}
				});
			}
		}, "json");
		return false;
	});

	$('a[name="addQuery"]').click(function() {
		$.post($(this).attr('href'), {}, function(d) {
			if (d.state == 'success') {
				ROOF.Utils.alert(d.message, function() {
					window.location.reload();
					if (parent.reAsyncChildNodes) {
						parent.reAsyncChildNodes();
					}
				});
			}
		}, "json");
		return false;
	});
	
	$('input[name="identify"]').change(function() {
		var path = Roof.web.resource.createPath(parent_path, parent_type, $(this).val(), "Resource");
		privilege_path_input.val(path);
		privilege_pattern_input.val(Roof.web.resource.createPattern(path, "Resource"));
	});

	$('#delSrcBtn').click(function() {
		$.post($(this).attr('href'), {}, function(d) {
			if (d.state == 'success') {
				ROOF.Utils.alert(d.message, function() {
					if (parent.reAsyncChildNodes) {
						parent.reAsyncParentChildNodes();
					}
				});
			}
		}, "json");
		return false;
	});

	$('#saveBtn').click(function() {
		$('#mainForm').submit();
		return false;
	});

	$('#mainForm').ajaxForm({
		dateType : 'json',
		success : function(d) {
			ROOF.Utils.alert(d.message, function() {
				if (parent.reAsyncChildNodes) {
					parent.reAsyncParentChildNodes();
				}
			});
		}
	});

	$('#parameters_new_btn').click(function() {
		$("#parameters_new_form").dialog("open");
	});

	$("#parameters_new_form").dialog({
		autoOpen : false,
		width : 650,
		modal : true,
		resizable : false,
		buttons : {
			"保存" : function() {
			},
			"取消" : function() {
				$(this).dialog("close");
			}
		},
		close : function() {
		}
	});

	$('#return_fields_new_btn').click(function() {
		$("#return_fields_new_form").dialog("open");
	});

	$("#return_fields_new_form").dialog({
		autoOpen : false,
		width : 650,
		modal : true,
		resizable : false,
		buttons : {
			"保存" : function() {
			},
			"取消" : function() {
				$(this).dialog("close");
			}
		},
		close : function() {
		}
	});
});