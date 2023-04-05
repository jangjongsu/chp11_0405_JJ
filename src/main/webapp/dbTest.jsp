<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my sql 연동 체크</title>
</head>
<body>
	<%
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jsp_testdb";
		String username = "root";
		String password = "1234";
		
		Connection conn = null;
		
		try {
			Class.forName(driverName); // 드라이버 로딩

			conn = DriverManager.getConnection(url, username, password); // 연결 생성
			
			out.print("DB연결 성공!!!" + conn);

			
		} catch(ClassNotFoundException e){
			out.print("DB 드라이버 로딩 실패");
		}catch(SQLException e1){
			out.print("DB 연결 실패");
		} finally{
			try{
				if (conn != null){
					conn.close();
				}
			}catch(Exception e2){
				e2.printStackTrace(); // 에러내용 출력
			}

		}
		
	%>
</body>
</html>