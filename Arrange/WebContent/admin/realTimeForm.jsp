<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Dto.DtoRtime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.Dao"%>
<%@page import="Dto.Dto" %>
<%@page import="Dto.DtoPlace" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<tbody>
				
				<tr id="title">
					<td>#</td>
					<td>대여시간</td>
					<td>반납시간</td>
					<td>대여장소</td>
					<td>반납장소</td>
					<td>아이디</td>
					<td>이름</td>
				</tr>
				
			<%
			/* System.out.println(request.getParameter("searchOption"));
			System.out.println(request.getParameter("info")); */
			Dao dao = new Dao();
			if (request.getParameter("info") == null || request.getParameter("info") == ""){
				
				ArrayList<DtoRtime> list = dao.RtimeList();
				
				
				for (int i=0; i<list.size(); i++){
					String cardID = list.get(i).getCardId();
					String latitude = list.get(i).getLatitude();
					String longitude = list.get(i).getLongitude();
					String Rlatitude = list.get(i).getRlatitude();
					String Rlongitude = list.get(i).getRlongitude();
					String place1 = dao.getPlace(latitude, longitude);
					String place2 = dao.getPlace(Rlatitude, Rlongitude); 
					Dto dto = dao.getUser(cardID);
					String loginID = dto.getLoginID();
					String name = dto.getName();
					
				%>
					<tr>
						<td><%=i+1 %></td>
						<td><%=list.get(i).getUseTime()%></td>
						<%if(list.get(i).getReturnTime()==null){%>
						<td>반납대기</td>
						<% 
						} else {%>
						<td><%=list.get(i).getReturnTime()%></td>
						<%}%>
						<td><%=place1 %></td>
						<%if (place2 == null) {%>
						<td>반납대기</td>
						<%}else { %>
						<td><%=place2 %></td>
						<%} %>
						<td><%=loginID%></td>
						<td><%=name %></td>
					</tr>
			 	<%}	
			}else{
				String info = request.getParameter("info");
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				if (request.getParameter("searchOption").equals("ID")){	
					try{
						conn = dao.getMysqlConnection();
						String sql = "select useTime,returnTime,latitude,longitude,Rlatitude,Rlongitude,loginID,name from use_Info join user on use_Info.cardID = user.cardID where user.loginID = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, info);
						rs = pstmt.executeQuery();
						int i=0;
						while (rs.next()){
							String useTime = rs.getString("useTime");
							String returnTime = rs.getString("returnTime");
							String latitude = rs.getString("latitude");
							String longitude = rs.getString("longitude");
							String Rlatitude = rs.getString("Rlatitude");
							String Rlongitude = rs.getString("Rlongitude");
							String name = rs.getString("name");
							String place1 = dao.getPlace(latitude, longitude);
							String place2 = dao.getPlace(Rlatitude, Rlongitude);
							%>
							<tr>
								<td><%=i+1 %></td>
								<td><%=useTime%></td>
								<%if(returnTime==null){%>
								<td>반납대기</td>
								<% 
								} else {%>
								<td><%=returnTime%></td>
								<%}%>
								<td><%=place1 %></td>
								<%if (place2 == null) {%>
								<td>반납대기</td>
								<%}else { %>
								<td><%=place2 %></td>
								<%} %>
								<td><%=info%></td>
								<td><%=name %></td>
							</tr>
					 	<%
					 	i++;
					 	}	
						
					}catch(Exception e) {
						e.printStackTrace();
					}finally {        //오픈한 역순으로 닫기작업 실행
			            
			            //resultset= > statement=> connection
			                
			            try{
			                if(rs!=null){rs.close();}
			                
			            }catch(Exception e2){
			                e2.printStackTrace();
			            }
			            
			            try{
			                if(pstmt!=null){pstmt.close();}
			                
			            }catch(Exception e2){
			                e2.printStackTrace();
			            }
			            
			            try{
			                if(conn!=null){conn.close();}
			                
			            }catch(Exception e2){
			                e2.printStackTrace();
			            }
			        }
				}else if(request.getParameter("searchOption").equals("address")){
					try{
						conn = dao.getMysqlConnection();
						ArrayList<DtoPlace> list = dao.getPlaceName(info);
						for (int i=0; i<list.size(); i++){
							String latitude = String.valueOf(list.get(i).getLatitude());
							String longitude = String.valueOf(list.get(i).getLongitude());
							String sql = "select useTime,returnTime,latitude,longitude,Rlatitude,Rlongitude,loginID,name from use_Info join user on use_Info.cardID = user.cardID where use_Info.latitude = ? and use_Info.longitude = ?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, latitude);
							pstmt.setString(2, longitude);
							rs = pstmt.executeQuery();
							int j=0;
							while (rs.next()){
								String useTime = rs.getString("useTime");
								String returnTime = rs.getString("returnTime");
								String latitude2 = rs.getString("latitude");
								String longitude2 = rs.getString("longitude");
								String Rlatitude = rs.getString("Rlatitude");
								String Rlongitude = rs.getString("Rlongitude");
								String loginID = rs.getString("loginID");
								String name = rs.getString("name");
								String place1 = dao.getPlace(latitude2, longitude2);
								String place2 = dao.getPlace(Rlatitude, Rlongitude);
								%>
								<tr>
									<td><%=j+1 %></td>
									<td><%=useTime%></td>
									<%if(returnTime==null){%>
									<td>반납대기</td>
									<% 
									} else {%>
									<td><%=returnTime%></td>
									<%}%>
									<td><%=place1 %></td>
									<%if (place2 == null) {%>
									<td>반납대기</td>
									<%}else { %>
									<td><%=place2 %></td>
									<%} %>
									<td><%=loginID%></td>
									<td><%=name %></td>
								</tr>
							<%
							j++;
							}
						}	
					}catch(Exception e) {
						e.printStackTrace();
					}finally {        //오픈한 역순으로 닫기작업 실행
			            
			            //resultset= > statement=> connection
			                
			            try{
			                if(rs!=null){rs.close();}
			                
			            }catch(Exception e2){
			                e2.printStackTrace();
			            }
			            
			            try{
			                if(pstmt!=null){pstmt.close();}
			                
			            }catch(Exception e2){
			                e2.printStackTrace();
			            }
			            
			            try{
			                if(conn!=null){conn.close();}
			                
			            }catch(Exception e2){
			                e2.printStackTrace();
			            }
			        }
				}else{
					try{
						conn = dao.getMysqlConnection();
						ArrayList<DtoPlace> list = dao.getPlaceName(info);
						for (int i=0; i<list.size(); i++){
							String latitude = String.valueOf(list.get(i).getLatitude());
							String longitude = String.valueOf(list.get(i).getLongitude());
							String sql = "select useTime,returnTime,latitude,longitude,Rlatitude,Rlongitude,loginID,name from use_Info join user on use_Info.cardID = user.cardID where use_Info.Rlatitude = ? and use_Info.Rlongitude = ?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, latitude);
							pstmt.setString(2, longitude);
							rs = pstmt.executeQuery();
							int j=0;
							while (rs.next()){
								String useTime = rs.getString("useTime");
								String returnTime = rs.getString("returnTime");
								String latitude2 = rs.getString("latitude");
								String longitude2 = rs.getString("longitude");
								String Rlatitude = rs.getString("Rlatitude");
								String Rlongitude = rs.getString("Rlongitude");
								String name = rs.getString("name");
								String loginID = rs.getString("loginID");
								String place1 = dao.getPlace(latitude2, longitude2);
								String place2 = dao.getPlace(Rlatitude, Rlongitude);
								%>
								<tr>
									<td><%=j+1 %></td>
									<td><%=useTime%></td>
									<%if(returnTime==null){%>
									<td>반납대기</td>
									<% 
									} else {%>
									<td><%=returnTime%></td>
									<%}%>
									<td><%=place1 %></td>
									<%if (place2 == null) {%>
									<td>반납대기</td>
									<%}else { %>
									<td><%=place2 %></td>
									<%} %>
									<td><%=loginID%></td>
									<td><%=name %></td>
								</tr>
							<%
							j++;
							}
						}	
					}catch(Exception e) {
						e.printStackTrace();
					}finally {        //오픈한 역순으로 닫기작업 실행
			            
			            //resultset= > statement=> connection
			                
			            try{
			                if(rs!=null){rs.close();}
			                
			            }catch(Exception e2){
			                e2.printStackTrace();
			            }
			            
			            try{
			                if(pstmt!=null){pstmt.close();}
			                
			            }catch(Exception e2){
			                e2.printStackTrace();
			            }
			            
			            try{
			                if(conn!=null){conn.close();}
			                
			            }catch(Exception e2){
			                e2.printStackTrace();
			            }
			        }
				}
				
			}%>
							
</tbody>