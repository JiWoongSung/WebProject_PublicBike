<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="Servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Dao.*"%>
<%@ page import="Dto.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/regi.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
	
</script>

<script>
	$.ajax({
		type : 'GET',
		url : "realTimeForm.jsp",
		dataType : "text",
		success : function(data) {
			//alert("성공입니다." + data.result);
			$("#form").html(data);
		},
		error : function(error) {
			alert("error : " + error);
		}
	});

	function clickOn() {
		$('#execute').on('click', function(e) {
			e.preventDefault();
			$.ajax({
				url : 'realTimeForm.jsp',
				data : {
					info : $("#info").val(),
					searchOption : $("#searchOption").val()
				},

				success : function(data) {
					$("#form").empty();
					$("#form").html(data);
				},
				error : function() {
					alert('data error');
				}
			})
		});
	}
	$(document).ready(function() {
		clickOn();
	});
</script>
	<script>
	$(document).ready(function(){
		<%if(session.getAttribute("admin_id")==null||(int)session.getAttribute("admin_id")!= 1) {	
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

<title>시간조회</title>
</head>
<body>
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
							<li><a href="realTime.jsp">실시간 사용현황</a></li>
							<li><a href="map.jsp">지도 보기</a></li>
							<li><a href="../common/mypage.jsp">현재 계정정보</a></li>
							<li><a href="view.jsp">회원 등록현황</a></li>	
							<li><a href="Chart.jsp">자전거 월별사용량</a></li>       	
							<li><a href="../common/login.jsp">로그아웃</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<header>
			<h1>유저 정보검색</h1>
		</header>
		<div>
			<div>
				
				<form class="form-inline">
					<select id="searchOption" class="form-control">
						<option value="ID">아이디</option>
						<option value="address">대여장소</option>
						<option value="rAddress">반납장소</option>
						
					</select>
					<div class="form-group">
						<input class="form-control" id="info" name="info"
							type="text" placeholder="검색">
					</div>
					<button id="execute" class="btn btn-default">검색</button>
				</form>
			</div>
			<br>
			<table id="form" class="table table-striped">

			</table>
		</div>
	</div>
</body>
</html>