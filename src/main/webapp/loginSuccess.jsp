<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String adminID = request.getParameter("adminID");
		String adminPW = request.getParameter("adminPW");
		
		String sql = "SELECT * FROM members WHERE id=? AND passwd=?";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://192.168.0.100:3306/jdy_jsp_project_db";
		String username ="guest01";
		String password ="12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// int count = pstmt.executeUpdate();
		
		try {
			Class.forName(driverName); // mySQL 드라이브 불러오기
			conn = DriverManager.getConnection(url, username, password); //DB와의 커넥션 생성
			// out.println(conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminID);
			pstmt.setString(2, adminPW);
			// pstmt.setString(3, uemail);
			
			rs = pstmt.executeQuery();
			
			if(rs.next() && adminID.equals("space")) {
				// out.println("관리자 로그인 성공!");
				session.setAttribute("adminID", adminID); // adminID 대신 rs.getString(adminID)도 가능
			} else {
				// out.println("관리자 로그인 실패!");
				response.sendRedirect("loginError.jsp");
			}
			
		} catch(Exception e) {
			// out.println("DB연결 실패!!");
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
	%>
	<h4>관리자 로그인</h4>
	<hr>
	새로운 세션 성공.<br>
	관리자 [<%= adminID %>]님이 로그인 하셨습니다.<br>
	<table border="0">
		<tr>
			<td>
				<form action="memberList.jsp">
					<input type="submit" value="◀ 등록회원 관리하기">
				</form>	
			</td>
			<td>
				<form action="logout.jsp">
					<input type="submit" value="로그 아웃 ▶">
				</form>	
			</td>	
		</tr>	
	</table>	
</body>
</html>