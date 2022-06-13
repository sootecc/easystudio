<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.userDAO" %>

<% request.setCharacterEncoding("utf-8");%>

<%
  //사용자가 입력한 아이디와 비밀번호
  String id = request.getParameter("userID");
  String passwd  = request.getParameter("userPassword");
  
  userDAO manager = new userDAO();
  int check= manager.userCheck(id,passwd);//사용자인증처리 메소드

  if(check==1)//사용자인증에 성공시 세션속성을 설정
	session.setAttribute("userID",id);
	//여기까지 정상작동
  
%>

<jsp:forward page="index.jsp"></jsp:forward>