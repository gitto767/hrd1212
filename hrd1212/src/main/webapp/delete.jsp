<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.password.value==""){
		alert("비밀번호를 입력하세요.");
		document.form.password.focus();
		return;
	}
	document.form.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %> 

<section>
<h3>삭제</h3>
<%
    int idx=Integer.parseInt(request.getParameter("idx"));
%>
<form name="form" method="post" action="deleteProcess.jsp?idx=<%=idx %>">
  <table class="insert_table">
    <tr>
      <th>비밀번호</th>
      <td><input type="password" name=password></td>
    </tr>
    <tr>
      <td colspan=2 class="last"><input type="button" value="삭제" onclick="check()">
      <input type="reset" value="취소">
    </tr>
  </table>
  

</form>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>