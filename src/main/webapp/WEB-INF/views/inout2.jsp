<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %><%--启用EL表达式--%>
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
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>

    <link rel="stylesheet" href="../../bootstrap3.3.7/css/bootstrap.min.css">
    <script src="../../js/jquery-3.2.1.min.js"></script>
    <script src="../../bootstrap3.3.7/js/bootstrap.min.js"></script>
    <link href="<%=basePath%>css/record.css" rel="stylesheet" type="text/css" />

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
                            <a href="/user/login?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>"><span class="glyphicon glyphicon-user"></span> 账户</a>
                        </li>
                        <li class="active">
                            <a href="/user/SkipToInout?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>"><span class="glyphicon glyphicon-th-list"></span> 记账</a>
                        </li>
                        <li>
                            <a href="/user/SkipToForms?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>"><span class="glyphicon glyphicon-stats"></span> 报表</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="<%=path%>/login.jsp"><span class="glyphicon glyphicon-log-out"></span> 退出登录</a>
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
                                <form class="bs-example bs-example-form" name="outform" role="form" action="/Out/insertOut?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>" method="post">
                                    <br>
                                    <div class="input-group">
                                        <span class="input-group-addon">类别</span>
                                        <select class="form-control" onChange="getsort1()" name="outSort" style="width: 115px;">
                                            <option value="-1">请选择</option>
                                            <option value="衣">衣</option>
                                            <option value="食">食</option>
                                            <option value="住">住</option>
                                            <option value="行">行</option>
                                            <option value="娱乐学习">娱乐学习</option>
                                            <option value="医疗保健">医疗保健</option>
                                            <option value="其他">其他</option>
                                        </select>
                                        <select class="form-control" data-live-search="true" name="outSort1" style="width: 115px;margin-left: 15px;">
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
                                        <input type="text" class="form-control" name="outAmounts" style="width: 100px;">
                                        <select class="form-control" name="unit" style="width: 130px;margin-left: 15px;">
                                            <option value="人民币CNY">人民币CNY</option>
                                            <option value="美元USD">美元USD</option>
                                            <option value="日元JPY">日元JPY</option>
                                            <option value="港元HKD">港元HKD</option>
                                            <option value="英镑GBP">英镑GBP</option>
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
                                <form class="bs-example bs-example-form" name="inform" role="form" action="/In/insertIn?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>" method="post">
                                    <br>
                                    <div class="input-group">
                                        <span class="input-group-addon">类别</span>
                                        <select class="form-control" onChange="getsort3()"  name="inSort" style="width: 115px;">
                                            <option value="-1">请选择</option>
                                            <option value="工资">工资</option>
                                            <option value="其他收入">其他收入</option>
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
                                            <option value="人民币CNY">人民币CNY</option>
                                            <option value="美元USD">美元USD</option>
                                            <option value="日元JPY">日元JPY</option>
                                            <option value="港元HKD">港元HKD</option>
                                            <option value="英镑GBP">英镑GBP</option>
                                        </select>
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <span class="input-group-addon">备注</span>
                                        <input type="text" class="form-control" name="notes">
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
                        <input type="text" class="form-control" name="sort"><span class="input-group-btn"><button class="btn btn-default" type="submit" href="/User/SelectSort?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>">类别查询</button></span>
                    </div>
                </form>
            </div>
            <div class="bord2">
                <div class="record">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#panel-3" data-toggle="tab">支出记录</a></li>
                        <li><a href="#panel-4" data-toggle="tab">收入记录</a></li>
                        <li class="dropdown">
                            <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">按时间
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                                <li><a href="/user/YesterdayInout?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>">昨天</a></li>
                                <li><a href="/user/SevenDayInout?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>">最近七天</a></li>
                                <li><a href="/user/MonthInout?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>">最近一月</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" id="myTabDrop2" class="dropdown-toggle" data-toggle="dropdown">按金额
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                                <li><a href="/user/Amo500?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>">低于500</a></li>
                                <li><a href="/user/Amo2000?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>">500~2000</a></li>
                                <li><a href="/user/Amobeyond2000?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>">高于2000</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active record1" id="panel-3">
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <th>类别</th>
                                    <th>时间</th>
                                    <th>金额</th>
                                    <th>地点</th>
                                    <th>消费对象</th>
                                    <th>备注</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${outList}" var="outList">
                                    <tr>
                                        <td>${outList.outSort}</td>
                                        <td>${outList.date}</td>
                                        <td>${outList.outAmounts}</td>
                                        <td>${outList.unit}</td>
                                        <td>${outList.place}</td>
                                        <td>${outList.object}</td>
                                        <td>${outList.notes}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane record2" id="panel-4">
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <th>类别</th>
                                    <th>时间</th>
                                    <th>金额</th>
                                    <th>备注</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${inList}" var="inList">
                                    <tr>
                                        <td>${inList.inSort}</td>
                                        <td>${inList.date}</td>
                                        <td>${inList.inAmounts}</td>
                                        <td>${inList.notes}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    var outsort1=[
        ['衣服裤子','鞋帽包包','化妆饰品'],  // 0
        ['早中晚餐','烟酒茶','水果零食'],  // 1
        ['日常用品','水电煤气','房租','物业','维修保养'],  // 2
        ['公共交通','打车租车','私家车费用'],  // 3
        ['运动建设','学习用品','游戏娱乐','宠物用品','旅游度假'],  // 4
        ['药品','保健','美容'],  // 5
        ['备注写明']
    ];
    function getsort1(){
        var sort=document.outform.outSort;   //获得类别1下拉框的对象
        var sltsort1=document.outform.outSort1;     //获得类别2下拉框的对象
        var sort=outsort1[sort.selectedIndex-1];    //得到对应sort1的sort2数组
        sltsort1.length=1;    //清空sort2下拉框，仅留提示选项。
        //通过for循环，将sort2中的值填充到sort2下拉框中
        for(var i=0;i<sort.length;i++){
            sltsort1[i+1]=new Option(sort[i],sort[i]);
        }
    }
</script>
<script type="text/javascript">
    var insort1=[
        ['正常工资','加班费','奖金'],  // 0
        ['储蓄利息','投资利润','其他']  // 1
    ];
    function getsort3(){
        var sort=document.inform.inSort;   //获得类别1下拉框的对象
        var sltsort1=document.inform.inSort1;     //获得类别2下拉框的对象
        var sort=insort1[sort.selectedIndex-1];    //得到对应sort1的sort2数组
        sltsort1.length=1;    //清空sort2下拉框，仅留提示选项。
        //通过for循环，将sort2中的值填充到sort2下拉框中
        for(var i=0;i<sort.length;i++){
            sltsort1[i+1]=new Option(sort[i],sort[i]);
        }
    }
</script>
</body>
</html>