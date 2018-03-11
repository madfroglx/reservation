var treeObj = null;

$(document).ready(function() {
	ROOF.Utils.ajaxcommon();

	$('#mainForm').validate({
		rules : {
			'role.name' : {
				required : true
			}
		}
	});
	$('#mainForm').ajaxForm({
		'dataType' : 'json',
		'clearForm' : true,
		'success' : function(d) {
			ROOF.Utils.alert(d.message, function() {
				var href = $('#backbtn').attr('href');
				if (href) {
					window.location.href = href;
				}
			});
		},
		'beforeSubmit' : function(arr, $form, options) {
			var nodes = treeObj.getNodes();
			var allnodes = treeObj.transformToArray(nodes);
			var allnodesIds = new Array();
			for (var i = 0; i < allnodes.length; i++) {
				allnodesIds.push(allnodes[i].id);
			}
			var selectNodes = treeObj.getCheckedNodes();
			var selectnodesIds = new Array();
			for (var j = 0; j < selectNodes.length; j++) {
				selectnodesIds.push(selectNodes[j].id);
			}
			arr.push({
				name : 'selSrc',
				value : selectnodesIds.join(',')
			});
			arr.push({
				name : 'allSrc',
				value : allnodesIds.join(',')
			});
		}
	});

	$('#saveBtn').click(function() {
		$('#mainForm').submit();
		return false;
	});

	var setting = {
		check : {
			enable : true,
			chkboxType : {
				"Y" : "",
				"N" : ""
			}
		},
		async : {
			enable : true,
			url : ROOF.Utils.projectName() + "/resourceAction/read.json",
			autoParam : [ "id" ],
			otherParam : {
				"roleId" : $('input[name="id"]').val()
			}
		},
		data : {
			key : {
				title : "title"
			}
		},
		view : {
			selectedMulti : true
		}
	};
	treeObj = $.fn.zTree.init($('.ztree'), setting);

});