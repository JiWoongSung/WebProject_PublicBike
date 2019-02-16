<%@page import="Dto.Dto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert data here</title>
<link rel="stylesheet" type="text/css" href="../css/mypage.css">
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
	
</script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btnDel").click(function() { //버튼 클릭이벤트

			if (confirm("정말로 탈퇴하시겠습니까?")) {

				document.form1.submit();
			}

			else {
				return;
			}

		});

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
	<!-- request.getContextPath() = 컨택스트 페스를 리턴함 -->
	<!-- ction ="/컨텍스트/가상디렉토리 / 서블릿 url" -->
	<!-- id 는 jsp에서 쓸 것이고 name은 서블릿에서 사용할 것이다. -->
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
				<%
					int admin_id = (int) session.getAttribute("admin_id");
					if (admin_id == 1) {
				%>
				<a class="navbar-brand" href="../admin/map.jsp">Home</a>
				<%
					} else {
				%>
				<a class="navbar-brand" href="../user/map_client.jsp">Home</a>

				<%
					}
				%>


			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

				<ul class="nav navbar-nav navbar-right">
					<%
						Object n = session.getAttribute("id");
					%>
					<li><a><%=n%>님</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">메뉴<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<%
								if (admin_id == 1) {
							%>
							<li><a href="../admin/realTime.jsp">실시간 사용현황</a></li>
							<li><a href="../admin/searchUser.jsp">유저 정보검색</a></li>
							<li><a href="../admin/map.jsp">지도 보기</a></li>
							<li><a href="../admin/view.jsp">회원 등록현황</a></li>
							<li><a href="../admin/Chart.jsp">자전거 월별사용량</a></li>       
							<li><a href="login.jsp">로그아웃</a></li>
							<%
								} else {
							%>
							<li><a href="../user/map_client.jsp">지도보기</a></li>
							<li><a href="login.jsp">로그아웃</a></li>
							<%
								}
							%>

						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">

		<header>
			<h1>현재계정정보</h1>
		</header>
		<%
			String id = (String) session.getAttribute("id");
			Dao dao = new Dao();
			ArrayList<Dto> list = dao.userInfo(id);
			for (Dto dto : list) {
		%>
		<div class="wrap">
			<table cellspacing="0" cellpadding="0" border="0" width="659">
				<tbody>
					<tr class="back">
						<td colspan="2" class="r_name">아이디</td>
					</tr>
					<tr>
						<td colspan="2" class="b_name"><%=dto.getLoginID()%></td>
					</tr>
					<tr>
						<td colspan="2" class="r_name">이름</td>
					</tr>
					<tr>
						<td colspan="2" class="b_name"><%=dto.getName()%></td>
					</tr>
					<tr>
						<td colspan="2" class="r_name">현재 남은 금액</td>
					</tr>
					<tr>
						<td colspan="2" class="b_name"><%=dto.getBalance()%>원</td>
					</tr>


					<tr>
						<td class="c_left">성별</td>
						<td width="520" class="b_name"><%=dto.getGender()%></td>
					</tr>
					<tr>
						<td class="c_left">생년월일</td>
						<td width="520" class="b_name"><%=dto.getBirth()%></td>
					</tr>
					<tr>
						<td class="c_left_final">등록날짜</td>
						<td width="520" class="b_name_final"><%=dto.getDate()%></td>
					</tr>
				</tbody>
			</table>

			<form name="form1" method="post"
				action="<%=request.getContextPath()%>/DataDelete?id=<%=id%>">
				<input type="button" class="btn btn-default" id="btnDel"
					value="회원탈퇴">
			</form>
		</div>

	</div>


	<%
		}
	%>


</body>
</html>

