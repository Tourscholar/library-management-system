<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath() + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="bootstrap-admin-vertical-centered">
<head>
<base href="<%=basePath%>" />
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
<script type="text/javascript">
	function changeValidateCode(obj) {
		//每次请求用当前时间作为参数，防止浏览器使用缓存数据
		var timeNow = new Date().getTime();
		obj.src = "CodeServlet?time=" + timeNow;
		document.getElementById('code').value = "";
	}
</script>
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
					도서관 관리 시스템 이용을 환영합니다
				</div>
				<form class="bootstrap-admin-login-form" method="post"
					action="/books/LoginServlet">
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
							required="required" placeholder="학번/공번" /> <label
							class="control-label" for="username" style="display: none;"></label>
					</div>
					<div class="form-group">
						<label class="control-label" for="password">비밀번호</label> <input
							type="password" class="form-control" id="password"
							name="password" required="required" placeholder="비밀번호" /> <label
							class="control-label" for="username" style="display: none;"></label>
					</div>
					<div class="form-group">
						<label class="control-label" for="code">인증 번호</label>
						<div class="row">
							<div class="col-md-8">
								<input type="text" class="form-control" id="code" name="code"
									required="required" placeholder="인증번호(사진 바꾸기 클릭)" />
							</div>
							<div class="col-md-4">
								<img src="CodeServlet" onclick="changeValidateCode(this)"
									alt="인증 번호" />
							</div>
							<label class="control-label" for="username"
								style="display: none;"></label>
						</div>
					</div>

					<label class="control-label" for="password">계좌번호는 없으면<a
						href="/books/register.jsp" style="color: blue;">회원가입</a></label><br> <input
						type="submit" class="btn btn-lg btn-primary"
						value="로그인" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>