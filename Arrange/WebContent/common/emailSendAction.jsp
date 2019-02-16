<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>


<%@ page import="Dao.Dao"%>
<%@ page import="util.SHA256"%>
<%@ page import="util.Gmail" %>
<%@ page import="java.io.PrintWriter"%>

<% 
	request.setCharacterEncoding("UTF-8");
	String userID = null;
/* 	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	} */

	String data = (String)request.getAttribute("msg");
	userID = data;

	Dao Dao = new Dao();

	String host = "http://localhost:9006/Arrange/common/";
	String from = "qjdbsn5@gmail.com";
	String to = Dao.getUserEmail(userID);
	String subject = "자전거 대여 서비스 회원가입을 위한 이메일 인증 메일입니다.";
	String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." +
		"<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "&userID="+ userID +"'> 이메일 인증하기</a>"; 

	Properties p = new Properties();
	p.put("mail.smtp.user",from);
	p.put("mail.smtp.host","smtp.gmail.com");
	p.put("mail.smtp.port","465");
	p.put("mail.smtp.starttls.enable","true");
	p.put("mail.smtp.auth","true");
	p.put("mail.smtp.debug","true");
	p.put("mail.smtp.socketFactory.port","465");
	p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback","false");
	
	try {
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF8");
		Transport.send(msg);
		
	} catch (Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	%>

<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"></link>
		<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
		</script>
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
		      <a class="navbar-brand" href="../Arrange/common/login.jsp">로그인하기</a>
		    </div>
		  </div>
		</nav>
		
		
		<body>
			
			<header>
				<h1 style="text-align: center">이메일 전송 완료!</h1>
			</header>
		 	<div class="alert alert-success mt-4" role="alert">
		 		이메일 주소 인증 메일이 전송되었습니다. 회원가입시 입력했던 이메일에 들어가셔서 인증해주세요.
		 	</div>
		</body>
</html>

	

