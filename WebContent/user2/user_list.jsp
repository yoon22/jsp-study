<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="/jsp-study/user?cmd=users">유저 리스트 보기</a><br>
<a href="/jsp-study/user?cmd=user&ui_num=43">43번 데이터 보기</a>
<form method="post"action="/jsp-study/user"><br>
이름 : <input type="text"name="ui_name"><br>
아듸 : <input type="text"name="ui_id"><br>
나이 : <input type="text"name="ui_age"><br>
비고 : <input type="text"name="ui_etc"><br>
<input type="hidden"name="cmd"value="insert">
<button>유저등록</button>
</form>

<form method="post"action="/jsp-study/user"><br>
번호 : <input type="text"name="ui_num"><br>
이름 : <input type="text"name="ui_name"><br>
아듸 : <input type="text"name="ui_id"><br>
나이 : <input type="text"name="ui_age"><br>
비고 : <input type="text"name="ui_etc"><br>
<input type="hidden"name="cmd"value="update">
<button>유저수정</button>
</form>

<form method="post"action="/jsp-study/user"><br>
번호 : <input type="text"name="ui_num"><br>
<input type="hidden"name="cmd"value="delete">
<button>유저삭제</button>
</form>


</body>
</html>