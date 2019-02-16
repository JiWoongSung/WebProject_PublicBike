package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import Dao.Dao;

/**
 * Servlet implementation class idCheck
 */
@WebServlet("/idCheck")
public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public idCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String loginID = request.getParameter("loginID");
		
		Dao dao = new Dao();
		JSONObject obj = new JSONObject();
		
		if(loginID == "") {
			obj.put("result", -1);

		}else {
			obj.put("result", dao.id_Check(loginID));
		}

		
		//		obj.put("result", "1"); 성공 
		//		obj.put("result", "-1"); 실패 

		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);
		


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
