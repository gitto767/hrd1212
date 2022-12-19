<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.id==""){
		alert("ID를 입력하세요");
		document.form.id.focus();		
	}else if(document.form.name==""){
		alert("성명을 입력하세요");
		document.form.name.focus();
	}else{
		alert("회원가입 제출");
		document.form.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %> 

<section>
  <h3>회원 가입 등록 화면</h3>
  
  <form name="form" method="post" action="member_insertProcess.jsp">
  <table class="insert_table">
      <tr>
        <th>아이디</th>
        <td><input type="text" name="id"></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name"></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="password"></td>
      </tr>
      <tr>
        <th>비밀번호 확인</th>
        <td><input type="password" name="password"></td>
      </tr>
      <tr>
        <th>성별</th>
        <td>
          <input type="radio" name="gender" value="1">남성
          <input type="radio" name="gender" value="2">여성
        </td>
      </tr> 
      <tr>
        <th>생일</th>
        <td>
          <input type="text" name="birth1">년
          <select name="birth2">
            <option value="01">2</option><option value="02">2</option><option value="03">3</option>
            <option value="04">4</option><option value="05">5</option><option value="06">6</option>
            <option value="07">7</option><option value="08">8</option><option value="09">9</option>
            <option value="10">10</option><option value="11">11</option><option value="12">12</option>
          </select>월
          <select name="birth3">
            <option value="01">2</option><option value="02">2</option><option value="03">3</option>
            <option value="04">4</option><option value="05">5</option><option value="06">6</option>
            <option value="07">7</option><option value="08">8</option><option value="09">9</option>
            <option value="10">10</option><option value="11">11</option><option value="12">12</option>
          </select>일         
        </td>
      </tr> 
      <tr>
        <th>이메일</th>
        <td><input type="text" name="email1">@<select name="email2">
        <option value="@naver.com">네이버</option>
        <option value="@gmail.com">지메일</option>
        <option value="@yahoo.com">야후</option>
        <option value="@hotmail.com">핫메일</option></select></td>
      </tr>
      <tr>
        <th>연락처</th>
        <td><input type="text" name="phone1">-<input type="text" name="phone2">-<input type="text" name="phone3"></td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" name="addresss"></td>
      </tr>
      <tr>
        <th>관심분야</th>
        <td>
          <label><input type="checkbox" name="interst" value="프로그램">프로그램</label>
          <label><input type="checkbox" name="interst" value="독서">독서</label>
          <label><input type="checkbox" name="interst" value="등산">등산</label>
          <label><input type="checkbox" name="interst" value="여행">여행</label>
          <label><input type="checkbox" name="interst" value="컴퓨터">컴퓨터</label>
          <label><input type="checkbox" name="interst" value="영화">영화</label>
          <label><input type="checkbox" name="interst" value="운동">운동</label>
          <label><input type="checkbox" name="interst" value="진학">진학</label>
        </td>
      </tr>
      <tr>
        <td colspan=2 class="last">
          <input class="buttons" type="button" value="등록" onclick="check()">
          <input class="buttons" type="reset" value="취소">
        </td>
      </tr>   
      
    
      
    </table>
  </form>

</section>

<%@ include file="footer.jsp" %>
</body>
</html>