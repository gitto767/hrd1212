<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="dbconn.jsp" %>
<%
    chkName=(String)session.getAttribute("s_Name");
    if(chkName==""){
    	%>
    	<script>
    	  alert("로그인이 필요합니다.");
    	  history.back(-1);
    	</script>
    	<%
    }
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    String idx=request.getParameter("idx");
    try{
    	String sql="select * from board1212 where num=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, idx);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String name=rs.getString(2);
    		String title=rs.getString(4);
    		String memo=rs.getString(5);
    		String time=rs.getString(6);
    		int hit=rs.getInt(7);
    		hit++;
    %>
    <h3>내용</h3>
    <table class="select_table">
      <tr>
        <th>글번호</th>
        <td><%=idx %></td>
      </tr>
      <tr>
        <th>조회수</th>
        <td><%=hit %></td>
      </tr>
      <tr>
        <th>이름</th>
        <td><%=name %></td>
      </tr>
      <tr>
        <th>작성일</th>
        <td><%=time %></td>
      </tr>
      <tr>
        <th>제목</th>
        <td><%=title %></td>
      </tr> 
      <tr>
        <td colspan=2><%=memo %></td>
      </tr>
      <%
         try{
         sql="update board1212 set hit=? where num=?";
         pstmt=conn.prepareStatement(sql);
         pstmt.setInt(1, hit);
         pstmt.setString(2, idx);
         pstmt.executeUpdate();
         }catch(Exception e){
        	 e.printStackTrace();
         }
      %>
      <tr>
        <td colspan=2 class="last"><input type=button value="글쓰기" onclick="window.location='board_insert.jsp'">
        <input type=button value="답글" onclick="window.location='reply.jsp?idx=<%=idx%>'">
        <input type=button value="목록" onclick="window.location='board_select.jsp'">
        <input type=button value="수정" onclick="window.location='modify.jsp?idx=<%=idx%>'">
        <input type=button value="삭제" onclick="window.location='delete.jsp?idx=<%=idx%>'">       
        
        </td>
      </tr>
      <%	}
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
    </table>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>