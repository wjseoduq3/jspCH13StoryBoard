<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그아웃</title>
</head>
<body>
	<%
		session.invalidate();	
	%>
	<h4>관리자 로그아웃</h4>
	<hr>
	세션을 종료하고 로그아웃하였습니다.<br>
	그동안 수고많으셨습니다.<br>
	<table border="0">
		<tr>
			<td>
				<form action="main.jsp">
					<input type="submit" value="메인화면으로 이동 ▶">
				</form>	
			</td>	
		</tr>	
	</table>	
</body>
</html>