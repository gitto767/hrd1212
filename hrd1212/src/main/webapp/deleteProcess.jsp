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
    int idx=Integer.parseInt(request.getParameter("idx"));
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    String passwd=request.getParameter("password");
    String password="";
    try{
    	String sql="select password from board1212 where num=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setInt(1, idx);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		password=rs.getString(1);
    	}
    	if(passwd.equals(password)){
    		sql="delete from board1212 where num=?";
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setInt(1, idx);
    		pstmt.executeUpdate();
    		%>
    		<script>
    		  alert("삭제되었습니다.");
    		  location.href="board_select.jsp"
    		</script>
    		<%
    	}else{
    		%>
    		<script>
    		  alert("비밀번호가 일치하지 않습니다.");
    		  history.back(-1);
    		</script>
    		<%
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
</body>
</html>