$(document).ready(function() {
	var table = new ROOF.SelectableTable($('table'));
	$('#updateBtn').click(function() {
		var id = table.getSeleted();
		if (id) {
			window.location.href = $(this).attr('href') + '&id=' + id;
		} else {
			ROOF.Utils.alert('请选择一行记录!');
		}
		return false;
	});
	$('#deleteBtn').click(function() {
		var id = table.getSeleted();
		if (id) {
			$.post($(this).attr('href'), {
				'id' : id
			}, function(d) {
				ROOF.Utils.alert(d.message, function() {
					window.location.reload();
				});
			}, 'json');
		} else {
			ROOF.Utils.alert('请选择一行记录!');
		}
		return false;
	});
	$('#resetBtn').click(function() {
		$('#mainForm :input').val('');
		return false;
	});
	
	$('#searchBtn').click(function() {
		$('#mainForm').submit();
		return false;
	});
});