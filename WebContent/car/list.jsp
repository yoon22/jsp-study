<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>차 목록</title>

</head>
<%
	String carName = request.getParameter("ci_name");
	if (carName != null) {
%>
검색한 차 이름 : <%=carName%><br>
<%
	}
%>
<form>
	<input type="text" name="ci_name"> <br>
	<button>검색</button>
</form>
<body>
	<%
		String sql = "select * from car_info";
		sql += " where 1=1";
		if (carName != null && !"".equals(carName)) {
			sql += " and ci_name like ?";
		}
		try {
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			int cnt = 1;
			if(carName != null && !"".equals(carName)){
				ps.setString(cnt++,"%"+carName+"%");
			}
			ResultSet rs = ps.executeQuery();
			out.write("<table border=\"3\">");
				out.write("<tr>");
				out.write("<th>번호</th>");
				out.write("<th>모델</th>");
				out.write("<th>년식</th>");
				out.write("<th>제조회사</th>");
				out.write("<th>기타정보</th>");
				out.write("</tr>");
			while (rs.next()) {
				out.write("<tr>");
				out.write("<td>" + rs.getInt("ci_num") + "</td>");
				out.write("<td>");
				out.write("<a href=\"/jsp-study/car/view.jsp?ci_num=" + rs.getInt("ci_num") + "\">");
				out.write(rs.getString("ci_name") + "</a></td>");
				out.write("<td>" + rs.getString("ci_year") + "</td>");
				out.write("<td>" + rs.getString("ci_vendor") + "</td>");
				out.write("<td>" + rs.getString("ci_etc") + "</td>");
				out.write("<td><button onclick=\"carDelete("+rs.getInt("ci_num")+")\">삭제</button></td>");
				out.write("</tr>");
			}
			out.write("</table>");
		}catch (Exception e) {
			out.println(e);
		}finally {
			DBCon.close();
		}
		
	%>
	
	<button onclick="goInsertPage()" >차 등록</button>
	
	
	<script>
	function goInsertPage(){
		location.href="/jsp-study/car/insert.jsp";
	}
	function carDelete(carNum){
		var isDelete = confirm("진짜 삭제할거??");
		if(isDelete) {
			location.href="/jsp-study/car/delete_ok.jsp?carNum="+carNum;
		}
	}
	</script>
</body>
</html>




