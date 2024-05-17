<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String Path = request.getContextPath(); %>
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
            background: url('<%=Path%>/img/backgroud2.png') no-repeat center center fixed;
            background-size: cover;
            opacity: 0.3; /* 设置背景图片透明度 */
            z-index: -1; /* 确保背景图片在内容后面 */
        }

        .content1 {
            position: relative;
            z-index: 1; /* 确保内容在背景图片之上 */
        }

        #chatContainer {
            width: 100%;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        #chatBox {
            height: 300px;
            overflow-y: scroll;
            border-bottom: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }

        .message {
            margin: 5px 0;
            padding: 10px;
            border-radius: 5px;
            max-width: 70%;
        }

        .message.right {
            background-color: #dcf8c6;
            margin-left: auto;
            text-align: right;
        }

        .message.left {
            background-color: #f1f0f0;
        }

        #messageInput {
            width: calc(100% - 60px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        #sendButton {
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        #chatContainer {
            display: none; /* 初始隐藏 */
        }

        #chatBox {
            height: 300px;
            overflow-y: scroll;
            border-bottom: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            background-color: #f9f9f9;
        }

        .message {
            margin: 5px 0;
            padding: 10px;
            border-radius: 5px;
            max-width: 70%;
        }

        .message.right {
            background-color: #dcf8c6;
            margin-left: auto;
            text-align: right;
        }

        .message.left {
            background-color: #f1f0f0;
        }

        .message .username {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        #messageInput {
            width: calc(100% - 60px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        #sendButton {
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        #joinGroupForm {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        #joinGroupInput {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }

        #joinGroupButton {
            padding: 10px 20px;
            border: none;
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        #leaveGroupButton {
            padding: 10px 20px;
            border: none;
            background-color: #dc3545;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            display: none; /* 初始隐藏 */
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
                    <li><a href="#" id="userSpace" onclick="check()">用户中心</a></li>
                    <li class="active"><a href="<%=Path%>/chat.jsp" id="chat" onclick="check()">聊天</a></li>
                </ul>
            </div>
        </div>
        <!-- 显示用户加入的小组 -->
        <div id="groupList">
            <c:forEach var="group" items="${groups}">
                <div class="group" onclick="showChat(${group.groupId})" style="cursor:pointer; padding:10px; border:1px solid #ddd; margin-bottom:5px;">
                        ${group.groupName} (${group.memberCount})
                </div>
            </c:forEach>
        </div>

        <!-- 加入小组 -->
        <div id="joinGroupForm">
            <input type="text" id="joinGroupInput" placeholder="输入群组ID..." />
            <button id="joinGroupButton" onclick="joinGroup()">加入小组</button>
        </div>

        <!-- 聊天框部分 -->
        <div id="chatContainer">
            <div id="chatBox"></div>
            <input type="text" id="messageInput" placeholder="输入消息..." />
            <button id="sendButton" onclick="sendMessage()">发送</button>
            <button id="leaveGroupButton" onclick="leaveGroup()">退出小组</button>
        </div>
    </div>
</div>

<script>
    let currentGroupId = null;
    let messages = [];

    function showChat(groupId) {
        currentGroupId = groupId;
        // Fetch chat messages for the selected group
        fetch('<%=Path%>/chat/messages?groupId=' + groupId)
            .then(response => response.json())
            .then(data => {
                messages = data;
                displayMessages();
                document.getElementById("chatContainer").style.display = "block";
                document.getElementById("leaveGroupButton").style.display = "block";
            });
    }

    function displayMessages() {
        let chatBox = document.getElementById("chatBox");
        chatBox.innerHTML = '';
        messages.forEach(msg => {
            let messageDiv = document.createElement("div");
            messageDiv.className = 'message ' + (msg.userId === ${USER_SESSION.userId} ? 'right' : 'left');
            messageDiv.innerHTML = '<span class="username">' + msg.userName + '</span>' + msg.message;
            chatBox.appendChild(messageDiv);
        });
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    function sendMessage() {
        let input = document.getElementById("messageInput");
        let text = input.value.trim();
        if (text && currentGroupId) {
            let newMessage = {userId: ${USER_SESSION.userId}, userName: '${USER_SESSION.userName}', message: text};
            messages.push(newMessage);
            input.value = '';
            displayMessages();

            // Send message to server
            fetch('<%=Path%>/chat/send', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    groupId: currentGroupId,
                    userId: ${USER_SESSION.userId},
                    userName: '${USER_SESSION.userName}',
                    message: text
                })
            });
        }
    }

    function joinGroup() {
        let groupId = document.getElementById("joinGroupInput").value.trim();
        if (groupId) {
            fetch('<%=Path%>/chat/join', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    groupId: groupId,
                    userId: ${USER_SESSION.userId}
                })
            }).then(response => {
                if (response.ok) {
                    alert("成功加入小组");
                    location.reload(); // 刷新页面以显示更新后的小组列表
                } else {
                    alert("加入小组失败");
                }
            });
        }
    }

    function leaveGroup() {
        if (currentGroupId) {
            fetch('<%=Path%>/chat/leave', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    groupId: currentGroupId,
                    userId: ${USER_SESSION.userId}
                })
            }).then(response => {
                if (response.ok) {
                    alert("已退出小组");
                    location.reload(); // 刷新页面以显示更新后的小组列表
                } else {
                    alert("退出小组失败");
                }
            });
        }
    }
</script>
</body>
</html>
