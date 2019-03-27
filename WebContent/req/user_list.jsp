<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
이름 : <input type="text"name="ui_name">
<button>검색</button>
</form>
<%
String uiName = request.getParameter("ui_name");
String sql = "select * from user_info";
if(uiName!=null){
	sql +=" where ui_name like ?";
}
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
if(uiName!=null){
	ps.setString(1,"%" + uiName + "%");
}
ResultSet rs = ps.executeQuery();
out.write("<table border=\"1\">");
while(rs.next()){
	
	out.write("<tr>");
	out.write("<td>");
	out.write(rs.getString("ui_num"));	
	out.write("</td>");
	out.write("<td>");
	out.write(rs.getString("ui_id"));
	out.write("</td>");
	out.write("<td>");
	out.write("<a href=\"/jsp-study/req/user_view.jsp?ui_num=" );
	out.write(rs.getString("ui_num")+"\">"+rs.getString("ui_name")+"</a>");
	out.write("</td>");
	out.write("<td>");
	out.write(rs.getString("ui_age"));
	out.write("</td>");
	out.write("<td>");
	out.write(rs.getString("ui_etc")+"<br>");
	out.write("</td>");
	out.write("<td>");
	out.write("<button onclick=\"deleteUser("+rs.getString("ui_num")+")\">삭제</button>");
	out.write("</td>");
	out.write("</tr>");

	
}
out.write("</table>");
%>
<script>
	function deleteUser(uiNum){
		document.getElementById("ui_num").value=uiNum;
		document.getElementById("deleteForm").submit();
		
	}
</script>
<form method="post"id="deleteForm"action="/jsp-study/req/user_delete_ok.jsp">

<input type="hidden"name="ui_num"id="ui_num">
</form>
<form method="post"action="/jsp-study/req/user_info.jsp">
<button>가입하기</button>
</form>
</body>
</html>
