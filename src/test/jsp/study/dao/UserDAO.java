package test.jsp.study.dao;

import java.util.List;
import java.util.Map;

public interface UserDAO {
	public List<Map<String,String>> selectUserList(Map<String,String> user);//전체조회
	public Map<String,String> selectUser(Map<String,String> user); //단일조회
	public int insertUser(Map<String,String> user); //추가
	public int updateUser(Map<String,String> user); //수정
	public int deleteUser(Map<String,String> user); //삭제
	public Map <String,String> selectUserById(String uiId);
}
