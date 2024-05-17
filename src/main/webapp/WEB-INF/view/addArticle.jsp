<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<% String Path = request.getContextPath(); %>
<html>
<head>
    <title>我要发帖</title>
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
                <li class="active"><a href="#">我要发帖</a></li>
                <li><a href="<%=Path%>/myArticle/${USER_SESSION.userId}">我发布的</a></li>
                <li><a href="${pageContext.request.contextPath}/userCenter" id="userSpace">用户中心</a></li>
                <li><a href="<%=Path%>/chat" id="chat" onclick="check()">我的小组</a></li>
            </ul>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    我要发帖
                    <small>增加帖子信息</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <form role="form" id="add" method="post" action="<%=Path%>/toAddArticle" accept-charset="utf-8">
                <div class="form-group">
                    <label>作者</label><input class="form-control" name="articleAuthor" value="${USER_SESSION.userName}" readonly="readonly"/>
                </div>
                <div class="form-group" style="display: none;">
                    <label>id</label><input class="form-control" name="articleAuthorId" value="${USER_SESSION.userId}"/>
                </div>
                <div class="form-group" style="display: none;">
                    <label>创建时间</label><input class="form-control" name="articleCreatetime" id="articleCreatetime" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>"></input>
                </div>
                <div class="form-group">
                    <label>标题</label><input class="form-control" name="articleTitle"/>
                </div>
                <div class="form-group">
                    <label>描述</label><input class="form-control" name="articleDescribe"/>
                </div>
                <div class="form-group">
                    <label>标签</label><input class="form-control" name="articleTag"/>
                </div>
                <div class="form-group">
                    <label>内容</label><textarea rows="20" class="form-control" name="articleContent" placeholder="请输入内容"></textarea>
                </div>
                <button class="btn btn-default" id="sub">提交</button>
            </form>
        </div>
    </div>

</div>
</div>
<script type="text/javascript" src="<%=Path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=Path%>/js/checkLogin.js"></script>
<script type="text/javascript">
    function list() {
        window.location.href="<%=Path%>/articleList";
    }
    var frm = $('#add');
    frm.submit(function (ev) {
        <%--frm.val("<fmt:formatDate value='${distributor.articleTitle }' pattern='yyyy-MM-dd  HH:mm'/>");--%>
        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success:function(data) {
                list();
            },
            error:function(data){
                alert("添加失败");
            }
        });
        ev.preventDefault();
    });
</script>
</body>
</html>