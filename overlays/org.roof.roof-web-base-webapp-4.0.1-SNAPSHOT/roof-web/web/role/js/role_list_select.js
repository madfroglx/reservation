var table = null;
$(document).ready(function() {
	table = new ROOF.SelectableTable($('table'), true);
	$('#confirmBtn').click(function() {
		alert();
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

function getSelected() {
	return table.getSeleted();
}