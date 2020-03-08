<%--
  Created by IntelliJ IDEA.
  User: zpf
  Date: 2020/3/8
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <style>
        .father-code{
            position: relative;
        }
        .code{
            position: absolute;
            right:10px;
            top: 7px;
        }
        .sendCode{
            color: #aec3ce !important;
        }
    </style>

    <title>
        注册-租聘信息后台管理系统</title>


    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- Theme style -->
    <!-- iCheck -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/iCheck/square/blue.css">
</head>

<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">


        <a href="${pageContext.servletContext.contextPath}/index"><b>租聘信息</b>后台管理系统</a>


    </div>

    <div class="register-box-body" id="app">
        <p class="login-box-msg">新用户注册</p>

        <form>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="username" id="username" autofocus required placeholder="全名">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="password" id="password" required placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" required id="password2"  placeholder="确认密码">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" class="form-control" name="email" required id="email" placeholder="邮箱">
                <span class="fa fa-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" required placeholder="手机号">
                <span class="fa fa-phone form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback" style="text-align: center">
                <label><input type="radio" name="gender" value="0" checked>男</label>
                <label><input type="radio" name="gender" value="1">女</label>
            </div>
            <div class="form-group has-feedback father-code" >
                <input type="text" class="form-control" required name="code" id="code" placeholder="验证码">
                <a href="javascript:void(0);" id="sendCode" class="code">发送验证码</a>
            </div>
            <div class="row" >
                <!-- /.col -->
                <div class="col-xs-12">
                    <a href="/Leasing_management_system_web_war_exploded/publicPages/login.jsp">我有账号，现在就去登录</a>
                    <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                </div>
                <!-- /.col -->
            </div>
        </form>


    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="${pageContext.servletContext.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script>

    //redis验证码的key
    var key = "";
    //用户是否能够点击（默认能够点击）
    var enableClick = true;
    //用户是否验证码(默认未发送)
    var notSendCode = true;
    //用户名是否存在(默认不存在)
    var existUsername = false;
    //后端用户名是否存在的提示信息
    var existUsernameService = "";
    //邮箱是否已存在（默认已存在）
    var existEmail = true;
    //后端邮箱是否存在的提示信息
    var existEmailService = "";

    //表单中不能输入空格
    $(":input").keydown(function (e) {
        var code = e.keyCode;
        if(code == 32){  //输入空格
            e.preventDefault();  //不让输入
        }
    });

    //用户名唯一检查
    $('#username').change(function () {
        //获取用户名
        var username = $('#username').val();
        //发送请求
        $.post("${pageContext.servletContext.contextPath}/user/existUsernameRegister","username="+username,function (data) {
            if(data!=null){
                if(data.flag==false){
                    existUsername = true;   //设置标识为true标识已存在该用户
                    existUsernameService = data.errorInfo;
                    alert(existUsernameService);
                }else{
                    alert(data.successInfo);
                    existUsername = false;  //用户名可用
                }
            }
        });
    });

    //邮箱唯一检查
    $('#email').change(function () {
        //获取邮箱
        var email = $('#email').val();
        if(email==null || email==""){   //邮箱未填写不发送请求
            return false;
        }
        //发送请求
        $.post("${pageContext.servletContext.contextPath}/user/existEmailRegister","email="+email,function (data) {
            if(data!=null){
                if(data.flag==false){
                    existEmail = true;   //设置标识为true标识已存在该邮箱
                    existEmailService = data.errorInfo;
                    alert(existEmailService);
                }else{
                    alert(data.successInfo);
                    existEmail = false;  //邮箱可用
                }
            }
        });
    });

    //发送验证码，并接收key
    $('#sendCode').click(function(){
        //用户不可点击
        if(enableClick==false){    //发送验证码后30秒后才能点击重发
            return false;
        }
        if(existUsername == true){  //用户名已存在，不可发送验证码
            alert(existUsernameService);
            return false;
        }
        var email=$("#email").val();    //获取邮箱地址
        if(email==null || email==""){ //邮箱为空不能发送
            alert("请填写邮箱地址");
            return false;
        }
        var sendCodeStart = "发送中";
        var sendCodeEnd = sendCodeStart+". . . . ";
        var str = sendCodeStart;
        var this_ = this;   //当前email的input对象
        var baseText = $(this).text();
        //改变提示文字 发送中...
        //修改字体颜色，变浅
        $(this_).attr("color","#aec3ce !important");
        var interval = setInterval(
            function(){
                if(str==sendCodeEnd){
                    str = sendCodeStart;
                }
                $(this_).text(str);
                str += ". ";
            },600);
        //用户不可点击
        enableClick = false;

        //真正发送验证码
        $.post("${pageContext.servletContext.contextPath}/user/saveNameAndCodeToRedisRegister","email="+email,function(data){
            notSendCode = false;    //表示用户发送过验证码
            var time = 30;  //30秒后可重新发送
            //停止显示发送中
            clearInterval(interval);
            //显示30秒后重发
            var interval1 = setInterval(function(){
                $(this_).html("("+time+")秒后重新发送");
                time -= 1;
                if(time <= 0){
                    clearInterval(interval1);
                    $(this_).removeClass("sendCode");
                }
            },1000);
            //改变为原来的样子
            setTimeout(function () {
                $(this_).html(baseText);
                //用户可点击
                enableClick = true;
            },time*1000);
            //获取后端的key
            if(data!=null){
                if(data.flag==true){
                    key = data.successInfo;
                }
            }
        });
    });

    //回车触发提交表单事件
    $("body").keydown(function (e) {
        if(e.keyCode == 13){    //按下回车
            $("form").trigger("submit");
        }
    });

    //用户注册
    $("form").submit(function () {
        //表单验证
        if($('#username').val()==null||$('#username').val()==""
            || $('#password').val()==null||$('#password').val()==""
            || $('#password2').val()==null||$('#password2').val()==""
            || $('#email').val()==null||$('#email').val()==""
            || $('#phoneNumber').val()==null||$('#phoneNumber').val()==""
            || $('#code').val()==null||$('#code').val()==""
            ||existUsername == true
            ||notSendCode == true
            ||existEmail == true){
            if(existUsername == true){
                alert(existUsernameService);
            }else if(existEmail == true){
                alert(existEmailService);
            }else if(enableClick==false){
                alert("请等待验证码发送完毕");
            }else if(notSendCode==true){
                alert("请发送验证码");
            }else{
                alert("请将表单信息填写完整");
            }
            return false;
        }
        //真正注册用户
        $.post("${pageContext.servletContext.contextPath}/user/register",$("form").serialize()+"&key="+key,function(data){
            if(data!=null){
                if(data.flag==true){    //注册成功
                    //输出提示语
                    alert(data.successInfo);
                    //跳转到登录页面
                    location.href="login.jsp"
                }else{
                    alert(data.errorInfo);  //注册失败
                }
            }
        });
        return false;
    });

    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>

</html>