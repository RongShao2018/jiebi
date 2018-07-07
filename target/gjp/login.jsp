<!DOCTYPE html>
<html>
<head>
    <meta  charset="utf-8">
    <title>管家婆</title>
    <% String path = request.getContextPath(); %>
    <script type="text/javascript">
        function check(f){
            if(f.user.value==""){
                alert("请输入用户名！");//弹出提示框
                f.user.focus();//文本框获取焦点
                return false;}
            if(f.pw.value==""){
                alert("请输入密码！");
                f.pw.focus();
                return false;}
            return false;
        }
    </script>
    <link rel="stylesheet" href="bootstrap3.3.7/css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap3.3.7/js/bootstrap.min.js"></script>
    <link href="<%=path %>/css/load.css" rel="stylesheet" type="text/css" />
</head>

<body style="background-image:url();background-position:center; background-repeat:repeat-y">
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    管家婆 <small>专业的记账工具</small>
                </h1>
            </div>
            <div class="tabbable" >
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-1" data-toggle="tab">登录</a>
                    </li>
                    <li>
                        <a href="#panel-2" data-toggle="tab">注册</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-1">
                        <div class="loadpage">
                            <form class="form-signin" onsubmit="return check(this)" action="/user/login">
                                <div class="input-group">
                                    <span ></span>
                                    <input placeholder="用户名" id="id" class="form-control" type = text name = id /></div><br>
                                <div class="input-group">
                                    <span ></span>
                                    <input placeholder="密码" id="password" class="form-control" type = password name = password />
                                </div>
                                <button class="button" type="submit"><span>登录 </span></button><br>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane" id="panel-2">
                        <div class="loadpage">
                            <form class="form-signin" onsubmit="return check(this)" action="/user/regist">
                                <div class="input-group">
                                    <span ></span>
                                    <input placeholder="用户ID" id="id1" class="form-control" type = text name = id1 /></div><br>
                                <div class="input-group">
                                    <span ></span>
                                    <input placeholder="密码" id="password1" class="form-control" type = password name = password1 />
                                </div><br>
                                <div class="input-group">
                                    <span ></span>
                                    <input placeholder="资金" id="capital1" class="form-control" type = text name = capital1 /></div><br>
                                <button class="button" type="submit"><span>注册 </span></button><br>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel slide" id="carousel-279135">
                <ol class="carousel-indicators">
                    <li data-slide-to="0" data-target="#carousel-279135">
                    </li>
                    <li data-slide-to="1" data-target="#carousel-279135" class="active">
                    </li>
                    <li data-slide-to="2" data-target="#carousel-279135">
                    </li>
                </ol>
                <div class="carousel-inner">
                    <div class="item">
                        <img alt="" src="img/loading1.jpg" />
                        <div class="carousel-caption">
                            <h4>
                            </h4>
                        </div>
                    </div>
                    <div class="item active">
                        <img alt="" src="img/loading2.jpg" />
                        <div class="carousel-caption">
                            <h4>
                            </h4>
                        </div>
                    </div>
                    <div class="item">
                        <img alt="" src="img/loading3.jpg" />
                        <div class="carousel-caption">
                            <h4>
                            </h4>
                        </div>
                    </div>
                </div> <a class="left carousel-control" href="#carousel-279135" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-279135" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>