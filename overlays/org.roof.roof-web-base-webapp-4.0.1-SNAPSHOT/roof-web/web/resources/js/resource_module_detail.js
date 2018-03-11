$(document).ready(function() {
	ROOF.Utils.ajaxcommon();
	var parent_path = $('#parent_path').val();
	var parent_pattern = $('#parent_pattern').val();
	var module_path_input = $('input[name="path"]');
	var module_pattern_input = $('input[name="pattern"]');
	var lvl = $('input[name="lvl"]').val();
	$('a[name="addresource"]').click(function() {
		$.post($(this).attr('href'), {}, function(d) {
			if (d.state == 'success') {
				ROOF.Utils.alert(d.message, function() {
					// window.location.href = "resourceAction!detail.controller?id="
					// + d.data.id;
					if (parent.reAsyncChildNodes) {
						parent.reAsyncChildNodes();
					}
				});
			}
		}, "json");
		return false;
	});

	$('input[name="identify"]').change(function() {
		var path = Roof.web.resource.createPath(parent_path, "Module", $(this).val(), "Module");
		module_path_input.val(path);
		module_pattern_input.val(Roof.web.resource.createPattern(path, "Module"));
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
		beforeSubmit : function(formData, jqForm, options) {
			var leaf = $("#resource_leaf").val();
			if (leaf == "true") {
				if (confirm("是否生成基本操作资源？")) {
					formData.push({
						name : 'initBasic',
						value : 1
					});
				}
			}
		},
		success : function(d) {
			ROOF.Utils.alert(d.message, function() {
				if (parent.reAsyncChildNodes) {
					parent.reAsyncParentChildNodes();
				}
			});
		}
	});
});