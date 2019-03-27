package test.jsp.study.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.jsp.study.service.UserService;
import test.jsp.study.service.impl.UserServiceImpl;


public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService us = new UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		//printwriter 하기 전에 미리 인코딩 해주어야함..
		response.setContentType("text/html;charset=usf-8");
		PrintWriter pw = response.getWriter();
		//요청하는 화면에 찍어주어야 하니까!!!!!!!!!! 
		String cmd = request.getParameter("cmd");
		if(cmd==null) {
			pw.print("커맨드 없는 요청은 정상적인 요청이 아닙니다.");
		}else {
			if("users".equals(cmd)) {
				List<Map<String,String>> userList = us.selectUserList(null);
				RequestDispatcher rd = request.getRequestDispatcher("/tag/lib01.jsp");
				request.setAttribute("userList",userList);
				rd.forward(request,response);
				return;
			}else if("user".equals(cmd)) {
				String uiNum = request.getParameter("ui_num");
				if(uiNum==null||"".equals(uiNum)) {
					pw.print("누구를 조회하라고? ? ? ");
					//throw new ServletException("ㅇㅇ?????");
				}else {
					Map<String,String> user = new HashMap<>();
					user.put("ui_num", uiNum);
					pw.print(us.selectUser(user));
				}
				//ui_num 이 꼭 있어야함~~! 
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd");
		
		if(cmd==null) {
			pw.print("커맨드 없는 요청은 정상적인 요청이 아닙니다.");
		}else {
			if("insert".equals(cmd)) {
				String uiName=request.getParameter("ui_name");
				String uiId=request.getParameter("ui_id");
				String uiAge=request.getParameter("ui_age");
				String uiEtc=request.getParameter("ui_etc");
				Map<String,String> user = new HashMap<>();
				user.put("ui_name", uiName);
				user.put("ui_id", uiId);
				user.put("ui_age", uiAge);
				user.put("ui_etc", uiEtc);
				int cnt = us.insertUser(user);
				String result = "등록실패";
				if(cnt==1) {
					result ="등록성공";
				}
				pw.println(result);
				
			}else if("update".equals(cmd)) {
				String uiNum=request.getParameter("ui_num");
				String uiName=request.getParameter("ui_name");
				String uiId=request.getParameter("ui_id");
				String uiAge=request.getParameter("ui_age");
				String uiEtc=request.getParameter("ui_etc");
				Map<String,String> user = new HashMap<>();
				user.put("ui_num", uiNum);
				user.put("ui_name", uiName);
				user.put("ui_id", uiId);
				user.put("ui_age", uiAge);
				user.put("ui_etc", uiEtc);
				int cnt = us.updateUser(user);
				String result = "수정 실패";
				if(cnt==1) {
					
					result = "수정 성공";
				}
				pw.println(result);
						
			}else if("delete".equals(cmd)) {
				String uiNum=request.getParameter("ui_num");
				Map<String,String> user = new HashMap<>();
				user.put("ui_num", uiNum);
				int cnt = us.deleteUser(user);
				String result = "삭제 실패";
				if(cnt==1) {
					result = "삭제 성공";
				}
				pw.println(result);
				
			}else if("login".equals(cmd)) {
				String uiId = request.getParameter("id");
				String uiPwd = request.getParameter("pwd");
				//login.jsp 에서 불러올 네임들이 "id","pwd" 니까! 
				Map<String,String> user = us.login(uiId);
				if(user!=null) {
					String pwd = user.get("ui_pwd");
					if(uiPwd.equals(pwd)) {
						HttpSession session = request.getSession();
						session.setAttribute("user", user);
						//setAttribute 데이터타입 =  오브젝트
						//Map은 오브젝트니까 안에 넣는것 가능.....
						 
						response.sendRedirect("/jsp-study/login/welcome.jsp");
						//페이지를 이동하는거지만 밑에 실행문은 계속 실행해줌...
						return;
					}else {
						
					}
				}
				pw.print("<script>");
				pw.print("alert('아디,비번 확인해주쇼');");
				pw.print("location.href='/jsp-study/login/login.jsp';");
				pw.print("</script>");
			}
		}
	}
}
