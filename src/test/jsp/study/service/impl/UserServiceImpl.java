package test.jsp.study.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import test.jsp.study.dao.UserDAO;
import test.jsp.study.dao.impl.UserDAOImpl;
import test.jsp.study.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDAO udao = new UserDAOImpl();
	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> user) {
		
		return udao.selectUserList(user);
	}

	@Override
	public Map<String, String> selectUser(Map<String, String> user) {
		
		return udao.selectUser(user);
	}

	@Override
	public int insertUser(Map<String, String> user) {
		
		return udao.insertUser(user);
	}

	@Override
	public int updateUser(Map<String, String> user) {
		
		return udao.updateUser(user);
	}

	@Override
	public int deleteUser(Map<String, String> user) {
		
		return udao.deleteUser(user);
	}
	

	@Override
	public Map<String, String> login(String uiId) {
		
		return udao.selectUserById(uiId);
	}

}
