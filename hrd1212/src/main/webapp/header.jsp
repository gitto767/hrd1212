<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
<%
    String chkName="";
    chkName=(String)session.getAttribute("s_Name");
    if(chkName==null){
    	
%>
<div class="left">
<h1>쇼핑몰에 오신 것을 환영합니다.</h1>
</div>
<div class="right">
<form method="post" action="login.jsp">
<label for="id">ID :</label>
<input type="text" name="id">
<label for="password">PW :</label>
<input type="password" name="password">
<input type="submit" value="로그인" >
<a href="member_insert">회원가입</a>
</form>
</div>
<%}else{session.setMaxInactiveInterval(1800); %>
<div class="left">
<h1>쇼핑몰에 오신 것을 환영합니다.</h1>
</div>
<div class="right">
<%=chkName %>님 환영합니다.
<a href="logout.jsp">로그아웃</a>
<a href="member_insert">회원가입</a>
</div>
<% 

} 

%>
</header>
</body>
</html>