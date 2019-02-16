<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
		$.ajax({
			type : 'GET',
			url : "ChartForm.jsp",
			dataType : "text",
			success : function(data) {
				//alert("성공입니다." + data.result);
				$("#form").html(data);
			},
			error : function(error) {
				alert("error : " + error);
			}
		});
</script>


<title>Easygraphs.js Examples</title>
<style>
body {
	background-color: #fafafa;
	font-family: 'Roboto';
}

.container {
	margin: auto;
	max-width: 960px;
}

h2 {
	margin: 30px auto;
	text-align: center;
}
</style>


</head>

<body>
	<%
		Object n = session.getAttribute("admin_id");
	%>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="map.jsp">Home</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

				<ul class="nav navbar-nav navbar-right">
					<li><a>관리자님</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">메뉴<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="realTime.jsp">실시간접속현황</a></li>
							<li><a href="searchUser.jsp">유저정보검색</a></li>
							<li><a href="map.jsp">지도보기</a></li>
							<li><a href="../common/mypage.jsp">현재계정정보</a></li>
							<li><a href="view.jsp">회원등록현황</a></li>
							<li><a href="../common/login.jsp">로그아웃</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div id="form">
	</div>
</body>
</html>
