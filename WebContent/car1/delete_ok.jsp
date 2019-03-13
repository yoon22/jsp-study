<%@page import="java.sql.ResultSet"%>
<%@page import="test.jsp.study.db.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%    
request.setCharacterEncoding("utf-8");
String[] ciNums = request.getParameterValues("ci_num");
//여러 ci_num 선택 후 삭제하고 싶을때 맨 처음 값만 입력되므로 배열을 만들어서 값들을 받아줌.

String sql = "delete from car_info where 1=1";
	   sql += " and ci_num in(";
	   for(int i=0;i<ciNums.length;i++){
		   sql +="?,";
	   }
	   sql = sql.substring(0,sql.length()-1);
	   //substring은 (0,1)이라면 0번째자리부터 1번째 자리까지 출력
	   sql +=")";
	 
	   
PreparedStatement ps = DBCon.getCon().prepareStatement(sql);
for(int i=0;i<ciNums.length;i++){
	ps.setString(i+1,ciNums[i]);
}
int cnt = ps.executeUpdate();
String result = "삭제실패";
if(cnt==ciNums.length){
	result = "삭제성공";
}
%>
<script>
alert("<%=result%>");
location.href = "/jsp-study/car1/list.jsp";
</script>

