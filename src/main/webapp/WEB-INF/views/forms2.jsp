<!DOCTYPE html>
<html>
<head>
<meta  charset="utf-8">
<title>报表记录</title>
<script type="text/javascript">
</script>

<link rel="stylesheet" href="bootstrap3.3.7/css/bootstrap.min.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="bootstrap3.3.7/js/bootstrap.min.js"></script>
<script src="js/echarts.min.js"></script>

<link href="css/table.css" rel="stylesheet" type="text/css" />
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
                            <a href="file:///E:/web/project/account.html">账户</a>
                        </li>
                        <li>
                            <a href="file:///E:/web/project/inout.html">记账</a>
                        </li>
                        <li class="active">
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
        <div class="choose">
        <a class="button button1"  href="file:///E:/web/project/forms.html" role="button" style="padding-top:10%">日常支出表</a><br>
        <a class="button button2"  href="file:///E:/web/project/forms2.html" role="button" style="padding-top:10%">成员收支表</a><br>
        <a class="button button3"  href="file:///E:/web/project/forms.html" role="button" style="padding-top:10%">暂时闲置</a><br>
        <button class="button button4">暂时闲置</button><br>
        </div>
        <div id="container" style="width: 600px; height: 400px; position: absolute; margin-top: 40px;margin-left: 320px;"></div>
        <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('container'));
        // 指定图表的配置项和数据
        var option = {
        title : {
            text: '成员支出',
            subtext: '2017.12.1',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['成员1','成员2','成员3','成员4','成员5']
        },
        series : [
        {
            name: '访问来源',
            type: 'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:353, name:'成员1'},
                {value:310, name:'成员2'},
                {value:234, name:'成员3'},
                {value:135, name:'成员4'},
                {value:158, name:'成员5'}
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