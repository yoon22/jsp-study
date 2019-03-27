<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/jsp-study/user">
ID : <input type="text"name="id"><br>
PWD : <input type="text"name="pwd"><br>
<input type="hidden" name="cmd" value="login">
<button>로그인</button>
</form>
</body>
</html>