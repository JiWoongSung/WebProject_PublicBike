package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import Dao.Dao;
import Dto.DtoUseInfo;

/**
 * Servlet implementation class RfidInfo
 */
@WebServlet("/RfidInfo")
public class RfidInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RfidInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8"); //한글처리 
		
		Dao dao = new Dao();
		
		String Rfid = request.getParameter("Rfid");
		
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");

	    DtoUseInfo dto = new DtoUseInfo(latitude,longitude,Rfid);

		System.out.println(Rfid);
		System.out.println(latitude);
		System.out.println(longitude);	
				
		if(dao.returnTimeCheck(Rfid)==1) {
			dao.returnTimeInsert(Rfid,latitude,longitude);
		}else {
			dao.rfidInsert(dto);
		}
		String msg;
		String loc;
		String view;
		msg="123";
		loc="/admin/map.jsp";
		view="admin/map.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		RequestDispatcher reDispatcher = request.getRequestDispatcher(view);
		reDispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
