<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="javascript/login.js"></script>
<script type="text/javascript">


$(document).ready( function() {

$("#header").load("./header.jsp"); 
$("#headerlogin").load("./headerlogin.jsp"); 
$("#footer").load("./footer.jsp");  

});
</script>

    <title>easystudio</title>
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
 
 
 
 
<div id="main_vue" class="h_column_center" style="min-height: 1000px;">
    <div style="width: 1160px;">
        <div style="margin-top: 20px;">
            <p
                style="font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; text-align: center; color: rgb(27, 29, 31);">
                호스트 프로필
            </p>
        </div>
    </div>
    <div class="h_row" style="margin-top: 60px; margin-bottom: 200px; width: 1000px; display: flex;">

        <div class="h_column_center" style="width: 360px;">
            <div
                style="width: 360px; border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
                <div class="h_column_center" style="margin-bottom: 40px;">
                    <div onclick=""
                        style="position: relative; margin-top: 50px; width: 120px; height: 120px; border-radius: 60px; overflow: hidden;">
                        <img src="https://s3.hourplace.co.kr/web/images/icon/elements_image_empty_host_v2.png"
                            style="width: 100%; height: 100%; position: absolute;"></div>
                    <p style="padding: 0px 20px; margin-top: 20px; font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; text-align: center; color: rgb(27, 29, 31);">
                        ${udto.userID}
                    </p>
                    
                </div>
            </div>
            <div onclick="window.location.href='/host/edit'" class="h_center h_hover_button"
                style="margin-top: 30px; width: 141px; height: 52px; border-radius: 8px; border: 1px solid rgb(223, 226, 231); cursor: pointer;">
                <p style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                    프로필 편집
                </p>
            </div>
        </div>

        <div style="margin-left: 60px; width: 580px; ">
            <p style="font-size: 24px; font-style: normal; font-weight: bold; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                소개
            </p>
            <p style="margin-top: 20px; font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                ${udto.userMoreInfo}
            </p>
            <div style="margin-top: 40px; height: 1px; background-color: rgb(231, 234, 238);"></div>
            <br>
            <p style="font-size: 24px; font-style: normal; font-weight: bold; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                등록한 장소
            </p>
               
<c:choose>  
	<c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
        <tr>
            <td colspan="6" align="center">
                등록된 게시물이 없습니다 
            </td>
        </tr>
    </c:when>
    <c:otherwise>
    <div style="position: relative;" >
       	<c:forEach items="${ boardLists }" var="row" varStatus="loop">
            <c:set var ="name" value="${udto.userID }"/>
            <c:if test="${name eq row.userID}">
            	<a href="./view.do?placeID=${row.placeID}" style="text-decoration: none;">
                	<img class="content" src="/images/uploads/${row.sfile}" style="height:60px; width: 100px;">
            	</a>
            </c:if>
          </c:forEach>   
          </div>
    </c:otherwise> 
</c:choose>

			<div style="margin-top: 40px; height: 1px; background-color: rgb(231, 234, 238);"></div>
			<br>
            <p style="font-size: 24px; font-style: normal; font-weight: bold; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                들어온 예약 요청
            </p>
			<c:forEach items="${ boardLists }" var="row" varStatus="loop">
            <c:set var ="name" value="${udto.userID }"/>
            <c:if test="${(name eq row.userID) && (row.reservationUser ne null)}">
            	<a href="./view.do?placeID=${row.placeID}" style="text-decoration: none;">
                	<img class="content" src="/images/uploads/${row.sfile}" style="height:60px; width: 100px;">
            	</a>
            </c:if>
          	</c:forEach>  

			<div style="margin-top: 40px; height: 1px; background-color: rgb(231, 234, 238);"></div>
			<br>
            <p style="font-size: 24px; font-style: normal; font-weight: bold; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                내가 한 예약 요청
            </p>

		    <div style="position: relative;" >
		       	<c:forEach items="${ boardLists }" var="row" varStatus="loop">
		            <c:set var ="name" value="${udto.userID }"/>
		            <c:if test="${name eq row.reservationUser}">
		            	<a href="./view.do?placeID=${row.placeID}" style="text-decoration: none;">
		                	<img class="content" src="/images/uploads/${row.sfile}" style="height:60px; width: 100px;">
		            	</a>
		            </c:if>
		          </c:forEach>   
		     </div>

        </div>

    </div>

</div>

    <div id="footer"></div>
</body>
</html>