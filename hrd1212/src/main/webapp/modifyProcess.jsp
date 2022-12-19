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
    int idx=Integer.parseInt(request.getParameter("idx"));
    String title=request.getParameter("title");
    String memo=request.getParameter("memo");
    String name=request.getParameter("name");
    String passw=request.getParameter("password");
    String password="";
    try{
    	String sql="select password from board1212 where num=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setInt(1, idx);
    	rs=pstmt.executeQuery();
    	if (rs.next()){
    		password=rs.getString(1);
    	}
    	if(passw.equals(password)){
    		sql="update board1212 set title=?,memo=? where num=?";
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1, title);
    		pstmt.setString(2, memo);
    		pstmt.setInt(3, idx);
    		pstmt.executeUpdate();
    		%>
    		  <script>
    		     alert("수정 완료");
    		     location.href="view.jsp?idx=<%=idx %>";
    		  </script>
    	<%
    	}else{
    		%>
    		<script>
    		  alert("비밀번호가 일치하지않습니다.");
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