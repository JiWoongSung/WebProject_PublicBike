<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
</script>
<script>
window.onload = function(){
	//if(session!=null) session.invalidate();
// 	int alert_num = (int)request.getAttribute("alert");
	<%-- <%if(session!=null) session.invalidate();%> --%>
}
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
		session.invalidate();
	%>
	
	<header>
		<h1 style="text-align: center">로그인</h1>
	</header>
	<hr>
 	<div class="container">
 		<div class="divClass col-md-offset-3 col-md-6">
    		<form name="form1" class="form-group" method="post" action="<%=request.getContextPath()%>/Login">
 				<div class="form-group">
 					<label>ID</label>
 					<input type="text" class="form-control" name="loginID" id="loginID" autocomplete=off placeholder="ID">
        		</div>
        		<div class="form-group">
        			<label>비밀번호</label>
        			<input type="password" class="form-control" name="password" id="password" autocomplete=off placeholder="비밀번호">
        		</div>
        		<input type="submit" class="btn btn-primary" value="확인">
        		<a href="insert.jsp"><input type="button" class="btn btn-default" value="회원가입"></a>
    		</form>
    	</div>
 	</div>
</body>
</html>