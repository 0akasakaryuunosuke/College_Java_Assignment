<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<% String Path = request.getContextPath(); %>
<html>
<head>
    <title>帖子详情</title>
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
        .btn {
            text-align: center;
            padding: 10px;
            width: 100%;
            margin-top: 40px;
            background-image: linear-gradient(to right,#a6c1ee, #fbc2eb);
            color: #fff;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="<%=Path%>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=Path%>/css/main.css" rel="stylesheet">
    <link rel="main icon" href="<%=Path%>/img/OOZone2.png">

    <!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
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
                <li class="active"><a href="#">帖子详情</a></li>
            </ul>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    帖子内容
                </h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h2>${requestScope.get("article").articleTitle}</h2>
            <div class="label label-primary">${article.articleTag}</div>
        </div>
    </div>
    <div class="row clearfix describe">
        <div class="col-md-12 column">
            <div style="margin:10px 0 10px 0;color:blue;">${requestScope.get("article").articleDescribe}</div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <p class="detail">${requestScope.get("article").articleContent}</p>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>用户评论</h3>
            <c:forEach var="comment" items="${requestScope.get('comments')}" varStatus="status">
                <div class="">
                    <div><span style="color:#1b6d85">${comment.commentUserName}:</span><span>${comment.commentContent}</span></div>
                    <p><span>${comment.commentCreatetime}</span></p>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3>写评论</h3>
            <form role="form" id="addComment" method="post" action="<%=Path%>/addComment" accept-charset="utf-8">
                <div class="form-group hidden">
                    <label>作者</label><input class="form-control" name="commentUserName" id="commentUserName" value="${USER_SESSION.userName}"/>
                </div>
                <div class="form-group hidden">
                    <label>作者id</label><input class="form-control" name="commentUserId" value="${USER_SESSION.userId}"/>
                </div>
                <div class="form-group hidden">
                    <label>创建时间</label><input class="form-control" name="commentCreatetime" id="commentCreatetime" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>"></input>
                </div>
                <div class="form-group hidden">
                    <label>文章id</label><input class="form-control" name="commentArticleId" value="${requestScope.get("article").articleId}"/>
                </div>
                <div class="form-group">
                    <textarea rows="10" class="form-control" name="commentContent" placeholder="请输入内容"></textarea>
                </div>
                <button class="btn " id="sub">评论</button>
            </form>
        </div>
    </div>
</div>
</div>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script type="text/javascript" src="<%=Path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=Path%>/js/checkLogin.js"></script>
<script type="text/javascript">
    var frm = $('#addComment');
    frm.submit(function (ev) {
        if ($("#commentUserName").val()==""){
            alert("请先登录！");
            return false;
        }else {
            $.ajax({
                type: frm.attr('method'),
                url: frm.attr('action'),
                data: frm.serialize(),
                success:function(data) {
                    location.replace(location.href);
                },
                error:function(data){
                    alert("评论失败");
                }
            });
            ev.preventDefault();
        }
    });
</script>
</body>
</html>

