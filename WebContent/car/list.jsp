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
			out.write("<table border=\"1\">");
			while (rs.next()) {
				out.write("<tr>");
				out.write("<td>" + rs.getInt("ci_num") + "</td>");
				out.write("<td>" + rs.getString("ci_name") + "</td>");
				out.write("<td>" + rs.getString("ci_year") + "</td>");
				out.write("<td>" + rs.getString("ci_vendor") + "</td>");
				out.write("<td>" + rs.getString("ci_etc") + "</td>");
				out.write("</tr>");
			}
			out.write("</table>");
		}catch (Exception e) {
			out.println(e);
		}finally {
			DBCon.close();
		}
		
	%>

</body>
</html>




select * from food order by food_num;

select * from food where food_name like  '%치킨%';

update food set food_name='뿌링클치킨' where food_name='뿌링클';

delete from food where food_num=12;

commit;

create table car_info(
ci_num number(10,0) not null primary key,
ci_name VARCHAR2(100) not null,
ci_year char(4) not null,
ci_vendor varchar2(100) not null,
ci_etc varchar2(4000)
);

select * from car_info;

create sequence seq_ci_num;

insert into car_info(ci_num,ci_name,ci_year,ci_vendor)
values(seq_ci_num.nextval,'쏘나타','2019','현대자동차');

insert into car_info(ci_num,ci_name,ci_year,ci_vendor)
values(seq_ci_num.nextval,'G70','2019','제네시스');

commit;