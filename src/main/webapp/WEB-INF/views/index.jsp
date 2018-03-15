<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--页面标题-->
    <title>转贷预约登记</title>
    <!--引入bootstrap样式-->
    <link href="<%=basePath%>bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

</head>
<%--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>
<script src="<%=basePath%>bootstrap/jquery/jquery-1.8.3.min.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<!--引入bootstrap脚本-->
<script src="<%=basePath%>bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script>
    $(document).ready(function () {
        // bind 'myForm' and provide a simple callback function
        $('#myForm').ajaxForm({
            beforeSubmit: showRequest,  // pre-submit callback
            dataType: 'json',
            success: function () {
                alert('提交成功');
                $("#myForm").resetForm();
            }
        });

        $('#startTime').datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
        $('#endTime').datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });
    });

    function showRequest(formData, jqForm, options) {
        // formData is an array; here we use $.param to convert it to a string to display it
        // but the form plugin does this for you automatically when it submits the data
        var queryString = $.param(formData);

        // jqForm is a jQuery object encapsulating the form element.  To access the
        // DOM element for the form do this:
        // var formElement = jqForm[0];

        // alert('About to submit: \n\n' + queryString);

        // here we could return false to prevent the form from being submitted;
        // returning anything other than false will allow the form submit to continue
        return true;
    }

</script>
<body>
<div class="container">
    <h1 align="center">转贷预约登记</h1>
    <H4 align="center">咨询热线：‭(0571) 6334 1333‬</H4>
    <form id="myForm" action="<%=basePath%>test/reservationsave" method="post">
        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" class="form-control" name="name" id="name" placeholder="姓名">
        </div>
        <div class="form-group">
            <label for="guarantee">担保方式</label>
            <select class="form-control" name="guarantee" id="guarantee">
                <option value="0">抵押</option>
                <option value="1">担保</option>
                <option value="2">信用</option>
            </select>
        </div>
        <div class="form-group">
            <label for="amount">金额</label>
            <input type="text" class="form-control" name="amount" id="amount" placeholder="金额">
        </div>
        <div class="form-group">
            <label for="contacts">联系方式</label>
            <input type="text" class="form-control" name="contacts" id="contacts" placeholder="联系方式">
        </div>
        <div class="form-group">
            <label for="subbranch">支行</label>
            <input type="text" class="form-control" name="subbranch" id="subbranch" placeholder="支行">
        </div>
        <div class="form-group">
            <label for="manager">客户经理</label>
            <input type="text" class="form-control" name="manager" id="manager" placeholder="客户经理">
        </div>
        <div class="form-group">
            <label for="managerContacts">客户经理联系方式</label>
            <input type="text" class="form-control" name="managerContacts" id="managerContacts" placeholder="客户经理联系方式">
        </div>
        <div class="form-group">
            <label for="managerContacts">开始时间</label>
            <div id="startTime" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-mm-dd"
                 data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                <input class="form-control" size="16" name="startTime" type="text" value="" readonly>
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>
        <div class="form-group">
            <label for="managerContacts">结束时间</label>
            <div id="endTime" class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-mm-dd"
                 data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                <input class="form-control" size="16" name="endTime" type="text" value="" readonly>
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>

        <input type="hidden" id="dtp_input2" value=""/><br/>

        <div class="modal-footer">
            <button type="submit" class="btn btn-primary">提交</button>
        </div>
    </form>

</div>

</body>
</html>