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
    

    <div class="h_column_center" style="background-color: #3c82fa">
        <img src="images/cover.png" style="position: absolute; top: 0; left: 0; width: 100%;height: 100%;mix-blend-mode: soft-light;opacity: 0.6;">
        <div style="position: relative; width: 1160px; height: 620px;">
            
            <p style="position: absolute; top: 130px; left: 0px;font-size: 40px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.3;letter-spacing: -0.4px;color: #ffffff;">
                장소를 등록・관리 하세요!
            </p>
            <p style="position: absolute; top: 254px; left: 0px; right: 20px;font-size: 16px;font-weight: normal;font-stretch: normal;font-style: normal;line-height: 1.5;letter-spacing: -0.1px;color: #ffffff;">
                나의 집, 사무실, 옥상, 카페, 스튜디오 등 당신의 공간을 콘텐츠 제작 장소로 공유해보세요.<br>
                사진 몇 장만으로도 내가 원하는 시간을 활용해 수익을 올릴 수 있습니다.
            </p>
            <div class="h_row_center" style="position: absolute; top: 332px; left: 0px;">
                <a href="registerplaceaddress.jsp" style="text-decoration: none;">
                    <div class="h_center" style="width: 230px;height: 52px;border-radius: 8px;border: solid 1px #ffffff; cursor: pointer;" >
                        <div class="h_row_center">
                            <p style="margin-left: 6px; font-size: 16px;font-weight: 500;font-stretch: normal;font-style: normal;line-height: 1.38;letter-spacing: -0.1px;color: #ffffff;">
                                장소등록하기
                            </p>
                        </div>
                    </div>
                </a>
            </div>
            <div style="position: absolute; top: 424px; left: 0;">
                <div class="h_row_center" onclick="hourplace_v2.userLog('W', '/info/hosting', 'click', 'info/place');window.open('/info/place');" style="cursor:pointer;">
                    <p style="font-size: 16px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.38;letter-spacing: -0.1px;color: #ffffff;">장소 등록 가이드 보기</p>
                    <img src="//s3.hourplace.co.kr/web/images/icon/chevron_right_w.svg" style="margin-left: 2px; width: 14px; height: 14px">
                </div>
                <div class="h_row_center" onclick="hourplace_v2.userLog('W', '/info/hosting', 'click', 'info/host');window.open('/info/host');" style="margin-top: 6px;cursor:pointer;">
                    <p style="font-size: 16px;font-weight: bold;font-stretch: normal;font-style: normal;line-height: 1.38;letter-spacing: -0.1px;color: #ffffff;">호스트 FAQ 보기</p>
                    <img src="//s3.hourplace.co.kr/web/images/icon/chevron_right_w.svg" style="margin-left: 2px; width: 14px; height: 14px">
                </div>
            </div>
            
        </div>
    </div>


    <div id="footer"></div>
</body>
</html>