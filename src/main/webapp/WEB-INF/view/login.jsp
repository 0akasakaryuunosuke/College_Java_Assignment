<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% String Path = request.getContextPath(); %>
<html>
<head>
    <title>登录页面</title>
   <%-- <link href="<%=Path%>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=Path%>/css/main.css" rel="stylesheet">--%>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        html {
            height: 100%;
        }
        body {
            height: 100%;
        }
        .container {
            height: 100%;
            background-image: linear-gradient(to right, #999999, #330867);
        }
        /*登录表单*/
        .login-wrapper {
            background-color: bisque;
            width: 358px;
            height: 588px;
            border-radius: 15px;
            padding: 0 50px;
            position: relative;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
        /*把登录表单放在具体位置*/
        .header{
            font-size: 38px;
            font-weight: bold;
            text-align: center;
            line-height: 200px;
        }
        /*具体登录的颜色*/
        .input-item {
            display: block;
            width: 100%;
            margin-bottom: 20px;
            border: 0;
            padding: 10px;
            border-bottom: 1px solid rgb(128,125,125);
            font-size: 15px;
            outline: none;
        }
        /*未输入的时候保持USERNAME和PASSWORD的样式*/
        .input-item::placeholder {
            text-transform: uppercase;
        }
        /*按钮的颜色和大小*/
        .btn {
            text-align: center;
            padding: 10px;
            width: 100%;
            margin-top: 40px;
            background-image: linear-gradient(to right,#a6c1ee, #fbc2eb);
            color: #fff;
        }
        .msg {
            text-align: center;
            line-height: 88px;
        }
        /*超链接的颜色*/
        a {
            text-decoration-line: none;
            color: #abc1ee;
        }
    </style>
    <meta charset="UTF-8">
    <meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8”>
    <link rel="main icon" href="<%=Path%>/img/OOZone2.png">
</head>
<body>
<div class="container">
    <div class="login-wrapper">
     <div class="header">登录</div>
<form action="<%=Path%>/toLogin" method="post" onsubmit="return check(this)" >
    <div class="form-wrapper">
        <label for="username">账号:</label>
        <input class="input-item" type="text" id="username" name="username" placeholder="请输入邮箱或昵称"/>
        <label for="password">密码:</label>
        <input class="input-item" type="password" id="password" name="password"/>
        <p id="message">${msg}</p>
        <input type="submit" value="登录" class="btn"/>

    </div>
</form>
        <div class="msg">
            <a href="<%=Path%>/register">去注册</a>
        </div>
</div>
</div>
<script type="text/javascript" src="<%=Path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    function check() {
        var username = $("#username").val();
        var password = $("#password").val();
        if (username == "") {
            alert("账号不能为空");
            return false;
        } else if (password == "") {
            alert("密码不能为空");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
