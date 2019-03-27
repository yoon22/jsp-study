<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=request.getAttribute("종인")%>
<%=pageContext.getAttribute("난")%>
<%=session.getAttribute("backend")%>
<%=application.getAttribute("왜웃어!!!") %>
<%
response.sendRedirect("/jsp-study/req/req3.jsp");
%>
