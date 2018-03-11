$(document).ready(function() {
			$('iframe').height(jQuery(window).height() - 60);
			for (var j = 0; j < menudate.children.length; j++) {
				var li = createMenu(menudate.children[j]);
				if (li) {
					$('#menu .menu').append(li);
				}
			}
		});

function createMenu(menu) {
	if (!menu.module && (!menu.children || menu.children.length <= 0)) {
		return null;
	}
	var target = menu.target ? menu.target : "_mainFrame";
	var href = null;
	if (menu.module) {
		if (menu.module.path.indexOf("?") == -1) {
			href = basePath + menu.module.path + '.action';
		} else {
			href = basePath + menu.module.path;
		}
	} else {
		href = "#";
	}

	var a = $('<a target="' + target + '" href="' + href + '"><span>'
			+ menu.name + '</span></a>');
	if (menu.script) {
		a.removeAttr("href");
		a.click(function() {
					eval("" + menu.script + "");
				});
	}
	if (!menu.module) {
		a.click(function() {
					return false;
				});
	}
	var li = $('<li />');
	li.append(a);
	if (menu.children && menu.children.length > 0) {
		li.find('a').addClass("parent");
		var div = $('<div />');
		var ul = $('<ul />');
		div.append(ul);
		li.append(div);
		for (var i = 0; i < menu.children.length; i++) {
			ul.append(createMenu(menu.children[i]));
		}
	}
	return li;
}