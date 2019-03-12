<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String carNum = request.getParameter("ci_num");
String carName = request.getParameter("ci_name");
String carYear = request.getParameter("ci_year");
String carVendor = request.getParameter("ci_vendor");
String carEtc = request.getParameter("ci_etc");
String sql = "update car_info set ci_name=? ,ci_year=?,ci_vendor=?,ci_etc=? ";
		sql += " where ci_num=?"; 

PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
ps.setString(1,carName);
ps.setString(2,carYear);
ps.setString(3,carVendor);
ps.setString(4,carEtc);
ps.setString(5,carNum);
int cnt = ps.executeUpdate();
String result = "수정이 실패하였습니다.";
if(cnt==1) {
	result = " 수정이 성공하였습니다." ;
}
%>
<script>
alert("<%=result%>");
location.href="/jsp-study/car/view.jsp?carNum=<%=carNum%>";
</script>