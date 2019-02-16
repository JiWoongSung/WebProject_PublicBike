package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import Dao.*;
import Dto.*;
import util.SHA256;

@WebServlet("/DataInsert/*")
public class DataInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DataInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); //한글처리 
		//String context = request.getContextPath(); //프로젝트의 path가져오기 ex)/WebTest2
		Date today = new Date();
		SimpleDateFormat sToday = new SimpleDateFormat("yyyy-MM-dd");
		Dao dao = new Dao();

		String loginID = request.getParameter("loginID");
		String cardID = request.getParameter("cardID");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
	    String gender = request.getParameter("gender");
	    String birth = request.getParameter("birth");
	    String email1 = request.getParameter("email1");
	    String email2 = request.getParameter("email2");
	    String email = email1 + "@" + email2;
	    
	    System.out.println("email값 - > "+email);

	    int balance = 10000;
	    int count = 0;//Integer.parseInt(request.getParameter("count"));
	    String date = sToday.format(today);
	    Dto dto = new Dto(loginID,password,cardID, name, gender,birth,count,date,balance,email,SHA256.getSHA256(email));

        dao.dataInsert(dto);//테이블 저장 
        
		String msg = "";
		String loc = "";
		String view = "";
		
//		msg= "이메일 인증 후 회원가입이 완료됩니다.";
//		loc="/common/login.jsp";
//		view="function/msg.jsp";
		
		msg=loginID;
		loc="/common/login.jsp";
		view="common/emailSendAction.jsp";
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
