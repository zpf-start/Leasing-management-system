<%--
  Created by IntelliJ IDEA.
  User: zpf
  Date: 2020/3/8
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>忘记密码-租聘信息后台管理系统</title>


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

    <style>

    </style>
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="${pageContext.servletContext.contextPath}/index.jsp"><b>租聘信息</b>后台管理系统</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">重置你的密码</p>

        <form>
            <div id="beforeSend">
                <div class="form-group has-feedback">
                    输入您的用户帐户的已验证电子邮件地址，我们将向您发送密码重置链接。
                </div>
                <div class="form-group has-feedback">
                    <input type="email" class="form-control" name="email" placeholder="输入您的邮箱地址">
                    <span class="fa fa-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <button type="submit" id="send" class="btn btn-primary btn-block btn-flat">发送</button>
                </div>
            </div>
        </form>

        <div id="afterSend" style="display: none;">
            <div class="form-group has-feedback">
                检查您的电子邮件以获取重置密码的链接。如果几分钟后仍未出现，请检查您的垃圾邮件文件夹。
            </div>
            <div class="form-group has-feedback">
                <button type="submit" class="btn btn-primary btn-block btn-flat" onclick="location.href='${pageContext.servletContext.contextPath}/login.jsp'">返回登录</button>
            </div>
        </div>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="${pageContext.servletContext.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script>

    //是否能够点击（默认是）
    var enableClick = true;

    //向服务器发送请求
    $("form").submit(function () {
        if(enableClick==false){
            return false;
        }
        //用户不可点击
        enableClick = false;
        var sendCodeStart = "发送中";
        var sendCodeEnd = sendCodeStart+". . . . ";
        var str = sendCodeStart;
        var this_ = this;   //当前email的input对象
        var baseText = $('#send').text();
        //改变提示文字 发送中...
        //修改字体颜色，变浅
        $('#send').attr("color","#aec3ce !important");
        var interval = setInterval(
            function(){
                if(str==sendCodeEnd){
                    str = sendCodeStart;
                }
                $('#send').text(str);
                str += ". ";
            },600);

        $.post("${pageContext.servletContext.contextPath}/user/sendResetRef",$("form").serialize(),function (data) {
            if(data!=null){
                if(data.flag==true){   //发送成功
                    clearInterval(interval);    //停止显示发送中...
                    $('#send').text(baseText);//显示原来的字体
                    $('#beforeSend').css('display','none');    //隐藏发送页面
                    $('#afterSend').css('display','block');    //显示发送成功的页面
                    enableClick = true; //用户可点击
                }else{  //发送失败
                    clearInterval(interval);    //停止显示发送中...
                    $('#send').text(baseText);  //显示原来的字体
                    $('#afterSend').css('display','none');     //隐藏发送成功的页面
                    $('#beforeSend').css('display','block');    //显示发送页面
                    enableClick = true; //用户可点击
                    //显示错误信息
                    alert(data.errorInfo);
                }
            }
        });
        return false;
    });

    //表单中不能输入空格
    $(":input").keydown(function (e) {
        var code = e.keyCode;
        if(code == 32){  //输入空格
            e.preventDefault();  //不让输入
        }
    });

</script>
</body>

</html>