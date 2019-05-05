<%@ page import="com.java.system.entity.Menu" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/info.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DR后台登录首页</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="./index.html">DR</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('资讯','http://news.baidu.com/')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>
                <dd><a onclick="x_admin_show('图片','http://image.baidu.com/')"><i class="iconfont">&#xe6a8;</i>图片</a>
                </dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${username}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('个人信息','http://www.baidu.com')">个人信息</a></dd>
                <dd><a onclick="x_admin_show('切换帐号','./login.jsp')">切换帐号</a></dd>
                <dd><a href="<%=request.getContextPath()%>/OutServlet">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="<%=request.getContextPath()%>/goIndex">前台首页</a></li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <ul id="nav">
        <c:forEach items="${menus}" var="root">
            <c:if test="${root.parentId==-1}">
                <li>
                <a href="${root.url}">
                    <i class="iconfont">${root.img}</i>
                    <cite>${root.menuName}</cite>
                </a>
                <i class="iconfont nav_right" style="clear: both">&#xe697;</i>
                <ul class="sub-menu">
                    <c:forEach items="${menus}" var="menu">
                        <c:if test="${menu.parentId==root.menuId}">
                            <li>
                                <a _href="${menu.url}">
                                    <i class="iconfont">${root.img}</i>
                                    <cite>${menu.menuName}</cite>
                                </a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
            </li>
        </c:forEach>
    </ul>
</div>
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='<%=request.getContextPath()%>/background/welcome.jsp' frameborder="0" scrolling="yes"
                        class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2017 x-admin v2.3 All Rights Reserved</div>
</div>
<!-- 底部结束 -->
</body>
</html>