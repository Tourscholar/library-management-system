<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>등기계좌번호</title>
<meta name="description" content="이것은 index 페이지입니다.">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="static/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="static/assets/css/amazeui.datatables.min.css" />
<link rel="stylesheet" href="static/assets/css/app.css">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
</head>

<body data-type="login">
	<script src="static/assets/js/theme.js"></script>
	<div class="am-g tpl-g">
		<div class="tpl-skiner">
			<div class="tpl-skiner-toggle am-icon-cog"></div>
			<div class="tpl-skiner-content">
				<div class="tpl-skiner-content-title">테마 선택</div>
				<div class="tpl-skiner-content-bar">
					<span class="skiner-color skiner-white" data-color="theme-white"></span>
					<span class="skiner-color skiner-black" data-color="theme-black"></span>
				</div>
			</div>
		</div>
		<div class="tpl-login">
			<div class="tpl-login-content">
				<div class="tpl-login-title">등록된 사용자</div>
				<span class="tpl-login-content-info">새 사용자 만들기</span>

				<form class="am-form tpl-form-line-form" method="post"
					action="/books/RegisterServlet">
					<div class="am-form-group">
						<input type="text" class="tpl-form-input" id="user-name"
							name="username" required="required" placeholder="학번을 입력하세요">
					</div>
					<div class="am-form-group">
						<input type="password" class="tpl-form-input" id="user-name"
							name="password" required="required" placeholder="비밀번호를 입력해 주세요.">
					</div>
					<div class="am-form-group">
						<input type="text" class="tpl-form-input" id="user-name"
							name="name" required="required" placeholder="이름을 입력하세요">
					</div>
					<div class="am-form-group">
						<input type="text" class="tpl-form-input" id="user-name"
							name="email" required="required" placeholder="이메일을 입력하세요">
					</div>
					<div class="am-form-group">
						<input type="text" class="tpl-form-input" id="user-name"
							name="phone" required="required" placeholder="휴대폰 번호를 입력하세요">
					</div>

					<div class="am-form-group">
						<button type="submit"
							class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">회원가입</button>
					</div>
					<div class="am-form-group">
						<button type="button" onclick="location.href='/books/login.jsp';"
							class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">로그인으로 돌아가기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="http://cdn.bootcss.com/amazeui/2.7.2/js/amazeui.min.js"></script>
	<script src="static/assets/js/app.js"></script>
</body>
</html>