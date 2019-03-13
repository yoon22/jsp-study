<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String carNum = request.getParameter("ci_num");
	String sql = "select ci_num,ci_name,ci_year,ci_vendor,ci_etc from car_info where ci_num=?";	
	PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
	ps.setString(1,carNum);
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/jsp-study/car/update_ok.jsp">
		번호 : <input type = "number" name= "ci_num" value = "<%=carNum%>" readonly="readonly"><br> 
		차이름 : <input type="text" name="ci_name" value="<%=rs.getString("ci_name")%>"><br>
		차년도 : <input type="text" name="ci_year" value="<%=rs.getString("ci_year")%>"><br>
		차회사 : <input type="text" name="ci_vendor" value="<%=rs.getString("ci_vendor")%>"><br>
		기타정보 : <input type="text" name="ci_etc" value="<%=rs.getString("ci_etc")%>"><br>
		
		<button onclick="goList()" >수정</button>
	</form>
<script>
	function goList(){
		location.href="/jsp-study/car/list.jsp";
	} 

</script>	
</body>
</html>
<%
	}else{
		out.write("</b> 조회하신 번호"+carNum +"는 존재하지  않습니다</b>");
		out.write("<a href=\"/jsp-study/car/list.jsp\">메뉴리스트</a>");
	}
%>
