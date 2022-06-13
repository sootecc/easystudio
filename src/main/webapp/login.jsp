<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="css/login.css" type="text/css" rel="stylesheet">
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="javascript/login.js"></script>
    <script src = "login.js"></script>
<script type="text/javascript">

$(document).ready( function() {

$("#header").load("./header.jsp"); 
$("#headerlogin").load("./headerlogin.jsp"); 
$("#footer").load("./footer.jsp");  

});
</script>
</head>

<%
	String id = "";
	try{
		id = (String)session.getAttribute("userID");
	
	
%>

<body>
    
    

<% if(id == null || id.equals("")){%>
	<div id="header"></div>
<script>     
		function validateForm (form){
			if (!form.userID.value){
				alert ("아이디를 입력해 주세요");
				return false; 
			}
			if (form.userPassword.value ==""){
				alert ("패스워드를 입력해 주세요"); 
				return false; 
			}	
		}	
</script>




    <div class="wrapper fadeInDown">
        <div id="formContent">
            <!-- Tabs Titles -->
            <h2 class="active"> 로그인 </h2>
            <a href = "register.jsp"><h2 class="inactive underlineHover">회원가입 </h2></a>
    
            <!-- Icon -->
            <div class="fadeIn first">
                <img src="images/login.svg" id="icon" alt="User Icon"  style="height:40px; width:50px;"/>
            </div>
    
            <!-- Login Form -->
            <form action="loginPro.jsp" method = "post" name = "login" onsubmit="return validateForm(this);">
                    <input type="text" id="userID" class="fadeIn second" name="userID" placeholder="Enter email">
                    <input type="password" id="userPassword" class="fadeIn third" name="userPassword" placeholder="Enter password">
                    <input type="submit" value="로그인">
 			</form>
           
             <!-- Remind Password -->
            <div id="formFooter">
                <a class="underlineHover" href="#">Forgot Password?</a>
            </div>
    
        </div>
    </div>
<%}else{%>
	<div id="headerlogin.jsp"></div>
	<!--로그인 상태일때 HTML 처리 부분   -->
	<%= session.getAttribute("userID") %>  회원님, 로그인 하셨습니다. <br> 
	<a href ="logout.jsp"> [로그아웃]</a>

<% 
	}
}catch(Exception e){e.printStackTrace();}
%>
           


    <div id="footer"></div>
</body>
</html>