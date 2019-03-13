<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//값이 깨지지 않게 utf-8로 인코딩 해줌. 
String ciName = request.getParameter("ci_name");
String ciYear = request.getParameter("ci_year");
String ciVendor = request.getParameter("ci_vendor");
String ciEtc = request.getParameter("ci_etc");
//insert에서 필요한 값을 요청해서 받아옴!
String sql = "insert into car_info(ci_num,ci_name,ci_year,ci_vendor,ci_etc)";
	   sql += " values((select nvl(max(ci_num),0)+1 from car_info),?,?,?,?)";
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,ciName);
ps.setString(2,ciYear);
ps.setString(3,ciVendor);
ps.setString(4,ciEtc);
ResultSet rs = ps.executeQuery();
int cnt = ps.executeUpdate();
String result = "차량 등록이 실패하였습니다.";

if(cnt==1) {
	result = "차량 등록이 성공하였습니다.";
}

%>
<script>
alert("<%=result%>");
location.href = "/jsp-study/car1/list.jsp";
</script>