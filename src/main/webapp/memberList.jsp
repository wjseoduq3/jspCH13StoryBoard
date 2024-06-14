<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
	<%
		if (session.getAttribute("adminID") == null || !(session.getAttribute("adminID").equals("space"))) {
			response.sendRedirect("login.jsp");
		}	
	%>
	<h4>회원 리스트</h4>
	<hr>
	회원번호 / 아이디 / 이메일 / 가입일시 <br>
	<%
		String sql = "SELECT id, email, signuptime FROM members";
				
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
						
			rs = pstmt.executeQuery();
			
			int count = 0;
			while (rs.next()) {
				count++;
				String mid = rs.getString("id");
				String memail = rs.getString("email");
				String mtime = rs.getString("signuptime");
				
				out.println(count + ":" + mid + "/" + memail + "/" + mtime + "<br>");
			}
			
			out.println("총회원수:" + count + "명");
			
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
	<hr>
	<table border="0">
		<tr>
			<td>
				<form action="withdraw.jsp">
					<input type="submit" value="◀ 회원탈퇴 시키기">
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