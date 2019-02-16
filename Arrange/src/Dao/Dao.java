package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Dto.*;

public class Dao {
	public static Connection getMysqlConnection() {

		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String DB_url = "jdbc:mysql://localhost:3306/dbTable";
			String DB_user = "root";
			String DB_password = "wldnd123";
			conn = DriverManager.getConnection(DB_url, DB_user, DB_password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// cardID를 통해 loginID, 이름 받아오기
	public Dto getUser(String cardID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getMysqlConnection();
			String sql = "select * from user where cardID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Dto dto = new Dto();
				dto.setBalance(rs.getInt("balance"));
				dto.setBirth(rs.getString("birth"));
				dto.setCardID(rs.getString("cardID"));
				dto.setCount(rs.getInt("count"));
				dto.setDate(rs.getString("date"));
				dto.setGender(rs.getString("gender"));
				dto.setLoginID(rs.getString("loginID"));
				dto.setName(rs.getString("name"));
				dto.setPassword(rs.getString("password"));
				return dto;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 오픈한 역순으로 닫기작업 실행

			// resultset= > statement=> connection

			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	public String getPlace(String latitude, String longitude) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getMysqlConnection();
			String sql = "select placeName from place where latitude = ? and longitude = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, latitude);
			pstmt.setString(2, longitude);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String placeName = rs.getString("placeName");
				return placeName;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 오픈한 역순으로 닫기작업 실행

			// resultset= > statement=> connection

			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	public ArrayList<DtoPlace> getPlaceName(String placeName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<DtoPlace> list = new ArrayList<>();
		try {
			conn = getMysqlConnection();
			String sql = "select * from place where placeName like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + placeName + "%");

			rs = pstmt.executeQuery();
			while (rs.next()) {

				String placeName2 = rs.getString("placeName");
				double latitude = Double.parseDouble(rs.getString("latitude"));
				double longitude = Double.parseDouble(rs.getString("longitude"));
				int count = rs.getInt("count");
				int money = rs.getInt("money");
				list.add(new DtoPlace(placeName2, latitude, longitude, count, money));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 오픈한 역순으로 닫기작업 실행

			// resultset= > statement=> connection

			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<DtoPlace> getPlaceList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<DtoPlace> list = new ArrayList<>();
		try {
			conn = getMysqlConnection();
			String sql = "select * from place";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String placeName = rs.getString("placeName");
				double latitude = Double.parseDouble(rs.getString("latitude"));
				double longitude = Double.parseDouble(rs.getString("longitude"));
				int count = rs.getInt("count");
				int money = rs.getInt("money");
				list.add(new DtoPlace(placeName, latitude, longitude, count, money));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 오픈한 역순으로 닫기작업 실행

			// resultset= > statement=> connection

			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

	public int Admin_check(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getMysqlConnection();
			String sql = "select isAdmin from user where user.loginID = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 1) {
					return 1;
				} else {
					return 0;
				}
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return -2;
	}

	public String Pw_check(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getMysqlConnection();
			String sql = "select password from user where loginID = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1) != null) {
					return rs.getString(1);
				} else {
					return "실패";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return "error";
	}

	public ArrayList<Dto> userInfo(String user_id) {

		ArrayList<Dto> list = new ArrayList<Dto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getMysqlConnection();
			String sql = "select * from user where loginID= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			rs.next();

			Dto dto = new Dto();
			dto.setLoginID(rs.getString("loginID"));
			dto.setPassword(rs.getString("password"));
			dto.setCardID(rs.getString("cardID"));
			dto.setName(rs.getString("name"));
			dto.setGender(rs.getString("gender"));
			dto.setBirth(rs.getString("birth"));
			dto.setCount(rs.getInt("count"));
			dto.setDate(rs.getString("date"));
			dto.setBalance(rs.getInt("balance"));
			list.add(dto);

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 오픈한 역순으로 닫기작업 실행

			// resultset= > statement=> connection

			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return list;
	}

	public int LoginID(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getMysqlConnection();
			String sql = "select password from user where user.loginID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(pass)) {
					return 1;
				} else {
					return 0;
				}
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return -2;
	}

	public ArrayList<DtoRtime> RtimeList() {
		ArrayList<DtoRtime> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getMysqlConnection();
			String sql = "select * from use_info order by useTime";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				DtoRtime tdto = new DtoRtime();
				tdto.setUseTime(rs.getString("useTime"));
				tdto.setReturnTime(rs.getString("returnTime"));
				tdto.setLatitude(rs.getString("latitude"));
				tdto.setLongitude(rs.getString("longitude"));
				tdto.setRlatitude(rs.getString("Rlatitude"));
				tdto.setRlongitude(rs.getString("Rlongitude"));
				tdto.setCardId(rs.getString("cardId"));

				list.add(tdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 오픈한 역순으로 닫기작업 실행

			// resultset= > statement=> connection

			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return list;
	}

	// data 리스트
	public ArrayList<Dto> dataList() { // 현재 db를 리스트에 넣는다.

		ArrayList<Dto> list = new ArrayList<Dto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getMysqlConnection();
			String sql = "select * from user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Dto dto = new Dto();
				dto.setLoginID(rs.getString("loginID"));
				dto.setPassword(rs.getString("password"));
				dto.setCardID(rs.getString("cardID"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setBirth(rs.getString("birth"));
				dto.setCount(rs.getInt("count"));
				dto.setDate(rs.getString("date"));
				dto.setBalance(rs.getInt("balance"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 오픈한 역순으로 닫기작업 실행

			// resultset= > statement=> connection

			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return list;

	}

	public void placeDataInsert(DtoPlace dtoP) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getMysqlConnection();

			String sql = "insert into place values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dtoP.getPlaceName());
			pstmt.setDouble(2, dtoP.getLatitude());
			pstmt.setDouble(3, dtoP.getLongitude());
			pstmt.setInt(4, dtoP.getCount());
			pstmt.setInt(5, dtoP.getMoney());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 리소스 정리작업
			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	// 삽입
	public void dataInsert(Dto dto) {

		Connection conn = null; // DB접속 객체
		PreparedStatement pstmt = null; // SQL실행객체

		try {

			conn = getMysqlConnection();

			String sql = "insert into user(loginID, password, cardID, name, gender, birth, count , date, balance , userEmail , userEmailHash)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?)";

			// sql 실행객체 생성
			pstmt = conn.prepareStatement(sql);

			// ? 에 입력될 값 매핑
			pstmt.setString(1, dto.getLoginID());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getCardID());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getBirth());
			pstmt.setInt(7, dto.getCount());
			pstmt.setString(8, dto.getDate());
			pstmt.setInt(9, dto.getBalance());
			pstmt.setString(10, dto.getEmail());
			pstmt.setString(11, dto.getSHA256());

			// executeQuery() select 명령어
			// executeUpdate select 이외 명령어
			pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			// 리소스 정리작업
			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}

	}

	public int returnTimeCheck(String id) {

		Connection conn = null; // DB접속 객체
		PreparedStatement pstmt = null; // SQL실행객체
		ResultSet rs = null;

		try {

			conn = getMysqlConnection();

			String sql = "select * from use_Info where returnTime is null and cardID = ? ";

			// sql 실행객체 생성
			pstmt = conn.prepareStatement(sql);

			// ? 에 입력될 값 매핑
			pstmt.setString(1, id);

			// executeQuery() select 명령어
			// executeUpdate select 이외 명령어
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;
			} else {
				return 0;
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			// 리소스 정리작업
			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return -1;

	}

	public void returnTimeInsert(String id, String Rlatitude, String Rlongitude) {

		Connection conn = null; // DB접속 객체
		PreparedStatement pstmt = null; // SQL실행객체
		PreparedStatement pstmt2 = null; // SQL실행객체

		try {

			conn = getMysqlConnection();

			// String sql="update use_Info set returnTime = now() where cardID = ? ";
			String sql = "update use_Info set returnTime = now(), Rlatitude = ?, Rlongitude = ?  where cardID = ? ";
			String sql2 = "update place set count = count + 1 where latitude = ? and longitude = ?";

			// sql 실행객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt2 = conn.prepareStatement(sql2);

			// ? 에 입력될 값 매핑
			pstmt.setString(1, Rlatitude);
			pstmt.setString(2, Rlongitude);
			pstmt.setString(3, id);

			//
			pstmt2.setString(1, Rlatitude);
			pstmt2.setString(2, Rlongitude);

			// executeQuery() select 명령어
			// executeUpdate select 이외 명령어
			pstmt.executeUpdate();
			pstmt2.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			// 리소스 정리작업
			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}

	}

	public void rfidInsert(DtoUseInfo dto) {

		Connection conn = null; // DB접속 객체
		PreparedStatement pstmt = null; // SQL실행객체
		PreparedStatement pstmt2 = null; // SQL실행객체

		try {

			conn = getMysqlConnection();

			String sql = "insert into use_Info(latitude, longitude, cardID, useTime) values(?,?,?,now())";
			String sql2 = "update place set count = count - 1 where latitude = ? and longitude = ?";

			// sql 실행객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt2 = conn.prepareStatement(sql2);

			// ? 에 입력될 값 매핑
			pstmt.setString(1, dto.getLatitude());
			pstmt.setString(2, dto.getLongitude());
			pstmt.setString(3, dto.getCardID());

			//
			pstmt2.setString(1, dto.getLatitude());
			pstmt2.setString(2, dto.getLongitude());

			// executeQuery() select 명령어
			// executeUpdate select 이외 명령어
			pstmt.executeUpdate();
			pstmt2.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			// 리소스 정리작업
			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}

	}

	public void dataDelete(String id) {

		Connection conn = null; // DB접속 객체
		PreparedStatement pstmt = null; // SQL실행객체

		try {

			conn = getMysqlConnection();

			String sql = "delete from user where loginID = " + "\"" + id + "\"";

			// sql 실행객체 생성
			pstmt = conn.prepareStatement(sql);

			// executeQuery() select 명령어
			// executeUpdate select 이외 명령어
			pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			// 리소스 정리작업
			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
	}

	public int id_Check(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getMysqlConnection();
			String sql = "select * from user where loginID = " + "\"" + id + "\"";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				return 1;
			} else {
				return 0;
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			// 리소스 정리작업
			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return -1;
	}

	public int emailCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getMysqlConnection();
			String sql = "select userEmailChecked from user where loginID = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) == 1) {
				return 1;
			} else {
				return 0;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return -1;
	}

	public String getUserEmail(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getMysqlConnection();
			String sql = "select userEmail from user where loginID = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			rs.next();
			return rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return "";
	}

	public void userEmailadd(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getMysqlConnection();
			String sql = "update user set userEmailChecked = 1 where loginID = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

			try {
				if (conn != null) {
					conn.close();
				}

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
	}

}
