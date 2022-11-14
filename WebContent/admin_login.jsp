<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="bootstrap-admin-vertical-centered">
<head>
<meta charset="UTF-8">
<title>도서관 관리 시스템</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<script src="static/js/bootstrap.min.js"></script>
<script src="static/jQuery/jquery-3.1.1.min.js"></script>
<script src="static/js/login.js"></script>
<style>
body {
	background-image: url("02.jpg");
}
</style>
</head>

<style type="text/css">
.alert {
	margin: 0 auto 20px;
	text-align: center;
}
</style>
<script src="static/js/bootstrap.min.js"></script>

<body class="bootstrap-admin-without-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="alert alert-info">
					<a class="close" data-dismiss="alert" href="#">&times;</a>
					관리자 관리 시스템으로 가는 중...
				</div>
				<form class="bootstrap-admin-login-form" method="post"
					action="AdminLoginServlet">
					<%
						String state = (String) session.getAttribute("state");
						session.removeAttribute("state");
						if (state != null) {
					%>
					<label class="control-label" for="username">입력이 잘못되었습니다! 다시 시도하십시오.</label>

					<%}%>
					<div class="form-group">
						<label class="control-label" for="username">계좌 번호</label> <input
							type="text" class="form-control" id="username" name="username"
							required="required" placeholder="계정관리" /> <label
							class="control-label" for="username" style="display: none;"></label>
					</div>
					<div class="form-group">
						<label class="control-label" for="password">비밀번호</label> <input
							type="password" class="form-control" id="password"
							name="password" required="required" placeholder="비밀번호" /> <label
							class="control-label" for="username" style="display: none;"></label>
					</div>

					<input type="submit" class="btn btn-lg btn-primary"
						value="로그인" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>