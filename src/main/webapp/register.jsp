<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    
    <link href="css/login.css" type="text/css" rel="stylesheet">

    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="register.js"></script>
<script type="text/javascript">

$(document).ready( function() {

$("#header").load("./header.jsp"); 
$("#footer").load("./footer.jsp");  

});
</script>
</head>


<body>
    
    <div id="header"></div>


    <div class="wrapper fadeInDown">
        <div id="formContent">
            <!-- Tabs Titles -->
            <a href = "login.jsp"><h2 class="inactive underlineHover">로그인 </h2></a>
            <h2 class="active"> 회원가입 </h2>
    
            <!-- Icon -->
            <div class="fadeIn first">
                <img src="images/login.svg" id="icon" alt="User Icon"  style="height:40px; width:50px;"/>
            </div>
    
            <!-- Login Form -->
           
                    <input type="text" id="userID" class="fadeIn second" name="login" placeholder="Enter email">
                    <input type="text" id="userPassword" class="fadeIn third" name="login" placeholder="Enter password">
                    <button id ="process">가입하기</button>
           			<button id = "cancle">취소</button>
    
            <!-- Remind Passowrd -->
            <div id="formFooter">
                <a class="underlineHover" href="#">Forgot Password?</a>
            </div>
    
        </div>
    </div>


    <div id="footer"></div>
</body>
</html>