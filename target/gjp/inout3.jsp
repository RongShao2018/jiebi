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

<body style="background-position:center; background-repeat:repeat-y">

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
                            <a href="<%=path%>/WEB-INF/views/account.jsp">账户</a>
                        </li>
                        <li class="active">
                            <a href="<%=path%>/WEB-INF/views/inout.jsp">记账</a>
                        </li>
                        <li>
                            <a href="<%=path%>/WEB-INF/views/forms.jsp">报表</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                             <a href="<%=path%>/WEB-INF/views/login.jsp">退出登录</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <b1><%=request.getParameter("id")%></b1>
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
                        <form class="bs-example bs-example-form" name="outform" role="form" action="/Out/insertOut?id=<%=request.getParameter("id")%>" method="post">
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">类别</span>
                        <select class="form-control" onChange="getsort1()" name="outSort" style="width: 115px;">
                        <option value="-1">请选择</option>
                        <option value="0">衣</option>
                        <option value="1">食</option>
                        <option value="2">住</option>
                        <option value="3">行</option>
                        <option value="4">娱乐学习</option>
                        <option value="5">医疗保健</option>
                        <option value="6">其他</option>
                        </select>
                        <select class="form-control" data-live-search="true" name="outSort1" style="width: 115px;margin-left: 15px;">
                        <option value="-1">请选择</option>
                        </select>
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">时间</span>
                        <input type="text" class="form-control" name="date" >
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">金额</span>
                        <input type="text" class="form-control" name="outAmounts" style="width: 100px;">
                        <select class="form-control" name="unit" style="width: 130px;margin-left: 15px;">
                        <option value="1">人民币CNY</option>
                        <option value="2">美元USD</option>
                        <option value="3">日元JPY</option>
                        <option value="4">港元HKD</option>
                        <option value="5">英镑GBP</option>
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
                        <input type="text" class="form-control" name="object">
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">备注</span>
                        <input type="text" class="form-control" name="notes">
                        </div>
                        <br>
                        <button type="submit" class="button btn btn-info" onclick="yes()"><span class="  glyphicon glyphicon-plus"></span> 添加</button>
                        </form>
                        </div>
                        <div class="tab-pane" id="panel-2">
                        <form class="bs-example bs-example-form" name="inform" role="form" action="/In/insertIn">
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">类别</span>
                        <select class="form-control" onChange="getsort3()"  name="inSort" style="width: 115px;">
                        <option value="-1">请选择</option>
                        <option value="0">工资</option>
                        <option value="1">其他收入</option>
                        </select>
                        <select class="form-control" name="inSort1" style="width: 115px;margin-left: 15px;">
                        <option value="-1">请选择</option>
                        </select>
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">时间</span>
                        <input type="text" class="form-control" name="date">
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">金额</span>
                        <input type="text" class="form-control" name="inAmounts" style="width: 100px;">
                        <select class="form-control" name="unit" style="width: 130px;margin-left: 15px;">
                        <option value="1">人民币CNY</option>
                        <option value="2">美元USD</option>
                        <option value="3">日元JPY</option>
                        <option value="4">港元HKD</option>
                        <option value="5">英镑GBP</option>
                        </select>
                        </div>
                        <br>
                        <div class="input-group">
                        <span class="input-group-addon">备注</span>
                        <input type="text" class="form-control" name="notse">
                        </div>
                        <br>
                        <button  type="submit" class="button btn btn-info" onclick="yes()"><span class="  glyphicon glyphicon-plus"></span> 添加</button>
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
    var sort2=[
        ['衣服裤子','鞋帽包包','化妆饰品'],  // 0
        ['早中晚餐','烟酒茶','水果零食'],  // 1
        ['日常用品','水电煤气','房租','物业','维修保养'],  // 2
        ['公共交通','打车租车','私家车费用'],  // 3
        ['运动建设','学习用品','游戏娱乐','宠物用品','旅游度假'],  // 4
        ['药品','保健','美容'],  // 5
        ['备注写明'] 
    ];
    function getsort1(){
        var sort1=document.outform.sort1;   //获得类别1下拉框的对象
        var sltsort2=document.outform.sort2;     //获得类别2下拉框的对象
        var sort1=sort2[sort1.selectedIndex-1];    //得到对应sort1的sort2数组
        sltsort2.length=1;    //清空sort2下拉框，仅留提示选项。
        //通过for循环，将sort2中的值填充到sort2下拉框中
        for(var i=0;i<sort1.length;i++){
            sltsort2[i+1]=new Option(sort1[i],sort1[i]);
        }
    }
    </script>
    <script type="text/javascript">
    var sort4=[
        ['正常工资','加班费','奖金'],  // 0
        ['储蓄利息','投资利润','其他']  // 1
    ];
    function getsort3(){
        var sort3=document.inform.sort3;   //获得类别1下拉框的对象
        var sltsort4=document.inform.sort4;     //获得类别2下拉框的对象
        var sort3=sort4[sort3.selectedIndex-1];    //得到对应sort1的sort2数组
        sltsort4.length=1;    //清空sort2下拉框，仅留提示选项。
        //通过for循环，将sort2中的值填充到sort2下拉框中
        for(var i=0;i<sort3.length;i++){
            sltsort4[i+1]=new Option(sort3[i],sort3[i]);
        }
    }
    </script>
</body>
</html>