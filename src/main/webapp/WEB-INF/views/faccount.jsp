<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %><%--启用EL表达式--%>
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
<link href="<%=basePath %>css/faccount.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=basePath %>css/buttons.css">


<script>
    function changebudget()
    {
        var budget; //money变量，用来存储用户输入的设定。
        budget = prompt("请输入本月的预算") ;
        if(budget!=null&&budget!="")
        {
            x=document.getElementById("fBudget");
            x.innerHTML=budget;

            var href1 = '/user/SkipToFaccount?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>&updateBudget=1&fBudget='+budget;
            location.href = href1;
        }
    }

</script>
<script>
    function changecapital()
    {
        var capital; //money变量，用来存储用户输入的设定。
        capital = prompt("请输入本月的预算") ;
        if(capital!=null&&capital!="")
        {
            x=document.getElementById("fCapital");
            x.innerHTML=capital;

            var href1 = '/user/SkipToFaccount?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>&updateCapital=1&fCapital='+capital;
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
                        <li>
                            <a href="/user/login?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>"><span class="glyphicon glyphicon-user"></span> 账户</a>
                        </li>
                        <li>
                            <a href="/user/SkipToInout?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>"><span class="glyphicon glyphicon-th-list"></span> 记账</a>
                        </li>
                        <li>
                            <a href="/user/SkipToForms?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>"><span class="glyphicon glyphicon-stats"></span> 报表</a>
                        </li>
                        <li class="active">
                            <a href="/user/SkipToFaccount?id=<%=request.getParameter("id")%>&password=<%=request.getParameter("password")%>" style="color:#827ae1;"><span class="glyphicon glyphicon-home"></span> 家庭</a>
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
            <div class="memberlist">
                <div style="width: 200px;height: 380px;margin-left: 10px;">
                <h4>家庭成员表</h4>
                <table class="table table-condensed table-hover" >
                <thead>
                    <tr>
                        <th>成员id</th>
                        <th>成员支出</th>
                        <th>成员收入</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${uFundList}" var="uFundList">
                    <tr>
                        <td>${uFundList.id}</td>
                        <td>${uFundList.uExpenditure}</td>
                        <td>${uFundList.uIncome}</td>
                    </tr>
                </c:forEach>
                </tbody>
                </table>
                </div>
            </div>
            <div class="information1">
            <br>
                <div class="mod1">
                    <h2>
                        本月家庭收入
                    </h2>
                    <span id="fIncome" name="fIncome"></span>
                </div>
                <div class="mod2">
                    <h2>
                        本月家庭预算
                    </h2>
                    <span id="fBudget" name="fBudget"></span>
                    <button class="button button-glow button-rounded button-raised button-primary" type="button" onclick="javascript:return changebudget()" style="margin-top: 70px;margin-left:20%;"><span>重新设置预算 </span></button><br>
                </div>
            </div>
            <div class="information2">
            <br>
                <div class="mod1">
                    <h2>
                        本月家庭支出
                    </h2>
                    <span id="fExpenditure" name="fExpenditure"></span>
                </div>
                <div class="mod2">
                    <h2>
                        家庭资金总量
                    </h2>
                    <span id="fCapital" name="fCapital"></span>
                    <button class="button button-glow button-rounded button-raised button-primary" type="button" onclick="javascript:return changecapital()" style="margin-top: 70px;margin-left:20%;"><span>重新设置资金 </span></button><br>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script language="JavaScript">
    var fIncome1 = <%=request.getAttribute("fIncome")%>;
    var fExpenditure1 = <%=request.getAttribute("fExpenditure")%>;
    var fBudget1 = <%=request.getAttribute("fBudget")%>;
    var fCapital1 = <%=request.getAttribute("fCapital")%>;
    var fIncome =document.getElementById("fIncome");
    var fExpenditure =document.getElementById("fExpenditure");
    var fBudget =document.getElementById("fBudget");
    var fCapital =document.getElementById("fCapital");
    fIncome.innerHTML = fIncome1;
    fExpenditure.innerHTML = fExpenditure1;
    fBudget.innerHTML = fBudget1;
    fCapital.innerHTML = fCapital1;
</script>
</body> 
</html>