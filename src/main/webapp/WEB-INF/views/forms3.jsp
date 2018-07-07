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
        <a class="button button1"  href="file:///E:/%E5%89%8D%E7%AB%AF/%E7%AE%A1%E5%AE%B6%E5%A9%86/%E6%8A%A5%E8%A1%A8.html" role="button" style="padding-top:10%">日常支出表</a><br>
        <a class="button button2"  href="file:///E:/%E5%89%8D%E7%AB%AF/%E7%AE%A1%E5%AE%B6%E5%A9%86/%E6%8A%A5%E8%A1%A82.html" role="button" style="padding-top:10%">收支趋势表</a><br>
        <a class="button button3"  href="file:///E:/%E5%89%8D%E7%AB%AF/%E7%AE%A1%E5%AE%B6%E5%A9%86/%E6%8A%A5%E8%A1%A83.html" role="button" style="padding-top:10%">成员收支表</a><br>
        <button class="button button4">暂时闲置</button><br>
        </div>
        <div id="container" style="width: 600px; height: 400px; position: absolute; margin-top: 40px;margin-left: 320px;"></div>
        <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('container'));
        // 指定图表的配置项和数据
        var option = {
    tooltip: {
        trigger: 'axis',
        axisPointer: { // 坐标轴指示器，坐标轴触发有效
            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    legend: {
        data: ['利润', '支出', '收入']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: [{
        type: 'value'
    }],
    yAxis: [{
        type: 'category',
        axisTick: {
            show: false
        },
        data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
    }],
    series: [{
        name: '利润',
        type: 'bar',
        label: {
            normal: {
                show: true,
                position: 'inside'
            }
        },
        data: [200, 170, 240, 244, 200, 220, 210]
    }, {
        name: '收入',
        type: 'bar',
        stack: '总量',
        label: {
            normal: {
                show: true
            }
        },
        data: [320, 302, 341, 374, 390, 450, 420]
    }, {
        name: '支出',
        type: 'bar',
        stack: '总量',
        label: {
            normal: {
                show: true,
                position: 'left'
            }
        },
        data: [-120, -132, -101, -134, -190, -230, -210]
    }]
};
        myChart.setOption(option);// 显示图表。
    </script>
    
</div>
</div>
</div>
</body>
</html>