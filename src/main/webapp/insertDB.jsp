<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertDB.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String uid = request.getParameter("userID");
		String upw = request.getParameter("userPW");
		String uemail = request.getParameter("userEmail");
		
		String sql = "INSERT INTO members(id, passwd, email) VALUES(?,?,?)";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://192.168.0.100:3306/jdy_jsp_project_db";
		String username ="guest01";
		String password ="12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driverName); // mySQL 드라이브 불러오기
			conn = DriverManager.getConnection(url, username, password); //DB와의 커넥션 생성
			// out.println(conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			pstmt.setString(3, uemail);
			
			int success = pstmt.executeUpdate();
			
			if(success == 1) {
				// out.println("회원 가입 성공!");
				response.sendRedirect("signupSuccess.jsp");
			} else {
				// out.println("회원 가입 실패!");
				response.sendRedirect("signup.jsp");
			}
			
		} catch(Exception e) {
			// out.println("DB연결 실패!!");
			e.printStackTrace();
		} finally {
			try {
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
	
	
	
	
</body>
</html>