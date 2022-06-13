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

    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">


$(document).ready( function() {

$("#header").load("./header.jsp"); 
$("#headerlogin").load("./headerlogin.jsp"); 
$("#footer").load("./footer.jsp");  

});
</script>

    <title>easystudio</title>
    <script type= "text/javascript">
    function validateForm (form){
    	if (form.placeTitle.value=="" || form.name.value.length==0 ) {
    		alert ("제목을 입력하세요");
    		form.placeTitle.focus();
    		return false;    		
    	}
    	if(form.placeRule.value =="" || form.content.value.length==0)	{
    		alert ("이용 규칙을 입력하세요");
    		form.placeRule.focus();
    		return false;
    	}
    	if(form.address.value =="" || form.pass.value.length==0)	{
    		alert ("주소를 입력하세요");
    		form.address.focus();
    		return false;
    	}
    	if(form.detailAddress.value =="" || form.pass.value.length==0)	{
    		alert ("상세주소를 입력하세요");
    		form.detailAddress.focus();
    		return false;
    	}
    	if(form.price.value =="" || form.pass.value.length==0)	{
    		alert ("가격을 입력하세요");
    		form.price.focus();
    		return false;
    	}
    	
    }
 
 
 </script>
</head>
<%
	String id = "";
	
		id = (String)session.getAttribute("userID");
	
	
%>
<body>


<% if(id == null || id.equals("")){%>
    
    <div id="header"></div>
<%}else{%>
 <div id="headerlogin"></div>
 <%} %>
    
    <br>
    <p style="text-align: center; font-size: 24px;">리뷰 등록하기</p>
    <br><br>

    <div style="width: 100%; height: 1000px; text-align: center;">
    
    	<form action ="writereview.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this);">
    		
			<input type="hidden" name="reviewUserID" id="reviewUserID" value="<%=id%>">
			<br>
			<input type="hidden" name="reviewPlaceID" id="reviewPlaceID" value="<%=id%>">
			<br>
			<label for="placeRule">리뷰작성</label>
			<br>
			<textarea name="reviewText" id="reviewText" cols="200" rows="7" style="padding:20px"></textarea>
			<br>
			
		
		
       
        <button type ="submit" style="">등록하기</button>
        </form>
        
        
    </div>



    <div id="footer"></div>
</body>
</html>