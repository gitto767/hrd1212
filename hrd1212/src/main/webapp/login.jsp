<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="dbconn.jsp" %>
<%
    String id=request.getParameter("id");
    String passwd=request.getParameter("password");
    
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    try{
    	String sql="select password,name from member1212 where id=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, id);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String userPWD=rs.getString("password");
    		String userNAME=rs.getString("name");
    		if(passwd.equals(userPWD)){%>
    		   <%=userNAME %>님 환영합니다.

    			<%
    			session.setAttribute("s_Name", userNAME);
    		    session.setAttribute("s_Id", id);
    		    response.sendRedirect("index.jsp");
    		   
    		}else{
    			%>
    			<script>
    			  alert("비밀번호가 일치하지 않습니다.");
    			  history.back(-1);
    			</script>
    			<%
    		}
    	}else{
    		%>
    		<script>
    		  alert("등록되지 않은 id입니다.");
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