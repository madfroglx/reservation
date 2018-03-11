var treeObj = null;
var firstAsyncSuccessFlag = 0;
$(document).ready(function() {
	$('iframe').height(jQuery(window).height() - 40);
	var setting = {
		async : {
			enable : true,
			url : ROOF.Utils.projectName() + "/resourceAction/read.json",
			autoParam : [ "id" ]
		},
		view : {
			selectedMulti : false
		},
		edit : {
			enable : true,
			showRemoveBtn : false,
			showRenameBtn : false,
			drag : {
				isCopy : false,
				isMove : true
			}
		},
		data: {
			key: {
				title: "title"
			}
		},
		callback : {
			onClick : function(event, treeId, node) {
				$('iframe').attr("src", ROOF.Utils.projectName() + "/resourceAction/detail.controller?id=" + node.id);
			},
			onAsyncSuccess : function() {
				if (firstAsyncSuccessFlag == 0) {
					var nodes = treeObj.getNodes();
					$.each(nodes,function(i,n){
						treeObj.expandNode(nodes[i], true);
						treeObj.selectNode(nodes[i]);
					});
					firstAsyncSuccessFlag = 1;
				}
			},
			beforeDrop : function(treeId, treeNodes, targetNode, moveType, isCopy) {
				if (confirm("是否移动选中节点到[" + targetNode.name + "]下!")) {
					return true;
				} else {
					return false;
				}
			}
		}
	};
	treeObj = $.fn.zTree.init($('.ztree'), setting);
});
function reAsyncChildNodes() {
	var nodes = treeObj.getSelectedNodes();
	if (nodes.length > 0) {
		nodes[0].isParent = true;
		treeObj.reAsyncChildNodes(nodes[0], "refresh");
	}
}

function reAsyncParentChildNodes() {
	var nodes = treeObj.getSelectedNodes();
	if (nodes.length > 0) {
		treeObj.reAsyncChildNodes(nodes[0].getParentNode(), "refresh");
	}
}