<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("종인","commit");
pageContext.setAttribute("난","누구??"); 
//여기 페이지 벗어나면 못씀....
session.setAttribute("backend","뒤끝");
application.setAttribute("왜웃어?","같이웃쟝");
RequestDispatcher rd = request.getRequestDispatcher("/req/req2.jsp");
rd.forward(request,response);
//response.sendRedirect("/jsp-study/req/req2.jsp");
%>