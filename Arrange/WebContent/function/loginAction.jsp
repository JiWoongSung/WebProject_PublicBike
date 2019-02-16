<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <%int admin_id = (int)request.getAttribute("admin_id");
  	String logID = (String)request.getAttribute("logID");
  	String logPW = (String)request.getAttribute("logPW");
  		%>
		<h1><%=logID%></h1>
		<h1><%=admin_id%></h1>
		<h1><%=logPW%></h1>
		<% 
  		if(admin_id==1){
  			session.setAttribute("id",logID);
  			session.setAttribute("pw",logPW);
  			session.setAttribute("admin_id",admin_id);

  			response.sendRedirect("admin/map.jsp");
  		}
  		else{
  			session.setAttribute("id",logID);
  			session.setAttribute("pw",logPW);
  			session.setAttribute("admin_id",admin_id);

  			response.sendRedirect("user/map_client.jsp");
  		}
  	%>
  
	<!-- if(content == 1) {
		//session.setAttribute("L_id",1);
		//session.setAttribute("S_id",2); 
		response.sendRedirect("map.jsp"); 
	}else {
		response.sendRedirect("test.jsp");
	}
	%> -->
</body>
</html>