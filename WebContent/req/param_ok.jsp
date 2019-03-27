
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Map<String,String[]> map = request.getParameterMap();

String[] id = map.get("id");
out.write("id : " + id[0]);
out.write("<br>");
String[] name = map.get("name");
out.write("name : " +name[0]);
out.write("<br>");
String[] credats = map.get("credat");
out.write("credat : " + credats[0]);
out.write("<br>");
String[] trans =map.get("trans");
out.write("trans : " +trans[0]);
out.write("<br>");
String[] content =map.get("content");
out.write("content : " +content[0].replace("\r","<br>"));
%>
</body>
</html>