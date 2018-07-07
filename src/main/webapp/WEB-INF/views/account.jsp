<!DOCTYPE html>
<html>
<head>
    <meta  charset="utf-8">
    <title>账户概览</title>
    <script type="text/javascript">
    </script>

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>

    <link rel="stylesheet" href="../../bootstrap3.3.7/css/bootstrap.min.css">
    <script src="../../js/jquery-3.2.1.min.js"></script>
    <script src="../../bootstrap3.3.7/js/bootstrap.min.js"></script>
    <link href="<%=basePath %>css/account.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=basePath %>css/buttons.css">

    <script>
        function changebudget()
        {
            var budget; //money变量，用来存储用户输入的设定。
            budget = prompt("请输入本月的预算");
            if(budget!=null&&budget!="")
            {
                x=document.getElementById("num_budget");
                x.innerHTML=budget;
                var href1 = '/user/login?updateBudget=1&id=<%=request.getAttribute("msg")%>&password=<%=request.getAttribute("msg5")%>&uBudget='+budget;
                location.href = href1;
            }
        }
    </script>
    <script>

        function checkadmin()
        {
            var id = '<%=request.getAttribute("msg")%>';


            if(id.substring(2,3)!="1")
            {

                alert("您不是家长，没有此权限！");

            }
            else
            {
                var href1='/user/SkipToFaccount?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>';
                location.href = href1;

            }
        }
    </script>



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
                        <li class="active">
                            <a href="/user/login?id=<%=request.getAttribute("msg")%>&password=<%=request.getAttribute("msg5")%>"><span class="glyphicon glyphicon-user"></span> 账户</a>
                        </li>
                        <li>
                            <a href="/user/SkipToInout?id=<%=request.getAttribute("msg")%>&password=<%=request.getAttribute("msg5")%>"><span class="glyphicon glyphicon-th-list"></span> 记账</a>
                        </li>
                        <li>
                            <a href="/user/SkipToForms?id=<%=request.getAttribute("msg")%>&password=<%=request.getAttribute("msg5")%>"><span class="glyphicon glyphicon-stats"></span> 报表</a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" onclick="checkadmin()" style="background-color: #FFFBFA;"><span class="glyphicon glyphicon-home"></span> 家庭</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="/login.jsp"><span class="glyphicon glyphicon-log-out"></span> 退出登录</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="row clearfix">
        <div class="inner">
            <div class="budget">
                <div class="bud">
                    <h3 style="color:#C70039">本月预算额度：</h3>
                    <span id ="num_budget" ></span><br><br>
                    <h3 style="color:#2EB872">本月已经使用：</h3>
                    <span id="num_used" ></span><br><br>
                    <h3 style="color:#155263">剩余可用额度：</h3>
                    <span id="num_unused" ></span><br><br>
                </div>
                <br>
                <br>
                <button class="button button-glow button-rounded button-raised button-primary" type="button" onclick="javascript:return changebudget()" style="margin-left: 25px;"><span>重新设置额度 </span></button><br>
            </div>
            <div class="asset">
                <h1>总资产</h1>
                <hr style="height:2px;background-color:black;margin-top: -2px;" />
                <span id="num_zichan">11</span>
            </div>
            <div class="statistics">
                <h2>收支表</h2>
                <hr style="height:2px;background-color:black;margin-top: -2px;" />
                <table class="table table-condensed table-hover" >
                    <thead>
                    <tr>
                        <th> </th>
                        <th>今日</th>
                        <th>最近七天</th>
                        <th>本月份</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>收入</td>
                        <td><span id="num_todayin" ></span></td>
                        <td><span id="num_weekin" ></span></td>
                        <td><span id="num_monthin" ></span></td>
                    </tr>
                    <tr>
                        <td>支出</td>
                        <td><span id="num_todayout" ></span></td>
                        <td><span id="num_weekout" ></span></td>
                        <td><span id="num_monthout" ></span></td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

<script language="JavaScript">
    var Capital1 = <%=request.getAttribute("msg1")%>;
    var Capital2 = <%=request.getAttribute("msg2")%>;
    var Capital3 = <%=request.getAttribute("msg3")%>;
    var Capital4 = <%=request.getAttribute("msg4")%>;
    var Capital6 = <%=request.getAttribute("msg6")%>;
    var Capital7 = <%=request.getAttribute("msg7")%>;
    var Captial8 = <%=request.getAttribute("msg8")%>;
    var Budget = <%=request.getAttribute("MonthBudget")%>
    var num_zichan =document.getElementById("num_zichan");
    var num_todayout = document.getElementById("num_todayout");
    var num_weekout = document.getElementById("num_weekout");
    var num_monthout = document.getElementById("num_monthout");
    var num_budget = document.getElementById("num_budget");
    var num_used = document.getElementById("num_used");
    var num_unused = document.getElementById("num_unused");
    var num_todayin = document.getElementById("num_todayin");
    var num_weekin = document.getElementById("num_weekin");
    var num_monthin = document.getElementById("num_monthin");

    num_zichan.innerHTML = Capital1.toFixed(2);
    num_todayout.innerHTML = Capital2.toFixed(2);
    num_weekout.innerHTML = Capital3.toFixed(2);
    num_monthout.innerHTML = Capital4.toFixed(2);
    num_todayin.innerHTML = Capital6.toFixed(2);
    num_weekin.innerHTML = Capital7.toFixed(2);
    num_monthin.innerHTML = Captial8.toFixed(2);
    num_budget.innerHTML = Budget.toFixed(2);
    num_used.innerHTML = Capital4.toFixed(2);
    num_unused.innerHTML = (Budget-Capital4).toFixed(2);

</script>
</body>
</html>