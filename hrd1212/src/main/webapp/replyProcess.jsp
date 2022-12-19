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
    String name=request.getParameter("name");
    String password=request.getParameter("password");
    String title=request.getParameter("title");
    String memo=request.getParameter("memo");
    int ref=0,indent=0,step=0;
    int no=0;
    try{
    	String sql="select max(num) from board1212";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		no=rs.getInt(1)+1;
    	}else{
    		no=1;
    	}
    	sql="select num,ref,indent,step from board1212 where num=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setInt(1, idx);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		indent=rs.getInt(3);
    		step=rs.getInt(4);
    		if(indent>0){
    			ref=rs.getInt(2);
    		}else{
    			ref=rs.getInt(1);
    		}
    		
    	}
    	
    	sql="update board1212 set step=step+1 where ref=? and step>?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setInt(1, ref);
    	pstmt.setInt(2, step);
    	pstmt.executeUpdate();
    	
    	sql="insert into board1212 values(?,?,?,?,?,sysdate,?,?,?,?)";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setInt(1, no);
    	pstmt.setString(2, name);
    	pstmt.setString(3, password);
    	pstmt.setString(4, title);
    	pstmt.setString(5, memo);
    	pstmt.setInt(6, 0);
    	pstmt.setInt(7, ref);
    	pstmt.setInt(8, indent+1);
    	pstmt.setInt(9, step+1);
    	pstmt.executeUpdate();
    	%>
    	   <script>
    	      alert("저장 완료");
    	      location.href="board_select.jsp"
    	   </script>
    	<%
    
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
</body>
</html>