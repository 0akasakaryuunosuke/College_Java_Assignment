<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String Path = request.getContextPath(); %>
<html>
<head>
    <style>
        body {
            position: relative;
            margin: 0;
            padding: 0;
            overflow: auto;
            background-color: white; /* 你可以设置一个背景颜色 */
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('<%=Path%>/img/backgroud2.png    ') no-repeat center center fixed;
            background-size: cover;
            opacity: 0.3; /* 设置背景图片透明度 */
            z-index: -1; /* 确保背景图片在内容后面 */
        }
        .content1 {
            position: relative;
            z-index: 1; /* 确保内容在背景图片之上 */
        }
    </style>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 引入 Bootstrap -->
    <link href="<%=Path%>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=Path%>/css/main.css" rel="stylesheet">
    <link rel="main icon" href="<%=Path%>/img/OOZone2.png">
    <title>我发布的</title>
</head>
<body>
<div class="content1">
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <img alt="" src="<%=Path%>/img/OOZone1.png"
                         class="avatar avatar-50 photo" height="100" width="100">
                    <small>OOZone</small>
                </h1>
                <p>
                    <span id="user_name">${USER_SESSION.userName}</span>
                </p>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-tabs">
                <li><a href="<%=Path%>/articleList">首页</a></li>
                <li><a href="<%=Path%>/addArticle">我要发帖</a></li>
                <li class="active"><a href="#">我发布的</a></li>
                <li><a href="${pageContext.request.contextPath}/userCenter" id="userSpace">用户中心</a></li>
            </ul>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>帖子列表
                    <small>显示帖子信息</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <c:forEach var="myArticle" items="${requestScope.get('myArticle')}" varStatus="status">
                <a class="list" href="<%=Path%>/detail/${myArticle.articleId}">
                    <h3 class="title">${myArticle.articleTitle}</h3>
                    <span class="label label-primary">${myArticle.articleTag}</span>
                    <p class="content">${myArticle.articleContent}</p>
                    <p class="infor"><span>${myArticle.articleCreatetime}</span><a href="<%=Path%>/updateArticle/${myArticle.articleId}">修改</a>&nbsp;<a href="<%=Path%>/del/${myArticle.articleId}">删除</a></p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
</div>
<script type="text/javascript" src="<%=Path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=Path%>/js/checkLogin.js"></script>
</body>
</html>
