<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String uiNum = request.getParameter("ui_num");

String sql = "select ui_num,ui_id,ui_name,ui_etc,ui_age from user_info";
	sql += " where ui_num = ?";
	
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	ps.setString(1,uiNum);
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
		%>
		
		<form method="post" action="/jsp-study/req/user_update_ok.jsp">
		
		번호 : <%=rs.getString("ui_num") %><br>		
		아이디 : <input type="text"name="ui_id"value="<%=rs.getString("ui_id")%>"><br>	
		이름 : <input type="text"name="ui_name"value="<%=rs.getString("ui_name")%>"><br>
		나이 : <input type="text"name="ui_age"value="<%=rs.getString("ui_age")%>"><br>
		비고 : <textarea name="ui_etc"><%=rs.getString("ui_etc")%></textarea><br>
		<button>유저수정</button>
		<input type="hidden"name="ui_num"value="<%=rs.getString("ui_num")%>">
		</form>
		
		<%				
	}else{
		out.write("원하시는 데이터가 존재하지 않습니다.");
	}	
%>

</body>
</html>