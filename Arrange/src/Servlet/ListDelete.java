package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.*;

@WebServlet("/ListDelete")
public class ListDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); //한글처리 
		//String context = request.getContextPath(); //프로젝트의 path가져오기 ex)/WebTest2
		String[] value = request.getParameterValues("delete");
		
		int num =-1; 
		
		for(String val : value) {
			Dao dao = new Dao();
			//String id =
			dao.dataDelete(val);
			num++;
		}
		
		String msg = "";
		String loc = "";
		String view = "";
		
		msg= num +"개 삭제 완료했습니다.";
		loc="/admin/view.jsp";
		view="function/msg.jsp";
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reDispatcher = request.getRequestDispatcher(view);
		reDispatcher.forward(request, response);
						
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
