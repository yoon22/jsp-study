<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request</title>
</head>
<body>
<%
Map<String,String[]> map = request.getParameterMap();
String[] ids = map.get("id");
String id = request.getParameter("id"); 

String[] names = map.get("name");
String name =request.getParameter("name");

String[] credats = map.get("credat");
String credat =request.getParameter("credat");

String[] transs =map.get("trans");
String trans = request.getParameter("trans");

String[] contents = map.get("content");
String content = request.getParameter("content");

//같은 키값을 가져오지만 애초부터 메서드의 데이터타입이 다름.
//그래서 각각 저장할때 데이터타입을 다르게 해서 저장해줌. 

if(ids!=null){
	out.write(ids[0]);
	out.write(id);	
	
	out.write(names[0]);
	out.write(name);
	
	out.write(credats[0]);
	out.write(credat);
	
	out.write(transs[0]);
	out.write(trans);
	
	out.write(contents[0]);
	out.write(content);
	
}




%>
<form method="get" action="/jsp-study/req/param_ok.jsp">
	<input type="text"name="id"value="yoon"><br>
	<input type="text"name="name"value="시윤"><br>
	<input type="date"name="credat"value="2019-03-14"><br>
	<select name="trans">
	<option value="m">남자</option>
	<option value="w">여자</option>
	</select><br>
	<textarea name="content" ></textarea>
	
	<button>전송</button>
</form>
</body>
</html>