<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차 목록</title>
</head>
<body>
<form method="post"action="/jsp-study/car1/delete_ok.jsp">
	<table border="1">
		<tr>
			<th>선택</th>
			<th>번호</th>
			<th>모델</th>
			<th>년식</th>
			<th>제조회사</th>
			<th>기타정보</th>
		</tr>
		<%
		String sql = "select * from car_info";
		PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
		%>
		<tr>
		<td><input type="checkbox"name="ci_num" value="<%=rs.getString("ci_num") %>"></td> 
		<!-- 체크박스가 의미하는 번호가 몇번인지 모르니깐 value~~~ 뒤에 써줌.  -->
		<td><%=rs.getString("ci_num")%></td>
		<td><%=rs.getString("ci_name")%></td>
		<td><%=rs.getString("ci_year")%></td>
		<td><%=rs.getString("ci_vendor")%></td>
		<td><%=rs.getString("ci_etc")%></td>
		</tr>
		
		
		
		<%	
		}
		%>
	</table>
	<button type="button"onclick="goInsertPage()">차량등록</button>
	<!-- 폼태그 안에 있을때는 type button으로 설정해줘야 제대로작동함. 아니면 submit 주소로 감!-->
	<button>차량 삭제</button>
	<!-- 폼태그 안에있는 버튼 타입 지정을 안해줌 : submit!!  form태그에 지정된 action주소로 감! -->
	</form>
	<script>
		function goInsertPage() {
			location.href = "/jsp-study/car1/insert.jsp";
		}
		
	</script>
</body>
</html>