<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    
    int num=0;
    String sql="select max(num) from board1212";
    pstmt=conn.prepareStatement(sql);
    rs=pstmt.executeQuery();
    if(rs.next()){
    	num=rs.getInt(1)+1;
    }else{
    	num=1;
    }
     
    String title=request.getParameter("title");
    String name=request.getParameter("name");
    String password=request.getParameter("password");
    String memo=request.getParameter("memo");
    
    try{
    	sql="insert into board1212(num,name,password,title,memo,ref,time) values(?,?,?,?,?,?,sysdate)";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setInt(1, num);
    	pstmt.setString(2, name);
    	pstmt.setString(3, password);
    	pstmt.setString(4, title);
    	pstmt.setString(5, memo);
    	pstmt.setInt(6, num+1);
    	pstmt.executeUpdate();
    	%>
    	<script>
    	  alert("게시판 저장 완료");
    	  location.href="board_select.jsp"
    	</script>
    	<%
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
</body>
</html>