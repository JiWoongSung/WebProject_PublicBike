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

<script>
	$(document)
			.ready(
					function() {
<%if (session.getAttribute("admin_id") == null || (int) session.getAttribute("admin_id") != 1) {
				response.sendRedirect("../common/login.jsp");
			}%>
	});
</script>
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
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
	<div class="container">
		<h1 style="text-align:center;">자전거 월별 사용금액</h1>
		<h2>1월 사용금액</h2>
		<div id="demo-1"></div>

		<script src="./Easygraphs.js"></script>
		<script>
			var eg1 = new Easygraphs({
				container : document.getElementById('demo-1'),
				width : 880,
				height : 200,
				padding : {
					top : 30,
					right : 30,
					left : 55
				},
				tooltip : {
					template : '자전거 이용 수 : {{ value }}',
					widthAuto : true,
					color : '#222',
					background : '#FFF'
				},
				yAxis : {
					text : {
						toFixed : 0
					},
					title : {
						text : 'January'
					},
					grid : {
						dasharray : '1%'
					}
				},
				xAxis : {
					labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
							'10', '11', '12', '13', '14', '15', '16', '17',
							'18', '19', '20', '21', '22', '23', '24', '25',
							'26', '27', '28', '29', '30', '31' ],
					grid : {
						dasharray : '1%'
					}
				},
				data : [ {
					name : 'Using',
					dots : {
						color : 'rgb(246, 75, 47)'
					},
					line : {
						width : 2,
						color : 'rgb(246, 75, 47)',
						fill : 'rgba(246, 75, 47, 0.5)'
					},
					values : [ 90, 22, 25, 23, 32, 34, 120, 90, 95, 40, 51, 56,
							52, 70, 68, 72, 74, 78, 91, 92, 95, 96, 98, 121,
							70, 78, 76, 68, 72, 71, 92 ]
				} ]
			});
			eg1.render();
		</script>
		</div>
</body>
</html>
