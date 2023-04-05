<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		String mid = request.getParameter("did");
	
		String driverName = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost:3306/jsp_testdb";
	    String username = "root";
	    String password = "1234";
	    String sql = "delete from members where id = '" + mid+"'" ;
	    
	    Statement stmt = null;
	    Connection conn = null; 
	      
	    try {
	        Class.forName(driverName);//드라이버 로딩
	        conn = DriverManager.getConnection(url, username, password);//연결 생성
			stmt = conn.createStatement();
	        
	  	int dbFlag = stmt.executeUpdate(sql);
	  	if (dbFlag == 1){
	    	out.print("성공");
	    }else{
	    	out.print("실패");
	    }
	  
	         
	         
	    } catch(ClassNotFoundException e) {
	         out.println("DB 드라이버 로딩 실패!!!!!");   
	    } catch(SQLException e) {
	         out.println("DB 연결 실패!!!!!");
	    } finally {
	       try {
	    	  if(stmt != null) {
	               stmt.close();
	          }
	          if(conn != null) {
	               conn.close();
	          }
	       } catch(Exception e) {
	            e.printStackTrace();//에러 발생시 에러의 내용을 출력
	       }
	    }
	
	%>

</body>
</html>