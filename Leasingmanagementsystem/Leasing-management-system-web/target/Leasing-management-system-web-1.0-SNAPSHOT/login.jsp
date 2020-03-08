<%--
  Created by IntelliJ IDEA.
  User: zpf
  Date: 2020/3/8
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>登录-租聘信息后台管理系统</title>


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
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/iCheck/square/blue.css">
    <script>
        //session中有登录操作返回的数据
        <c:if test="${sessionScope.loginFailed!=null}">
            <c:choose>
                <c:when test="${loginFailed.flag==false}">  //登录失败
                    //将表单中的数据填充为原始数据
                    $("#username").val("${loginFailed.object[0].username}"); //原始用户名
                    $("#password").val("${loginFailed.object[0].password}"); //原始密码
                    $("#codeInput").val("${loginFailed.object[1].loginValidateCode}"); //原始验证码
                    //是否之前有选择过自动登录
                    if("${loginFailed.object[1].autoLogin}"!=""){   //有选择自动登录
                        //选中自动登录
                        $("#autoLogin").css("checked",checked);
                    }
                    //输出登录失败信息
                    alert("${loginFailed.errorInfo}");
                </c:when>
                <c:otherwise>   //登录成功
                    <%--if('${loginFailed.successInfo}'!=""){   //如果存在 成功提示信息则提示--%>
                    <%--    alert('${loginFailed.successInfo}');    //输出登录成功信息--%>
                    <%--}--%>
                    //跳转到index主页
                    location.href="${pageContext.servletContext.contextPath}/index";
                </c:otherwise>
            </c:choose>
            //删除session中的loginFailed
            <c:remove var="loginFailed" scope="session"></c:remove>
        </c:if>
    </script>
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">


        <a href="${pageContext.servletContext.contextPath}/index"><b>租聘信息</b>后台管理系统</a>


    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录系统</p>

        <form action="${pageContext.servletContext.contextPath}/user/loginInner" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" id="username" name="username" placeholder="用户名/邮箱">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" id="password" name="password" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" id="codeInput" style="width: 72% !important;float: left"
                       name="loginValidateCode" placeholder="验证码">
                <a href="javascript:void(0);">
                    <img style="width:80px;height:34px; margin-left:0.8rem;" id="code" onclick="getCode()"
                         src="${pageContext.servletContext.contextPath}/user/validateCodeLogin">
                </a>
                </a>
                <a href="javascript:void(0);" onclick="getCode()">看不清</a>
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label><input type="checkbox" id="autoLogin" name="autoLogin" value="1"> 记住 下次自动登录</label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
            <div style="display:flex;justify-content: space-around ">
                <!--                    <div class="col-xs-8" >-->
                <a href="${pageContext.servletContext.contextPath}/register.jsp">新用户注册</a>
                <a href="${pageContext.servletContext.contextPath}/publicPages/sendResetRef.jsp">忘记密码</a>
                <!--                    </div>-->
            </div>
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

    //获取新的验证码
    function getCode() {
        $("#code").attr("src", "${pageContext.servletContext.contextPath}/user/validateCodeLogin?" + new Date().getTime());
    }

    //用户登录
    $("form").submit(function () {
        //表单验证
        if ($('#username').val() == null || $('#username').val() == ""
            || $('#password').val() == null || $('#password').val() == ""
            || $('#codeInput').val() == null || $('#codeInput').val() == "") {
            alert("请将表单填写完整");
            return false;
        }
    });

    //表单中不能输入空格
    $(":input").keydown(function (e) {
        var code = e.keyCode;
        if (code == 32) {  //输入空格
            console.log(code + "in");
            e.preventDefault();  //不让输入
        }
    });

    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>

</html>
