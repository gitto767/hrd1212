<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  function check(){
	  if(document.form.title.value==""){
		  alert("제목을 입력하세요");
		  document.form.title.focus();
		  return;
      }
	  if(document.form.name.value==""){
		  alert("이름을 입력하세요");
		  document.form.name.focus();
		  return;
	  }
	  if(document.form.password.value==""){
		  alert("비밀번호을 입력하세요");
		  document.form.password.focus();
		  return;
	  }	  
	  if(document.form.memo.value==""){
		  alert("내욜을 입력하세요");
		  document.form.memo.focus();
		  return;
	  }
	  document.form.submit();
  }
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %> 
<%
    chkName=(String)session.getAttribute("s_Name");
    if(chkName==null){
    	%>
    	<script>
    	  alert("로그인 해주세요.");
    	  history.back(-1);
    	</script>
        <%
    }
%>
<section>
<%@ include file="dbconn.jsp" %>
<%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    int idx=Integer.parseInt(request.getParameter("idx"));
    try{
    	String sql="select name,password,title,memo from board1212 where num=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setInt(1, idx);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String name=rs.getString(1);
    		String password=rs.getString(2);
    		String title=rs.getString(3);
    		String memo=rs.getString(4);
   %>


    <form name="form" method="post" action="modifyProcess.jsp?idx=<%=idx%>">
      <h3>글쓰기</h3>
      <table class="insert_table">
        <tr>
          <td>제목</td>
          <td><input type="text" name="title" size=50 value="<%=title %>"></td>
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="name" size=50 value="<%=name %>"></td>
        </tr>
        <tr>
          <td>비밀번호</td>
          <td><input type="password" name="password" size=50></td>
        </tr>
        <tr>
          <td>내용</td>
          <td><textarea name="memo" cols=50 rows=13><%=memo %></textarea></td>
        </tr>
        <tr>
          <td colspan=2 class="last"><input type="button" value="등록" onclick="check()"><input type="reset" value="취소"></td>
        </tr>
      </table>
         <%
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
    </form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>