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
	String code = null;
	String userID = null;
	if(request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
	if(request.getParameter("userID") != null) {
		userID = request.getParameter("userID");
	}

	Dao Dao = new Dao();

	String userEmail = Dao.getUserEmail(userID);

	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

	if(isRight==true){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다.');");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		
		Dao.userEmailadd(userID);
				
	}
	
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 실패했습니다. 다시 시도해 주세요.');");
		script.println("location.href = 'login.jsp' ");
		script.println("</script>");
		script.close();
		
	}
%>
	
	

