<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    String carName = request.getParameter("ci_name");
    String carYear = request.getParameter("ci_year");
    String carVendor = request.getParameter("ci_vendor");
    String carEtc = request.getParameter("ci_etc");
    if(carName==null){   	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차 등록</title>
</head>
<body>
<form method = "post">
차 이름 : <input type="text" name = "ci_name"><br> 
차 년도 : <input type="text" name = "ci_year"><br>
차 회사 : <input type="text" name = "ci_vendor"><br>
내용 : <input type="text" name = "ci_etc"><br>
<button>차 등록</button>
</form>
</body>
</html>
<%
}else{
	String sql = "insert into car_info(ci_num,ci_name,ci_year,ci_vendor,ci_etc)";
			sql += " values((select nvl(max(ci_num),0)+1 from car_info),?,?,?,?)";
			
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			
			ps.setString(1,carName);
			ps.setString(2,carYear);
			ps.setString(3,carVendor);
			ps.setString(4,carEtc);
			
			int cnt = ps.executeUpdate();			
			if(cnt==1){
				out.println("차 등록 성공!");
				
			}else if(cnt==0){
				out.println("차 등록 실패!");
			}
			out.println("<a href=\"/jsp-study/car/list.jsp\">차 리스트</a>");
			
		}
%>