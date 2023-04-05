<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
</head>
<body>
	<%
	    String driverName = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost:3306/jsp_testdb";
	    String username = "root";
	    String password = "1234";
	    String sql ="SELECT * FROM members where id = 'tiger'";
	    
	    Statement stmt = null;
	    Connection conn = null; 
	    ResultSet rs = null;
	      
	    try {
	        Class.forName(driverName);//드라이버 로딩
	        conn = DriverManager.getConnection(url, username, password);//연결 생성
			stmt = conn.createStatement();
	        
	  	rs = stmt.executeQuery(sql);
	  	
	  	while(rs.next()){ //rs안에 들어있는 레코드의 개수만큼 반복한다.
	  		String mid = rs.getString("id");
	  		String mpw = rs.getString("pw");
	  		String mname = rs.getString("name");
	  		String memail = rs.getString("email");
	  		String msignuptime = rs.getString("signuptime");
	  		
	  		out.println(mid+" / "+ mpw + " / " + mname+" / "+ memail+" / "+ msignuptime +"<br>");
	  	}
	   
	         
	         
	    } catch(ClassNotFoundException e) {
	         out.println("DB 드라이버 로딩 실패!!!!!");   
	    } catch(SQLException e) {
	         out.println("DB 연결 실패!!!!!");
	    } finally {
	       try {
	    	  if(rs != null) {
	               rs.close();
	          }
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