<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String Path = request.getContextPath();%>
<html>
<head>
    <style>
        #searchForm {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        #searchKeyword {
            width: 300px;
            border-radius: 0;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
            box-shadow: none;
        }

        #searchButton {
            border-radius: 0;
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
            box-shadow: none;
        }

        /* 美化搜索结果 */
        #articleResults {
            margin-top: 20px;
        }

        .article {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .article h3 {
            margin: 0;
            font-size: 24px;
        }

        .article p {
            margin: 5px 0;
            color: #555;
        }
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
    <!-- 引入 Bootstrap -->
    <link href="<%=Path%>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=Path%>/css/main.css" rel="stylesheet">
    <link rel="main icon" href="<%=Path%>/img/OOZone2.png">
    <title>用户中心</title>
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
                    <li><a href="<%=Path%>/addArticle" id="addArticle" onclick="check()">发布文章</a></li>
                    <li><a href="<%=Path%>/myArticle/${USER_SESSION.userId}" id="myArticle" onclick="check()">我发布的</a></li>
                    <li class="active"><a href="#" id="userSpace" onclick="check()">用户中心</a></li>
                    <li><a href="<%=Path%>/chat" id="chat" onclick="check()">我的小组</a></li>
                </ul>
            </div>
        </div>
    <form id="userForm">
        <div class="form-group">
            <label for="username">用户名</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="${USER_SESSION.userName}">
        </div>
        <div class="form-group">
            <label for="password">密码</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="输入新的密码">
        </div>
        <div class="form-group">
            <label for="email">邮箱</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="输入新的邮箱">
        </div>
        <button type="button" class="btn btn-primary" onclick="updateUser()">Update</button>
    </form>
</div>
</div>
<script>
    function updateUser() {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        var email = document.getElementById('email').value;
        alert('修改成功!');
        $.ajax({
            url: '${pageContext.request.contextPath}/updateUser',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ username: username, password: password, email: email }),
        });
    }
</script>
</body>
</html>
