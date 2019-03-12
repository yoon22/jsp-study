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
차 이름 : <input type="text" name = "carName"><br> 
차 년도 : <input type="text" name = "carYear"><br>
차 회사 : <input type="text" name = "carVendor"><br>
내용 : <input type="text" name = "carEtc"><br>
<button>차 등록</button>
</form>
</body>
</html>
<%
}else{
	String sql = "insert into car_info(ci_num,ci_name,ci_year,ci_vendor,ci_etc)";
			sql += " values(seq_ci_num.nextval,?,?,?,?)";
			
			PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
			ps.setString(1,foodName);
			ps.setString(2,carName);
			ps.setString(2,carYear);
			ps.setString(2,carVendor);
			ps.setString(2,carEtc);
	
}

%>