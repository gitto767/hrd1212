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
<h3>게시판</h3>
<%@ include file="dbconn.jsp" %>
<%
  chkName=(String)session.getAttribute("s_Name");
  if(chkName==null){
	  %>
	  <script>
	    alert("로그인을 해주세요");
	    history.back(-1);
	  </script>
<%
  }else{
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  int total=0;
	  try{
		  String sql="select count(*) from board1212";
		  pstmt=conn.prepareStatement(sql);
		  rs=pstmt.executeQuery();
		  if(rs.next()){
			  total=rs.getInt(1);
		  }
	  }catch(Exception e){
		  e.printStackTrace();
	  }
	    
%>  
    <p id="t1">총 게시물:<%=total %>개</p>
   
    
  <table class="select_table">
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
      <th>조회수</th>
    </tr>
    <%
    if(total==0){
    	%>
    <tr>
      <td colspan=5>게시물이 없습니다.</td>
    </tr>
    <%
    }else{
    	String sql= "select * from board1212 order by ref desc,step asc";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()){
    		int idx=rs.getInt("num");
    		String name=rs.getString("name");
    		String title=rs.getString("title");
    		String time=rs.getString("time");
    		int hit=rs.getInt("hit");
    		int indent=rs.getInt("indent");
    		%>
    <tr>
      <td><%=idx %></td>
     
      <td class="tdimg"> 
      <%for(int j=0;j<indent;j++){
    	  %>&nbsp;&nbsp;&nbsp;
    	  <%}
      if(indent !=0){
    	  %>
    	  <img src="image/reply_icon.gif">
    	  <%
      }
      %><a href="view.jsp?idx=<%=idx%>"><%=title %></a></td>
      <td><%=name %></td>
      <td><%=time %></td>
      <td><%=hit %></td>
    </tr>
    <%
    }
   }
    
    %>
    <tr><td colspan=5><input value="글쓰기"  type="button" onclick="location.href='board_insert.jsp'"></tr>
    </table>
 <%
    }
  %>
    
    
</section>

<%@ include file="footer.jsp" %>
</body>
</html>