<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.parser.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URL"%>
<%@ page import="Servlet.*" %>
<%@ page import="Dao.*" %>
<%@ page import="Dto.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=FYFhRnwytL_GPyfrX0G7&submodules=geocoder"></script>
	<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>	
	<link rel="stylesheet" href="../css/map.css"></link>
	<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<% 
		response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
	%>
</head>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <%Object id = session.getAttribute("id");
	      if (id==null) {%>
	      	    <a class="navbar-brand" href="../common/login.jsp">로그인하기</a>
	      
	      <% } else {%>
	      		<a class="navbar-brand" href="map_client.jsp">Home</a>
	    	<% }%>
	    </div>
	
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav navbar-right">
	      	<%Object n = session.getAttribute("id");%>
	      	<li><a><%=n %>님</a></li>
	       <%if(id==null){	}else{%>
	        <li class="dropdown">
	          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">메뉴<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	          	
	            <li><a href="../common/mypage.jsp">회원정보확인</a></li>
	           	<li><a href="../common/login.jsp">로그아웃</a></li>
	           	
	          </ul>
	         
	        </li>
	        <% }%>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="container-fluid">
		<div class="col-md-3" id="placeDiv">
			<form>
				<div class="form-inline">
					
					<input type="text" id="search" class="form-control" name="search"
						placeholder="검색">
					<input type="button" id="execute"
						class="form-control btn btn-default" value="확인">
				
				</div>
			</form>
			<br>
			<div class="list-group" id="placeList">
				
			</div>
			<!-- <div class="dropdown">
			  <input class="btn btn-default"type="text" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" placeholder="검색">
			   
			  <ul id="placeList" class="dropdown-menu" aria-labelledby="dropdownMenu1">
			    
			  </ul>
			</div> -->
		</div>
		<div class="col-md-9">
			<div id="map" style="width:100%;height:500px;"></div>
		</div>
		
		
	</div>
	<%
	
	%>
	
	
	<script type="text/javascript" src="main.js"></script>
	
	
</body>
</html>