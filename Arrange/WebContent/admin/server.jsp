<%@page import="Dto.DtoPlace"%>
<%@page import="Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.simple.*"%>
<%@ page import="org.json.simple.parser.*"%>
<%@ page import="java.io.PrintWriter" %>

	<%
	if(request.getParameter("name") != null){
		response.setContentType("text/html;charset=UTF-8");
		JSONArray series = new JSONArray();
    	JSONObject objec = new JSONObject();
		Dao dao = new Dao();
		ArrayList<DtoPlace> list = dao.getPlaceName(request.getParameter("name"));
		for (int i=0; i<list.size(); i++){
			JSONObject obj = new JSONObject();
			obj.put("name",list.get(i).getPlaceName());
			obj.put("location", list.get(i).getLatitude()+" "+list.get(i).getLongitude()+" "+list.get(i).getCount());
			series.add(obj);
	
		}
		PrintWriter outs = response.getWriter();
		objec.put("list", series);
		outs.print(objec);
	}else{
		JSONArray series = new JSONArray();
    	JSONObject objec = new JSONObject();
		Dao dao = new Dao();
		ArrayList<DtoPlace> list = dao.getPlaceList();
		for (int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();
			
			String placeName = list.get(i).getPlaceName();
			double latitude = list.get(i).getLatitude();
			double longitude = list.get(i).getLongitude();
			int count = list.get(i).getCount();
			obj.put("name",placeName);
			obj.put("latitude", latitude);
			obj.put("longitude", longitude);
			obj.put("count", count);

			series.add(obj);
		}
		PrintWriter outs = response.getWriter();
		objec.put("list", series);
		outs.print(objec);
	}
	%>