<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String Path = request.getContextPath();
%>
<html>
<head>
  <title>帖子列表</title>
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
            <span id="user_name">${USER_SESSION.userName}</span> <a id="unLogin" onclick="checklog()" href="" >登录</a>
          </p>
        </div>
        <form id="searchForm">
          <input type="text" id="searchKeyword" name="keyword" placeholder="Search articles" class="form-inline my-2 my-lg-0">
          <button type="button" onclick="searchArticles()" class="btn btn-primary">Search</button>
        </form>
      </div>
    </div>
    <div class="row clearfix">
      <div class="col-md-12 column">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#">首页</a></li>
          <li><a href="<%=Path%>/addArticle" id="addArticle" onclick="check()">发布文章</a></li>
          <li><a href="<%=Path%>/myArticle/${USER_SESSION.userId}" id="myArticle" onclick="check()">我发布的</a></li>
          <li><a href="${pageContext.request.contextPath}/userCenter" id="userSpace" onclick="check()">用户中心</a></li>
        </ul>
      </div>
    </div>
    <div class="row clearfix">
      <div class="col-md-12 column">
        <div class="page-header">
          <h1>帖子列表
          </h1>
        </div>
      </div>
    </div>
    <div id="articleResults">
      <c:forEach var="article" items="${articles}">
        <div>
          <a class="list" href="<%=Path%>/detail/${article.articleId}">
            <h3 class="title">${article.articleTitle}</h3>
            <span class="label label-primary">${article.articleTag}</span>
            <p class="content">${article.articleContent}</p>
            <p class="infor"><span>by ${article.articleAuthor}</span><span>${article.articleCreatetime}</span></p>
          </a>
        </div>
      </c:forEach>
    </div>
  </div>
</div>
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script type="text/javascript" charset="UTF-8" src="<%=Path%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="<%=Path%>/js/checkLogin.js"></script>
<script type="text/javascript">
  function check(){
    if ($("#user_name").html()=="") {
      alert("请先登录！");
      $("#addArticle").attr("href","#");
      $("#myArticle").attr("href","##");
    }
  }
  function  checklog(){
    if ($("#user_name").html()!=""){
      $("#unLogin").html("注销").attr("href", "<%=Path%>/logout");
    }
    else{
      $("#unLogin").html("登录").attr("href", "<%=Path%>/login");
    }
  }

</script>
<script>
  $(document).ready(function() {
    var keyword = new URLSearchParams(window.location.search).get('keyword');
    if (keyword) {
      $.ajax({
        url: '/search',
        type: 'GET',
        data: { keyword: keyword },
        success: function(data) {
          var resultsDiv = document.getElementById('articleResults');
          resultsDiv.innerHTML = '';
          data.forEach(function(article) {
            var articleDiv = document.createElement('div');
            articleDiv.innerHTML = '<h3>' + article.title + '</h3><p>' + article.articleDescribe + '</p>';
            resultsDiv.appendChild(articleDiv);
          });
        }
      });
    }
  });
</script>
</body>
</html>