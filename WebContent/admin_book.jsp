<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page
	import="com.rain.bean.TypeBean,com.rain.dao.AdminDao,com.rain.dao.TypeDao,com.rain.bean.BookBean,com.rain.dao.BookDao,com.rain.bean.AdminBean"%>
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
	background-image: url("01.jpg");
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
						<a class="navbar-brand" href="admin.jsp"><strong>도서관 관리 시스템 이용을 환영합니다</strong></a>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" role="button"
								class="dropdown-toggle" data-hover="dropdown"> <i
									class="glyphicon glyphicon-user"></i> 환영합니다 <%out.write(admin.getName());%>
										(<%=session.getAttribute("aid")%>) <i class="caret"></i></a>
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
					<li><a href="/books/admin_book.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 도서 관리</a></li>
					<li><a href="/books/admin_user.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 독자 관리</a></li>
					<li><a href="/books/admin_booktype.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 도서 분류 관리</a></li>
					<li><a href="/books/admin_borrow.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 도서 대출 정보</a></li>
					<li><a href="/books/admin_history.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 도서 반환 정보</a></li>
					<li><a href="/books/admin_login.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i>관리자 관리 (로그인 필요)</a></li>
				</ul><br><br>
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/books/admin_bdtimes.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 인기 추천</a></li>
					<li><a href="/books/admin_brtimes.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 최고의 독자</a></li>
				</ul><br><br>
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/books/admin_feedback.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 독자 피드백</a></li>
				</ul>
			</div>

			<!-- content -->
			<div class="col-md-10">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default bootstrap-admin-no-table-panel">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">대출횟수 조회</div>
							</div>
							<div
								class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
								<form class="form-horizontal" action="/books/selectServlet"
									method="post">
									<!-- <input type="hidden" name="tip" value="1"> -->
									<input type="hidden" name="tip" value="1">
									<div class="col-lg-7 form-group">
										<label class="col-lg-4 control-label" for="query_bname">도서 정보</label>
										<div class="col-lg-8">
											<input class="form-control" id="bookName" name="name"
												type="text" value=""> <label class="control-label"
												for="query_bname" style="display: none;"></label>
										</div>
									</div>
									<div class="col-lg-3 form-group">

										<button type="submit" class="btn btn-primary" id="btn_query">검색</button>
									</div>
									<div class="col-lg-3 form-group">
										<button type="button" class="btn btn-primary" id="btn_add"
											data-toggle="modal" data-target="#addModal">도서를 추가</button>
									</div>
								</form>
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
									<th>도서 번호</th>
									<th>도서 유형</th>
									<th>도서명</th>
									<th>작성자 이름</th>
									<th>출판사</th>
									<th>총수량</th>
									<th>조작</th>
								</tr>
							</thead>

							<%
								ArrayList<BookBean> bookdata = new ArrayList<BookBean>();
								bookdata = (ArrayList<BookBean>) request.getAttribute("data");
								if (bookdata == null) {
									BookDao bookdao = new BookDao();
									bookdata = (ArrayList<BookBean>) bookdao.get_ListInfo();
								}
	
								for (BookBean bean : bookdata) {
							%>
							<tbody>
								<td><%=bean.getCard()%></td>
								<td><%=bean.getType()%></td>
								<td><%=bean.getName()%></td>
								<td><%=bean.getAutho()%></td>
								<td><%=bean.getPress()%></td>
								<td><%=bean.getNum()%></td>
								<td><button type="button" class="btn btn-warning btn-xs"
										data-toggle="modal" data-target="#updateModal" id="btn_update"
										onclick="showInfo2('<%=bean.getBid()%>','<%=bean.getCard()%>','<%=bean.getType()%>','<%=bean.getName()%>',
											'<%=bean.getAutho()%>','<%=bean.getPress()%>','<%=bean.getNum()%>')">고치</button>
									<button type="button" class="btn btn-danger btn-xs"
										onclick="deletebook(<%=bean.getBid()%>)">삭제</button></td>
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
	<script type="text/javascript">
		function showInfo2(bid, card, type, name, autho, press, num) {
			document.getElementById("updateISBN").value = card;
			document.getElementById("updateBookName").value = name;
			document.getElementById("updateAutho").value = autho;
			document.getElementById("updatePress").value = press;
			document.getElementById("updateBookType").value = type;
			document.getElementById("updateNum").value = num;
			document.getElementById("updateBookId").value = bid;
		}

		function deletebook(bid) {
			con = confirm("삭제하시겠습니까?");
			if(con == true) {
				location.href = "/books/deleteServlet?bid=" + bid;
			}
		}
	</script>

	<!-------------------------------------------------------------->

	<form class="form-horizontal" method="post"
		action="/books/updateBookServlet">
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
			aria-labelledby="updateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="updateModalLabel">도서 정보를 수정하다</h4>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">도서 번호</label>
							<div class="col-sm-7">
								<input type="hidden" id="updateBookId" name="updatebid">
								<input type="text" class="form-control" id="updateISBN"
									name="card" placeholder="도서번호를 입력하세요"> <label
									class="control-label" for="updateISBN" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">도서명</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateBookName"
									name="name" placeholder="도서명을 입력하세요"> <label
									class="control-label" for="updateBookName"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">도서 유형</label>
							<div class="col-sm-7">
								<select class="form-control" id="updateBookType" name="type"
									onPropertyChange="showValue(this.value)">
									<option value="-1">선택해주세요</option>
									<%
										TypeDao typedao = new TypeDao();
										ArrayList<TypeBean> data = (ArrayList<TypeBean>) typedao.get_ListInfo();
										data = (ArrayList<TypeBean>) typedao.get_ListInfo();
										for (TypeBean bean : data) {
									%>
									<option value="<%=bean.getName()%>">
										<%=bean.getName()%>
									</option>
									<%
										}
									%>
								</select> <label class="control-label" for="updateBookType"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">작성자 이름</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateAutho"
									name="autho" placeholder="작성자 이름을 입력하세요"> <label
									class="control-label" for="updateAutho" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">출판사</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updatePress"
									name="press" placeholder="출판사를 입력하세요"> <label
									class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">총수량</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="updateNum"
									name="num" placeholder="총 수량을 입력하세요"> <label
									class="control-label" for="updatePress" style="display: none;"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">고치</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</form>

	<form class="form-horizontal" method="post"
		action="/books/AddBookServlet">
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">새 책을 추가하다</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">도서 번호</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addISBN"
									required="required" name="card" placeholder="도서번호를 입력하세요"> <label
									class="control-label" for="addISBN" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label"></label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addBookName"
									required="required" name="name" placeholder="도서명을 입력하세요">
								<label class="control-label" for="addBookName"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">도서 유형</label>
							<div class="col-sm-7">
								<select class="form-control" id="addBookType" name="type">
									<option value="无分类">선택해주세요</option>
									<%
										data = (ArrayList<TypeBean>) typedao.get_ListInfo();
										for (TypeBean bean : data) {
									%>
									<option value="<%=bean.getName()%>">
										<%=bean.getName()%>
									</option>
									<%
										}
									%>
								</select> <label class="control-label" for="addBookType"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">작성자 이름</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addAutho"
									required="required" name="autho" placeholder="작성자 이름을 입력하세요">
								<label class="control-label" for="addAutho"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">출판사</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addPress"
									required="required" name="press" placeholder="출판사를 입력하세요">
								<label class="control-label" for="addPress"
									style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">총수량</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="addNum"
									required="required" name="num" placeholder="총 도서 수량을 입력하세요">
								<label class="control-label" for="addNum" style="display: none;"></label>
							</div>
						</div>

						<!---------------------表单-------------------->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">추가</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</form>

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
						<input type="hidden" name="tip" value="1"> <input
							type="hidden" name="url" value="admin_book">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">비밀번호</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="password"
									id="oldPwd" placeholder="비밀번호를 입력하세요"> <label
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
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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

						<!--正文-->
						<input type="hidden" name="tip" value="2"> <input
							type="hidden" name="url" value="admin_book">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">이름</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="이름을 입력하세요" value='<%out.write(admin.getName());%>'>
								<label class="control-label" for="name" style="display: none"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">휴대폰 번호</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="phone" name="phone"
									placeholder="대폰 번호를 입력하세요" value='<%out.write(admin.getPhone());%>'>
								<label class="control-label" for="phone" style="display: none"></label>
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
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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