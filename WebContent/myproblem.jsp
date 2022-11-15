<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page
	import="com.rain.bean.AdminBean,com.rain.dao.AdminDao,com.rain.bean.ProblemBean,com.rain.dao.ProblemDao"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
<meta charset="UTF-8">
<title>도서관 관리 시스템</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<script src="static/js/bootstrap.min.js"></script>
<script src="static/jQuery/jquery-3.1.1.min.js"></script>
<script src="static/js/bootstrap-dropdown.min.js"></script>
<script src="static/js/adminUpdateInfo.js"></script>
<script src="static/js/adminUpdatePwd.js"></script>
<style>
body {
	background-image: url("04.jpg");
}
</style>
</head>

<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

<body class="bootstrap-admin-with-small-navbar">
	<%
		AdminBean admin = new AdminBean();
		String aid = (String) session.getAttribute("aid");
		AdminDao admindao = new AdminDao();
		admin = admindao.get_AidInfo2(aid);
	%>
	<nav
		class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small"
		role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="collapse navbar-collapse main-navbar-collapse">
						<a class="navbar-brand" href="index.jsp"><strong>도서관 관리 시스템 이용을 환영합니다</strong></a>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" role="button"
								class="dropdown-toggle" data-hover="dropdown"> <i
									class="glyphicon glyphicon-user"></i> 환영합니다 <%out.write(admin.getName());%>
										(<%=session.getAttribute("aid")%>)
									<i class="caret"></i></a>
								<ul class="dropdown-menu">
									<li><a href="#updateinfo" data-toggle="modal">인적사항</a></li>
									<li role="presentation" class="divider"></li>
									<li><a href="#updatepwd" data-toggle="modal">비밀번호 변경</a></li>
									<li role="presentation" class="divider"></li>
									<li><a href="/books/login.jsp">탈퇴</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">
		<!-- left, vertical navbar & content -->
		<div class="row">
			<!-- left, vertical navbar -->
			<div class="col-md-2 bootstrap-admin-col-left">
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/books/select.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 도서 조회</a></li>
					<li><a href="/books/borrow.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 대출정보</a></li>
					<li><a href="/books/history.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 대출역사</a></li>
				</ul><br><br>
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/books/bdtimes.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 인기 추천</a></li>
					<li><a href="/books/brtimes.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 최고의 독자</a></li>
				</ul><br><br>
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/books/feedback.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 문제 피드백</a></li>
				</ul>
			</div>
			
			<!-- content -->
			<div class="col-md-10">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default bootstrap-admin-no-table-panel">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">피드백</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<table id="data_list" class="table table-hover table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>ID</th>
									<th>표제</th>
									<th>문제 페이지</th>
									<th>문제 설명</th>
									<th>연락처</th>
									<th>문제 상태</th>
								</tr>
							</thead>
							<%
							ArrayList<ProblemBean> data2 = new ArrayList<ProblemBean>();
							data2 = (ArrayList<ProblemBean>) request.getAttribute("data");
							if (data2 == null) {
								ProblemDao problemdao = new ProblemDao();
								data2 = (ArrayList<ProblemBean>) problemdao.get_ListInfo2(aid);
							}

							for (ProblemBean bean : data2) {
							%>
							<tbody>
								<td><%=bean.getPid()%></td>
								<td><%=bean.getName()%></td>
								<td><%=bean.getPage()%></td>
								<td><%=bean.getBody()%></td>
								<td><%=bean.getPhone()%></td>
								<td><%=bean.getStatus()%></td>
							</tbody>
							<%
								}
							%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form class="form-horizontal" method="post"
		action="/books/AdminServlet">
		<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">비밀번호 변경</h4>
					</div>
					<div class="modal-body">

						<!--正文-->
						<input type="hidden" name="tip" value="1"> <input
							type="hidden" name="url" value="feedback">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">비밀번호</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="password"
									id="oldPwd" placeholder="비밀번호를 입력하세요> <label
									class="control-label" for="oldPwd" style="display: none"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">새 비밀번호</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="password2"
									id="newPwd" placeholder="새 비밀번호를 입력하세요"> <label
									class="control-label" for="newPwd" style="display: none"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기
						</button>
						<button type="submit" class="btn btn-primary">고치</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</form>

	<form class="form-horizontal" method="post"
		action="/books/AdminServlet">
		<div class="modal fade" id="updateinfo" tabindex="-1" role="dialog"
			aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="ModalLabel">인적사항</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="tip" value="2"> <input
							type="hidden" name="url" value="feedback">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">이름</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="이름을 입력하세요"
									value='<%out.write(admin.getName());%>'> <label
									class="control-label" for="name" style="display: none"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">휴대폰 번호</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="phone" name="phone"
									placeholder="휴대폰 번호를 입력하세요"
									value='<%out.write(admin.getPhone());%>'> <label
									class="control-label" for="phone" style="display: none"></label>
							</div>
						</div>
						
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">email</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="이메일 주소를 입력하세요" value='<%out.write(admin.getEmail());%>'>
								<label class="control-label" for="email" style="display: none"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기
						</button>
						<button type="submit" class="btn btn-primary">고치</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</form>
</body>
</html>