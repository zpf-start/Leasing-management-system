<%--
  Created by IntelliJ IDEA.
  User: zpf
  Date: 2020/3/8
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>数据 - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">




    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- iCheck -->
    <!-- Morris chart -->
    <!-- jvectormap -->
    <!-- Date Picker -->
    <!-- Daterange picker -->
    <!-- Bootstrap time Picker -->
    <!--<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/${pageContext.servletContext.contextPath}/${pageContext.servletContext.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">-->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--数据表格-->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- Bootstrap Color Picker -->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--bootstrap-markdown-->
    <!-- Theme style -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <!-- Ion Slider -->
    <!-- ion slider Nice -->
    <!-- bootstrap slider -->
    <!-- bootstrap-datetimepicker -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->








    <!-- jQuery 2.2.3 -->
    <!-- jQuery UI 1.11.4 -->
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- Bootstrap 3.3.6 -->
    <!-- Morris.js charts -->
    <!-- Sparkline -->
    <!-- jvectormap -->
    <!-- jQuery Knob Chart -->
    <!-- daterangepicker -->
    <!-- datepicker -->
    <!-- Bootstrap WYSIHTML5 -->
    <!-- Slimscroll -->
    <!-- FastClick -->
    <!-- iCheck -->
    <!-- AdminLTE App -->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- bootstrap color picker -->
    <!-- bootstrap time picker -->
    <!--<script src="${pageContext.servletContext.contextPath}/${pageContext.servletContext.contextPath}/${pageContext.servletContext.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>-->
    <!-- Bootstrap WYSIHTML5 -->
    <!--bootstrap-markdown-->
    <!-- CK Editor -->
    <!-- InputMask -->
    <!-- DataTables -->
    <!-- ChartJS 1.0.1 -->
    <!-- FLOT CHARTS -->
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
    <!-- jQuery Knob -->
    <!-- Sparkline -->
    <!-- Morris.js charts -->
    <!-- Ion Slider -->
    <!-- Bootstrap slider -->
    <!-- bootstrap-datetimepicker -->
    <!-- 页面meta /-->

    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <header class="main-header">

        <!-- Logo -->
        <a href="${pageContext.servletContext.contextPath}/index" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>数据</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>数据</b>后台管理</span>
        </a>


        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">你有4个邮件</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <!-- start message -->
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${pageContext.servletContext.contextPath}/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                系统消息
                                                <small><i class="fa fa-clock-o"></i> 5 分钟前</small>
                                            </h4>
                                            <p>欢迎登录系统?</p>
                                        </a>
                                    </li>
                                    <!-- end message -->
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${pageContext.servletContext.contextPath}/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                团队消息
                                                <small><i class="fa fa-clock-o"></i> 2 小时前</small>
                                            </h4>
                                            <p>你有新的任务了</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${pageContext.servletContext.contextPath}/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                Developers
                                                <small><i class="fa fa-clock-o"></i> Today</small>
                                            </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${pageContext.servletContext.contextPath}/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                Sales Department
                                                <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                            </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img src="${pageContext.servletContext.contextPath}/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                            </div>
                                            <h4>
                                                Reviewers
                                                <small><i class="fa fa-clock-o"></i> 2 days</small>
                                            </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">See All Messages</a></li>
                        </ul>
                    </li>
                    <!-- Notifications: style can be found in dropdown.less -->
                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">你有10个新消息</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-warning text-yellow"></i> Very long description here that may not
                                            fit into the page and may cause design problems
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-red"></i> 5 new members joined
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-user text-red"></i> You changed your username
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">View all</a></li>
                        </ul>
                    </li>
                    <!-- Tasks: style can be found in dropdown.less -->
                    <li class="dropdown tasks-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-flag-o"></i>
                            <span class="label label-danger">9</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">你有9个新任务</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Design some buttons
                                                <small class="pull-right">20%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">20% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                    <li>
                                        <!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Create a nice theme
                                                <small class="pull-right">40%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">40% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                    <li>
                                        <!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Some task I need to do
                                                <small class="pull-right">60%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">60% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                    <li>
                                        <!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Make beautiful transitions
                                                <small class="pull-right">80%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">80% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">View all tasks</a>
                            </li>
                        </ul>
                    </li>
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${pageContext.servletContext.contextPath}/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">张猿猿</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="${pageContext.servletContext.contextPath}/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    张猿猿 - 数据管理员
                                    <small>最后登录 11:20AM</small>
                                </p>
                            </li>
                            <!-- Menu Body
                    <li class="user-body">
                        <div class="row">
                            <div class="col-xs-4 text-center">
                                <a href="#">Followers</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">Sales</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">Friends</a>
                            </div>
                        </div>
                    </li>-->
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">修改密码</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">注销</a>
                                </div>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
    </header>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageContext.servletContext.contextPath}/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>张猿猿</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>
            <!-- search form -->
            <!--<form action="#" method="get" class="sidebar-form">
        <div class="input-group">
            <input type="text" name="q" class="form-control" placeholder="搜索...">
            <span class="input-group-btn">
            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
            </button>
          </span>
        </div>
    </form>-->
            <!-- /.search form -->


            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">菜单</li>

                <li id="admin-index"><a href="${pageContext.servletContext.contextPath}/index"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

                <!-- 菜单 -->

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-folder"></i> <span>后台通用页面</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="admin-login">
                            <a href="all-admin-login.jsp">
                                <i class="fa fa-circle-o"></i> 登录
                            </a>
                        </li>

                        <li id="admin-register">
                            <a href="all-admin-register.jsp">
                                <i class="fa fa-circle-o"></i> 注册
                            </a>
                        </li>

                        <li id="admin-404">
                            <a href="all-admin-404.jsp">
                                <i class="fa fa-circle-o"></i> 404页
                            </a>
                        </li>

                        <li id="admin-500">
                            <a href="all-admin-500.jsp">
                                <i class="fa fa-circle-o"></i> 500页
                            </a>
                        </li>

                        <li id="admin-blank">
                            <a href="all-admin-blank.jsp">
                                <i class="fa fa-circle-o"></i> 空白页
                            </a>
                        </li>

                        <li id="admin-datalist">
                            <a href="all-admin-datalist.jsp">
                                <i class="fa fa-circle-o"></i> 数据列表页
                            </a>
                        </li>

                        <li id="admin-dataform">
                            <a href="all-admin-dataform.jsp">
                                <i class="fa fa-circle-o"></i> 表单页
                            </a>
                        </li>

                        <li id="admin-profile">
                            <a href="all-admin-profile.jsp">
                                <i class="fa fa-circle-o"></i> 个人中心
                            </a>
                        </li>

                        <li id="admin-invoice">
                            <a href="all-admin-invoice.jsp">
                                <i class="fa fa-circle-o"></i> 发票
                            </a>
                        </li>

                        <li id="admin-invoice-print">
                            <a href="all-admin-invoice-print.jsp">
                                <i class="fa fa-circle-o"></i> 发票打印
                            </a>
                        </li>

                    </ul>
                </li>



                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-pie-chart"></i> <span>图表Charts</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="charts-chartjs">
                            <a href="all-charts-chartjs.jsp">
                                <i class="fa fa-circle-o"></i> ChartJS
                            </a>
                        </li>

                        <li id="charts-morris">
                            <a href="all-charts-morris.jsp">
                                <i class="fa fa-circle-o"></i> Morris Charts
                            </a>
                        </li>

                        <li id="charts-flot">
                            <a href="all-charts-flot.jsp">
                                <i class="fa fa-circle-o"></i> Flot Charts
                            </a>
                        </li>

                        <li id="charts-inline">
                            <a href="all-charts-inline.jsp">
                                <i class="fa fa-circle-o"></i> Inline Charts
                            </a>
                        </li>

                    </ul>
                </li>



                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-laptop"></i> <span>UI界面元素</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="elements-general">
                            <a href="all-elements-general.jsp">
                                <i class="fa fa-circle-o"></i> 标准 General
                            </a>
                        </li>

                        <li id="elements-icons">
                            <a href="all-elements-icons.jsp">
                                <i class="fa fa-circle-o"></i> 图标 Icons
                            </a>
                        </li>

                        <li id="elements-buttons">
                            <a href="all-elements-buttons.jsp">
                                <i class="fa fa-circle-o"></i> 按钮 Buttons
                            </a>
                        </li>

                        <li id="elements-sliders">
                            <a href="all-elements-sliders.jsp">
                                <i class="fa fa-circle-o"></i> 滑块 Sliders
                            </a>
                        </li>

                        <li id="elements-timeline">
                            <a href="all-elements-timeline.jsp">
                                <i class="fa fa-circle-o"></i> 时间线 Timeline
                            </a>
                        </li>

                        <li id="elements-modals">
                            <a href="all-elements-modals.jsp">
                                <i class="fa fa-circle-o"></i> 对话框样式 Modals
                            </a>
                        </li>

                        <li id="elements-widgets">
                            <a href="all-elements-widgets.jsp">
                                <i class="fa fa-circle-o"></i> 窗体小部件 widgets
                            </a>
                        </li>

                    </ul>
                </li>



                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-edit"></i> <span>表单 Forms</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="form-general">
                            <a href="all-form-general.jsp">
                                <i class="fa fa-circle-o"></i> 基础表单元素
                            </a>
                        </li>

                        <li id="form-advanced">
                            <a href="all-form-advanced.jsp">
                                <i class="fa fa-circle-o"></i> 高级表单元素
                            </a>
                        </li>

                        <li id="form-editors">
                            <a href="all-form-editors.jsp">
                                <i class="fa fa-circle-o"></i> 编辑器
                            </a>
                        </li>

                    </ul>
                </li>



                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-table"></i> <span>表格 tables</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="tables-simple">
                            <a href="all-tables-simple.jsp">
                                <i class="fa fa-circle-o"></i> 简单表格
                            </a>
                        </li>

                        <li id="tables-data">
                            <a href="all-tables-data.jsp">
                                <i class="fa fa-circle-o"></i> 数据表格
                            </a>
                        </li>

                    </ul>
                </li>



                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-cube"></i> <span>样例-订单管理</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="order-manage">
                            <a href="all-order-manage-list.jsp">
                                <i class="fa fa-circle-o"></i> 全部订单
                            </a>
                        </li>

                        <li id="order-cancel">
                            <a href="all-order-cancel-list.jsp">
                                <i class="fa fa-circle-o"></i> 退款
                            </a>
                        </li>

                    </ul>
                </li>



                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-book"></i> <span>样例-游记管理</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="travellog-manage">
                            <a href="all-travellog-manage-list.jsp">
                                <i class="fa fa-circle-o"></i> 游记列表
                            </a>
                        </li>

                        <li id="travellog-review">
                            <a href="all-travellog-review-list.jsp">
                                <i class="fa fa-circle-o"></i> 游记点评
                            </a>
                        </li>

                        <li id="travellog-setting">
                            <a href="all-travellog-setting-edit.jsp">
                                <i class="fa fa-circle-o"></i> 游记设置
                            </a>
                        </li>

                    </ul>
                </li>



                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-cogs"></i> <span>样例-系统管理</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                    <ul class="treeview-menu">

                        <li id="system-setting">
                            <a href="all-system-setting-edit.jsp">
                                <i class="fa fa-circle-o"></i> 系统设置
                            </a>
                        </li>

                    </ul>
                </li>



                <!-- 菜单 /-->

                <li id="admin-documentation"><a href="documentation.jsp" target="_blank"><i class="fa fa-book"></i> <span>AdminLTE汉化文档</span></a></li>

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                404 错误页面
            </h1>

            <ol class="breadcrumb">
                <li><a href="all-admin-index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">404 错误</li>
            </ol>

        </section>

        <!-- Main content -->
        <section class="content">
            <div class="error-page">
                <h2 class="headline text-yellow"> 404</h2>

                <div class="error-content">
                    <h3><i class="fa fa-warning text-yellow"></i> Oops! 页面没有找到.</h3>

                    <p>
                        没有找到你请求的页面, 你可以 <a href="all-admin-index.jsp">返回到后台首页</a> 或者通过搜索查询
                    </p>

                    <form class="search-form">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="搜索">

                            <div class="input-group-btn">
                                <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.input-group -->
                    </form>
                </div>
                <!-- /.error-content -->
            </div>
            <!-- /.error-page -->
        </section>
        <!-- /.content -->
    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.8
        </div>
        <strong>Copyright &copy; 2014-2017 <a href="http://www.itcast.cn">研究院研发部</a>.</strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->

</div>


<script src="${pageContext.servletContext.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/raphael/raphael-min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/morris/morris.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/knob/jquery.knob.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {
        setSidebarActive("admin-404");
    });
</script>
</body>

</html>