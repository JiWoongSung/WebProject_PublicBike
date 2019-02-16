package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.*;

@WebServlet("/Login/*")

public class Login extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public Login() {
		super();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("utf-8");
		Dao dao = new Dao();
		//String context = request.getContextPath();
		String logID = request.getParameter("loginID");
		String password = request.getParameter("password");

		int rsID = dao.LoginID(logID,password);
		int admin_id = dao.Admin_check(logID);
		String logPW = dao.Pw_check(logID);
		int check = dao.emailCheck(logID);
		//int alert=1;
		

		
		String msg ="";
		String loc ="";
		String view ="";		


		if (rsID == 0) {
			//JOptionPane.showMessageDialog(null, "비밀번호가 틀렸습니다.");
			msg="비밀번호가 틀렸습니다.";
			loc="/common/login.jsp";
			view="function/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			RequestDispatcher reDispatcher = request.getRequestDispatcher(view);
			reDispatcher.forward(request, response);
			
		}else if (rsID == 1 && check==1){
			
		    request.setAttribute("admin_id", admin_id);
		    request.setAttribute("logID", logID);
		    request.setAttribute("logPW", logPW);

		    ServletContext context2 =getServletContext();
		    RequestDispatcher dispatcher = context2.getRequestDispatcher("/function/loginAction.jsp"); //넘길 페이지 주소
		    dispatcher.forward(request, response);

			//response.sendRedirect(context+"/loginAction.jsp");
		}else if (rsID == -1){
			msg="아이디가 존재하지 않습니다.";
			loc="/common/login.jsp";
			view="function/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			RequestDispatcher reDispatcher = request.getRequestDispatcher(view);
			reDispatcher.forward(request, response);
	

		}else if(check!=1) {
			msg="이메일 인증이 안된 아이디입니다.";
			loc="/common/login.jsp";
			view="function/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			RequestDispatcher reDispatcher = request.getRequestDispatcher(view);
			reDispatcher.forward(request, response);
			
		}
		
		else {
			msg="오류!!";
			loc="/common/login.jsp";
			view="function/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			RequestDispatcher reDispatcher = request.getRequestDispatcher(view);
			reDispatcher.forward(request, response);
		}
		
		
	}
	
}
