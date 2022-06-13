<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link href="css/index_slide.css" type="text/css" rel="stylesheet">
    



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
    

    
<c:choose>  

	<c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
        <tr>
            <td colspan="6" align="center">
                등록된 게시물이 없습니다 
            </td>
        </tr>
    </c:when>
    <c:otherwise>
       	<c:forEach items="${ boardLists }" var="row" varStatus="loop">
            <div style="position: relative;">
            	<a href="./view.do?placeID=${row.placeID}">
                	
                	
                	<span class="item">
                        <div class="showbox">
                            <div class="slide-up">
                                <img class="content" src="/images/uploads/${row.sfile}" style="height:200px; width: 200px;">
                            </div>
                            <div class="slide-down">
                                <div class ="h_row_center" style="justify-content: space-between;">
                                    <p style="margin-top: 2px;text-decoration: none; font-style: normal; font-weight: bold; font-size: 20px; line-height: 14px; color: rgb(38, 40, 43);">
                                        ${row.placeTitle}
                                    </p>
                                </div>
                                    <p class="h_ellipsis" style=" text-decoration: none; ont-style: normal; font-weight: bold; font-size: 20px;">
                                        ${row.placeIntroduce}
                                    </p>
                                <div class="h_row_center" style="margin-top: 10px;">
                                    <p style=" text-decoration: none; ont-style: normal; font-weight: bold; font-size: 20px;">${row.price}원 / 일(day)</p>
                                </div>
                            </div>
                        </div>
                    </span>
                	
            	</a>
            </div>
          </c:forEach>   
    </c:otherwise> 
</c:choose>
    <div id="footer"></div>
    <script src="javascript/view.js"  type="text/javascript"></script>
</body>

</html>