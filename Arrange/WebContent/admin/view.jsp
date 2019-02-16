<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Servlet.*"%>
<%@ page import="Dao.*" %>
<%@ page import="Dto.*" %>

<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/view.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
</script>
<!-- <link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
 -->
<title>Real-time display</title>


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

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="map.jsp">Home</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      <ul class="nav navbar-nav navbar-right">
       	<li><a>관리자님</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">메뉴<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="realTime.jsp">실시간 사용현황</a></li>
			<li><a href="searchUser.jsp">유저 정보검색</a></li>        
			<li><a href="map.jsp">지도 보기</a></li>
            <li><a href="../common/mypage.jsp">현재 계정정보</a></li>     
            <li><a href="Chart.jsp">자전거 월별사용량</a></li>       
           	<li><a href="../common/login.jsp">로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
		<h1>회원 등록현황 </h1>
		<section class="container-fluid">
			<form name="checkDelete" action="<%=request.getContextPath()%>/ListDelete" method="post" > <!-- 체크박스 삭제기능을 위한 form -->
				
				<input type="hidden" name="delete" value=0> <!-- default값을 위한 input -->
				<table class="type09">
					<thead>
					<tr>
						<th  style="text-align : center">로그인ID</th>
						<th  style="text-align : center">카드ID</th>
						<th  style="text-align : center">이름</th>
						<th  style="text-align : center">성별</th>
						<th  style="text-align : center">생년월일</th>
						<th  style="text-align : center">접근횟수</th>
						<th  style="text-align : center">등록날짜</th>
						<th  style="text-align : center">잔액</th>
						<th style="padding-top: 7px; padding-left: 0px; padding-right: 0px;">
								<input type="button" class="btn btn-default btn-sm" id="chckDel" value="삭제" style="display: block;">
								<input type="submit" class="btn btn-default btn-sm" id="chckDel2" value="확인" style="display: none; float: left;">
								<input type="button" class="btn btn-default btn-sm" id="chckDel3" value="취소" style="display: none; float: right;">
						</th>
											
					</tr>
					</thead>
					<tbody>
				<% 
					/* session.setAttribute("loginID", response.ge) */
					Dao dao = new Dao(); // db와의 connection이 이뤄지고 DB내용이 list에 저장됨.
					
					ArrayList<Dto> list = dao.dataList();
					int num = 0;
					int num1 = 10;
					for(Dto dto:list){
				%>		
						<tr>
							<td style="text-align : center"><%=dto.getLoginID()%></td>
							<td style="text-align : center"><%=dto.getCardID()%></td>
							<td style="text-align : center"><%=dto.getName()%></td>
							<td style="text-align : center"><%=dto.getGender()%></td>
							<td style="text-align : center"><%=dto.getBirth()%></td>
							<td style="text-align : center"><%=dto.getCount()%></td>
							<td style="text-align : center"><%=dto.getDate() %></td>
							<td style="text-align : center"><%=dto.getBalance()%></td>
							<td style="text-align : center"><input type="checkbox" id=<%=num %> style="display : none" name="delete" value=<%=dto.getLoginID()%>></td>
						</tr>
						
				<% 	num++;
					num1++;
					}
				%>
					
					</tbody>
				</table>		  			
			</form>
			
		</section>
		<%-- <input type="hidden" value=<%=list.size() %> id="size">
		 --%>
		<script>
		$(document).ready(function() {
		    $("#chckDel").click(function() { //버튼 클릭이벤트
		        var con = document.getElementById("chckDel"); //삭제 버튼 
		        var con2 = document.getElementById("chckDel2"); //삭제 확인 버튼 
		        var con3 = document.getElementById("chckDel3"); //삭제 취소 버튼 

				/* var size = document.getElementById("size").value;  */
		        var size = <%=list.size()%>
		        num= 0;
		        for(var i=0; i<size; i++){
		        	document.getElementById(i).style.display = 'inline'; 
		        }
		        
		        con.style.display = 'none';
		        //con.style.removeProperty("display");
		       	con2.style.display = 'inline';
		       	con3.style.display = 'inline';

		        //con3.style.marginBottom = '15%';

		     });
		    
		     $("#chckDel3").click(function() { //버튼 클릭이벤트
		        var con = document.getElementById("chckDel"); //삭제 버튼 
		        var con2 = document.getElementById("chckDel2"); //삭제 확인 버튼 
		        var con3 = document.getElementById("chckDel3"); //삭제 취소 버튼 
		        
		        var size = <%=list.size()%>
		        num= 0;
		        for(var i=0; i<size; i++){
		        	document.getElementById(i).style.display = 'none'; 
		        }
		        
		        con.style.display = 'block';
		     /*    con2.style.removeProperty("display");
		        con3.style.removeProperty("display"); */

		        
		       	con2.style.display = 'none';
		       	con3.style.display = 'none';
		        
		     }); 
		
		});
		</script>
		

</body>
</html>
