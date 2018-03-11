$(document).ready(function() {
	$('a[name="addresource"]').click(function() {
		$.post($(this).attr('href'), {}, function(d) {
			if (d.state == 'success') {
				alert(d.message);
				window.location.reload();
			}
		}, "json");
		return false;
	});
});