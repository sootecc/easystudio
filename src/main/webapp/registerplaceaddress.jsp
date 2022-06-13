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
    	if(form.placeIntroduce.value =="" || form.title.value.length==0)	{
    		alert ("장소 소개를 입력하세요");
    		form.placeIntroduce.focus();
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
    <p style="text-align: center; font-size: 24px;">장소 등록하기</p>
    <br><br>

    <div style="width: 100%; height: 1000px; text-align: center;">
    
    	<form action ="write.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this);">
    		<label for="title">제목</label>
			<input type="text" name="placeTitle" id="placeTitle" >
			<br>
			<label for="price">가격</label>
			<input type="text" name="price" id="price" placeholder="단위: 원">
			<br>
			<label for="userid">작성자</label>
			<input type="text" name="userID" id="userID" value="<%= id %>" readonly>
			<br>
			<label for="placeIntroduce">장소 소개</label>
			<textarea name="placeIntroduce" id="placeIntroduce" cols="200" rows="7" style="padding:20px"></textarea>
			<br>
			<label for="placeRule">이용 규칙</label>
			<textarea name="placeRule" id="placeRule" cols="200" rows="7" style="padding:20px"></textarea>
			<br>
			<label for="ofile">사진 첨부</label>
			<input type="file" name="ofile" id="ofile">
			<br>
		
		
        <input type="text" id="address" placeholder="주소">
        <input type="text" id="detailAddress" placeholder="상세주소">
        <br>
        <input type="button" onclick="execDaumPostcode()" value="주소 검색하기">
        <button type ="submit" style="">등록하기</button>
        </form>
        
        <div id="map" style="width:100%;height:400px;margin-top:10px;display:none"></div>
    </div>




    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e575717f81a20e7f099338ffa1121c3f&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
    
        //지도를 미리 생성
        var map = new daum.maps.Map(mapContainer, mapOption);
        //주소-좌표 변환 객체를 생성
        var geocoder = new daum.maps.services.Geocoder();
        //마커를 미리 생성
        var marker = new daum.maps.Marker({
            position: new daum.maps.LatLng(37.537187, 127.005476),
            map: map
        });
    
    
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = data.address; // 최종 주소 변수

                    // 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("address").value = addr;
                    // 주소로 상세 정보를 검색
                    geocoder.addressSearch(data.address, function(results, status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {
    
                            var result = results[0]; //첫번째 결과의 값을 활용
    
                            // 해당 주소에 대한 좌표를 받아서
                            var coords = new daum.maps.LatLng(result.y, result.x);
                            // 지도를 보여준다.
                            mapContainer.style.display = "block";
                            map.relayout();
                            // 지도 중심을 변경한다.
                            map.setCenter(coords);
                            // 마커를 결과값으로 받은 위치로 옮긴다.
                            marker.setPosition(coords)
                        }
                    });


                }
            }).open();
        }
    </script>



    <div id="footer"></div>
</body>
</html>