<%@ page contentType = "text/html; charset=utf-8"%>
<html>
<head>
<title>POST 방식 요청</title>
</head>
<body>
	<!-- JSP 문법 작성 -->
	<%  // 요청 파라미터의 캐릭터 인코딩을 UTF-8로 지정합니다. 이것은 한글을 올바르게 처리하기 위함입니다.
		request.setCharacterEncoding("utf-8");
	%>
	<%
	String name=request.getParameter("email");
	String password=request.getParameter("password");
	out.println("email :" + email + "<br/>");
	out.println("password :" + password + "<hr/>");
	%>
</body>
</html>