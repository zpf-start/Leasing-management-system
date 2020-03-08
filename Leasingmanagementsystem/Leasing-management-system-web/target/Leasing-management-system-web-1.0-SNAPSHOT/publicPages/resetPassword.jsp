<%--
  Created by IntelliJ IDEA.
  User: zpf
  Date: 2020/3/7
  Time: 1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>修改密码-租聘信息后台管理系统</title>


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

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="${pageContext.servletContext.contextPath}/index"><b>租聘信息</b>后台管理系统</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">修改"${user.username}"用户的密码</p>

        <form>
            <input type="hidden" name="userId" value="${user.userId}">  <%--用户的id--%>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="password" required name="password" placeholder="新密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="password2" required placeholder="确认密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <button type="submit" class="btn btn-primary btn-block btn-flat">确认重置</button>
            </div>
            <!-- /.col -->
        </form>
        <!-- /.social-auth-links -->
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="${pageContext.servletContext.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script>

    //表单中不能输入空格
    $(":input").keydown(function (e) {
        var code = e.keyCode;
        if(code == 32){  //输入空格
            e.preventDefault();  //不让输入
        }
    });

    //用户登录
    $("form").submit(function () {
        //表单验证
        if($('#password').val()==null||$('#password').val()==""
            || $('#password2').val()==null||$('#password2').val()==""
        ){
            alert("请将表单信息填写完整");
            return false;
        }
        if($('#password').val()!=$('#password2').val()){
            alert("密码不一致");
            return false;
        }
        $.post("${pageContext.servletContext.contextPath}/user/resetPassword",$("form").serialize(),function (data) {
            if(data!=null){
                if(data.flag==true){   //修改成功
                    //显示操作正确信息
                    alert(data.successInfo);
                    //跳转到登录页面
                    location.href="${pageContext.servletContext.contextPath}/login.jsp"
                }else{  //登录失败
                    //显示操作错误信息
                    alert(data.errorInfo);
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