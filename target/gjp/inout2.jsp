<!DOCTYPE html>
<html>
<head>
<meta  charset="utf-8">
<title>收支查看</title>
<script type="text/javascript">
    function yes(){
        var  makesure=confirm("确认要添加吗？");
        if(makesure==true)
        {alert("添加成功!");return true;}
        return false;
    }    
</script>
    <% String path = request.getContextPath(); %>
<link rel="stylesheet" href="bootstrap3.3.7/css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="bootstrap3.3.7/js/bootstrap.min.js"></script>
<link href="<%=path %>css/record.css" rel="stylesheet" type="text/css" />

</head>

<body style="background-image:url();background-position:center; background-repeat:repeat-y">

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">管家婆</a>
                </div>
                
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li >
                            <a href="file:///E:/web/project/account.html">账户</a>
                        </li>
                        <li class="active">
                            <a href="file:///E:/web/project/inout.html">记账</a>
                        </li>
                        <li>
                            <a href="file:///E:/web/project/forms.html">报表</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                             <a href="file:///E:/web/project/login.html">退出登录</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="row clearfix">
        <div class="inner">
            <div class="bord1">
                <div class="newrecord">
                <div style="padding: 10px 10px 10px;">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#panel-1" data-toggle="tab">支出</a>
                        </li>
                        <li>
                            <a href="#panel-2" data-toggle="tab">收入</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="panel-1"> 
                        <form class="bs-example bs-example-form" id="outform" role="form">
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">类别</span>
                        <select class="selectpicker form-control" data-live-search="true" id="d1" style="width: 115px;">
                        <option value="-1">请选择</option>
                        <option value="0">衣</option>
                        <option value="1">食</option>
                        <option value="2">住</option>
                        <option value="3">行</option>
                        <option value="4">娱乐学习</option>
                        <option value="5">医疗保健</option>
                        <option value="6">其他</option>
                        </select>
                        <select class="selectpicker form-control" data-live-search="true" id="d2" style="width: 115px;margin-left: 15px;">
                        <option value="-1">请选择</option>
                        </select>
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">时间</span>
                        <input type="text" class="form-control" name="time" >
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">金额</span>
                        <input type="text" class="form-control" name="sum" style="width: 115px;">
                        <select class="form-control" style="width: 115px;margin-left: 15px;">
                        <option value="CNY">人民币</option>
                        <option value="USD">美元</option>
                        <option value="JPY">日元</option>
                        <option value="HKD">港元</option>
                        <option value="GBP">英镑</option>
                        </select>
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">地点</span>
                        <input type="text" class="form-control" name="place">
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">消费对象</span>
                        <input type="text" class="form-control" name="member">
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">备注</span>
                        <input type="text" class="form-control" name="ps">
                        </div>
                        <br>
                        </form>
                        <button type="button" type="submit" class="btn btn-info" onclick="yes()">><span class="  glyphicon glyphicon-plus"></span> 添加</button>
                        </div>
                        <div class="tab-pane" id="panel-2">
                        <form class="bs-example bs-example-form" id="inform" role="form" action="/In/insertIn">
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">id</span>
                                <input type="text" class="form-control" name="id">
                            </div>
                            <br>
                        <div class="input-group">
                        <span class="input-group-addon">类别</span>
                        <select class="selectpicker form-control" data-live-search="true" id="inSort" name="inSort" style="width: 115px;">
                        <option value="-1">请选择</option>
                        <option value="0">工资</option>
                        <option value="1">其他收入</option>
                        </select>
                        <select class="selectpicker form-control" data-live-search="true" id="inSort1" name="inSort1" style="width: 115px;margin-left: 15px;">
                        <option value="-1">请选择</option>
                        <option value="0">变魔法</option>
                        </select>
                        </div>
                        <br>

                            <%--<div class="input-group">
                                <span class="input-group-addon">类型</span>
                                <input type="text" class="form-control" name="inSort">
                            </div>
                             <br>--%>
                        <div class="input-group">
                        <span class="input-group-addon">时间</span>
                        <input type="text" class="form-control" name="date">
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">金额</span>
                        <input type="text" class="form-control" name="inAmounts" style="width: 115px;">
                        <%--<select class="form-control" style="width: 115px;margin-left: 15px;" name="unit" id="unit">
                        <option value="CNY">人民币</option>
                        <option value="USD">美元</option>
                        <option value="JPY">日元</option>
                        <option value="HKD">港元</option>
                        <option value="GBP">英镑</option>
                        </select>--%>
                        </div>
                            <br>
                            <div class="input-group">
                                <span class="input-group-addon">单位</span>
                                <input type="text" class="form-control" name="unit">
                            </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">备注</span>
                        <input type="text" class="form-control" name="notes">
                        </div>
                        <br>
                            <button class="button" type="submit" onclick="yes()">><span class="  glyphicon glyphicon-plus"></span> 添加</button>
                        </form>

                        </div>
                    </div>             
                </div>
                </div>        
            </div>
            <div class="search">
            <form class="form-signin" onsubmit="return check(this)" action="">
            <div class="input-group">
            <input type="text" class="form-control" name="sid"><span class="input-group-btn"><button class="btn btn-default" type="submit" >搜索查询</button></span>
            </div>
            </form>
            </div>
            <div class="bord2">
                <div class="record">
                <table class="table table-condensed">
                <thead>
                    <tr>
                        <th>收支</th>
                        <th>类别</th>
                        <th>时间</th>
                        <th>金额</th>
                        <th>地点</th>
                        <th>消费对象</th>
                        <th>备注</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>收入</td>
                        <td>工资</td>
                        <td>11.25</td>
                        <td>5000</td>
                        <td>杭州下沙</td>
                        <td>无</td>
                        <td>无</td>
                    </tr>
                    <tr>
                        <td>支出</td>
                        <td>购物</td>
                        <td>11.28</td>
                        <td>2000</td>
                        <td>淘宝</td>
                        <td>我</td>
                        <td>无</td>
                    </tr>   
                </tbody>
                </table>
                </div>
            </div>
    
        </div>
    </div>
</div>
    <script type="text/javascript">
    $(function(){
    var erji=[
            ['衣服裤子','鞋帽包包','化妆饰品'],  // 0
            ['早中晚餐','烟酒茶','水果零食'],  // 1
            ['日常用品','水电煤气','房租','物业','维修保养'],  // 2
            ['公共交通','打车租车','私家车费用'],  // 3
            ['运动建设','学习用品','游戏娱乐','宠物用品','旅游度假'],  // 4
            ['药品','保健','美容'],  // 5
            ['备注写明']  // 6
        ];
        var yuan = '<li data-original-index="-1" class>' +     // 字符串拼接
                '<a tabindex="0" data-tokens="null" role="option" aria-disabled="false" aria-selected="false">' +
                '<span class="text">请选择</span>' +
                '<span class="glyphicon glyphicon-ok check-mark"></span>' +
                '</a>' +
                '</li>';
        $('#d1').change(function(){    // 一级下拉菜单选项改变事件
            if($(this).val() === '-1'){
                $('#d2').prev('div.dropdown-menu').find('ul').html(yuan);
                $('#d2').html('<option>请选择</option>');
                $('.selectpicker').selectpicker('refresh');
                smallScreen();
                return;
            }
            var cityIndex = erji[ this.value ];  // 当前下标在二级对应内容
            var html =  '<li data-original-index="-1" class>' +     // 下拉搜索动态加载成的标签
                    '<a tabindex="0" data-tokens="null" role="option" aria-disabled="false" aria-selected="false">' +
                    '<span class="text">请选择</span>' +
                    '<span class="glyphicon glyphicon-ok check-mark"></span>' +
                    '</a>' +
                    '</li>';
            var erjiOption = '<option value="0">请选择</option>';   // 同事添加option
            for(var i = 0;i<cityIndex.length;i++){
                html+= '<li data-original-index='+i+'>' +
                        '<a tabindex="0" data-tokens="null" role="option" aria-disabled="false" aria-selected="false">' +
                        '<span class="text">'+cityIndex[i]+'</span>' +
                        '<span class="glyphicon glyphicon-ok check-mark"></span>' +
                        '</a>' +
                        '</li>';    // 此处为了兼容ie，采用的字符串拼接而不是ES6的模板字符串。
                // 添加option
                erjiOption += '<option value='+i+'>'+cityIndex[i]+'</option>';
            }
            $('#d2').prev('div.dropdown-menu').find('ul').html(html);
            $('#d2').html(erjiOption);
            $('.selectpicker').selectpicker('refresh');
            smallScreen();
        });
    });
    </script>
        <script type="text/javascript">
    $(function(){
    var erji=[
            ['正常工资','加班费','奖金'],  // 0
            ['储蓄利息','投资利润','其他']  // 1
        ];
        var yuan = '<li data-original-index="-1" class>' +     // 字符串拼接
                '<a tabindex="0" data-tokens="null" role="option" aria-disabled="false" aria-selected="false">' +
                '<span class="text">请选择</span>' +
                '<span class="glyphicon glyphicon-ok check-mark"></span>' +
                '</a>' +
                '</li>';
        $('#d3').change(function(){    // 一级下拉菜单选项改变事件
            if($(this).val() === '-1'){
                $('#d4').prev('div.dropdown-menu').find('ul').html(yuan);
                $('#d4').html('<option>请选择</option>');
                $('.selectpicker').selectpicker('refresh');
                smallScreen();
                return;
            }
            var cityIndex = erji[ this.value ];  // 当前下标在二级对应内容
            var html =  '<li data-original-index="-1" class>' +     // 下拉搜索动态加载成的标签
                    '<a tabindex="0" data-tokens="null" role="option" aria-disabled="false" aria-selected="false">' +
                    '<span class="text">请选择</span>' +
                    '<span class="glyphicon glyphicon-ok check-mark"></span>' +
                    '</a>' +
                    '</li>';
            var erjiOption = '<option value="0">请选择</option>';   // 同事添加option
            for(var i = 0;i<cityIndex.length;i++){
                html+= '<li data-original-index='+i+'>' +
                        '<a tabindex="0" data-tokens="null" role="option" aria-disabled="false" aria-selected="false">' +
                        '<span class="text">'+cityIndex[i]+'</span>' +
                        '<span class="glyphicon glyphicon-ok check-mark"></span>' +
                        '</a>' +
                        '</li>';    // 此处为了兼容ie，采用的字符串拼接而不是ES6的模板字符串。
                // 添加option
                erjiOption += '<option value='+i+'>'+cityIndex[i]+'</option>';
            }
            $('#d4').prev('div.dropdown-menu').find('ul').html(html);
            $('#d4').html(erjiOption);
            $('.selectpicker').selectpicker('refresh');
            smallScreen();
        });
    });
    </script>
</body>
</html>