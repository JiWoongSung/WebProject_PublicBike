package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.*;


@WebServlet("/DataDelete")
public class DataDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); //한글처리 
		//String context = request.getContextPath(); //프로젝트의 path가져오기 ex)/WebTest2
		Dao dao = new Dao();
		
		String id =request.getParameter("id");
		//delete함수 생성. 
		dao.dataDelete(id);
		
        //response.sendRedirect(context + "/common/login.jsp");
	
        String msg="";
        String loc="";
        String view="";

        
        msg="회원탈퇴 완료했습니다.";
		loc="/common/login.jsp";
		view="function/msg.jsp";
		request.setAttribute("msg",id+"님 "+msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reDispatcher = request.getRequestDispatcher(view);
		reDispatcher.forward(request, response);
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
