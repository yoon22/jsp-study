<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post"action="/jsp-study/req/user_info_ok.jsp">
		<table border="1" >
		
		
			<tr>
				<th>ID</th>
				<td><input type="text" name="ui_id"></td>
			</tr>
			<tr>
				<th>NAME</th>
				<td><input type="text" name="ui_name"></td>
				
			</tr>
			<tr>
				<th>AGE</th>
				<td><input type="number" name="ui_age"></td>
				
			</tr>
			<tr>
				<th>ETC</th>
				<td><textarea name="ui_etc"></textarea></td>
			</tr>
			<tr>
			<td>
			<button>가입</button>
			</td>
			</tr>
		</table>
		
		



	</form>

</body>
</html>