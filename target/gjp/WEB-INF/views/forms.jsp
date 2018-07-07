<!DOCTYPE html>
<html>
<head>
<meta  charset="utf-8">
<title>报表记录</title>
<script type="text/javascript">
</script>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<link rel="stylesheet" href="../../bootstrap3.3.7/css/bootstrap.min.css">
<script src="../../js/jquery-3.2.1.min.js"></script>
<script src="../../bootstrap3.3.7/js/bootstrap.min.js"></script>
<script src="../../js/echarts.min.js"></script>

<link href="../../css/table.css" rel="stylesheet" type="text/css" />
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
                        <li>
                            <a href="/user/login?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>"><span class="glyphicon glyphicon-user"></span> 账户</a>
                        </li>
                        <li>
                            <a href="/user/SkipToInout?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>"><span class="glyphicon glyphicon-th-list"></span> 记账</a>
                        </li>
                        <li class="active">
                            <a href="/user/SkipToForms?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>"><span class="glyphicon glyphicon-stats"></span> 报表</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                             <a href="<%=path%>/login.jsp">退出登录</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="row clearfix">
    <div class="inner">
        <div id="container" style="width: 600px; height: 400px; position: absolute; margin-top: 40px;margin-left: 220px;"></div>
        <script type="text/javascript">

        var sort1 = <%=request.getAttribute("sort1")%>;
        var sort2 = <%=request.getAttribute("sort2")%>;
        var sort3 = <%=request.getAttribute("sort3")%>;
        var sort4 = <%=request.getAttribute("sort4")%>;
        var sort5 = <%=request.getAttribute("sort5")%>;
        var sort6 = <%=request.getAttribute("sort6")%>;
        var sort7 = <%=request.getAttribute("sort7")%>;
        var myChart = echarts.init(document.getElementById('container'));
        // 指定图表的配置项和数据
        var option = {
        title : {
            text: '本月支出',
            subtext: '2018.1',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['衣','食','住','行','娱乐学习','医疗保健','其他']
        },
        series : [
        {
            name: '访问来源',
            type: 'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:sort1, name:'衣'},
                {value:sort2, name:'食'},
                {value:sort3, name:'住'},
                {value:sort4, name:'行'},
                {value:sort5, name:'娱乐学习'},
                {value:sort6, name:'医疗保健'},
                {value:sort7, name:'其他'}
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
        ]
        };
        myChart.setOption(option);// 显示图表。
    </script>
    
</div>
</div>
</div>
</body>
</html>