<%@page import="place.placeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/header.css" type="text/css" rel="stylesheet">
    
    <script src="javascript/detail_flipsnap.js" type="text/javascript"></script>
    <script src="javascript/script.js" defer type="text/javascript"></script>
    <script src="javascript/flipsnap.js" type="text/javascript"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
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
 
 
 
<div class="h_column_center" style="min-height: 1000px;">
    <div class="h_column_center" style="background-color: rgb(255, 255, 255); position: fixed; top: 80px; right: 0px; left: 0px; z-index: 2; display: none;"><div style="width: 1160px;"><div class="h_row_center" style="width: 720px; height: 52px; border-bottom: 1px solid var(--grey-020); background-color: rgb(255, 255, 255); justify-content: space-between;"><div class="h_place_select_button h_row_center on" style="width: 180px; cursor: pointer;"><p>
        장소 소개
    </p></div> <div class="h_place_select_button h_row_center" style="width: 180px; cursor: pointer;"><p>
        이용 규칙
    </p></div> <div class="h_place_select_button h_row_center" style="width: 180px; cursor: pointer;"><p>
        리뷰 <label style="font-weight: 500; color: rgb(158, 164, 170);">35</label></p></div> <div class="h_place_select_button h_row_center" style="width: 180px; cursor: pointer;"><p>
        질문 <label style="font-weight: 500; color: rgb(158, 164, 170);">9</label></p></div></div></div> <div style="width: 100%; height: 1px; background-color: var(--grey-020); margin-top: -1px; z-index: -1;"></div></div>




    <div style="width: 1160px;">
        <div class="h_row_center" style="margin-top: 20px;">
            <p style="font-size: 18px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                장소번호:${dto.placeID }
            </p>
        </div>
        <p id="place_title" style="margin-top: 8px; font-size: 32px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.31; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
            ${dto.placeTitle }
        </p>

        <div class="h_row" style="width: 100%;">

            <div style="position: relative; width: 720px; ">
                <div style="margin-top: 50px; height: 480px; width: 100%; overflow: hidden; display: flex; border-radius: 6px;">
                    <img src="images/uploads/${dto.sfile}"  style="height: 480px; width: 720px;">
                </div>
                

                <div class="h_row_center" style="margin-top: 30px; width: 100%; height: 60px; position: relative;">
                    <div class="h_row_center" style="max-width: 583px; height: 60px; width: fit-content; cursor: pointer;">
                        <div style="width: 60px; height: 60px; margin-right: 20px;">
                            <img src="images/uploads/profile_admin.png" alt="" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;">
                        </div>
                        <div style="max-width: 513px; margin-right: 20px; width: fit-content;">
                            <div style="width: fit-content;">
                                <p style="font-size: 14px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.43; letter-spacing: normal; color: rgb(114, 120, 127);">
                                    호스트 
                                </p>
                                <p style="margin-top: 2px; font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                                    ${dto.userID}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div style="position: absolute; top: 0px; right: 0px; width: 107px; height: 60px;">
                        <div class="h_center" style="margin-top: 8px; border-radius: 14px; border: 1px solid rgb(36, 111, 248); width: 107px; height: 28px;"><p style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: -0.1px; color: rgb(36, 111, 248);">
                        	${dto.placeID}
                    </p></div></div>
                </div>

                <div style="margin-top: 30px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>

                <div style="" id="sub_tab">
                    <div style="background-color: rgb(255, 255, 255);">
                        <div class="h_row_center" style="width: 100%; height: 52px; border-bottom: 1px solid rgb(231, 234, 238); background-color: rgb(255, 255, 255); justify-content: space-between;">
                            <div class="h_place_select_button h_row_center on" style="width: 180px; cursor: pointer;">
                                <p>
                                    장소 소개
                                </p>    
                            </div>
                            <div class="h_place_select_button h_row_center" style="width: 180px; cursor: pointer;">
                                <p>
                                    이용 규칙
                                </p>
                            </div>
                            <div class="h_place_select_button h_row_center" style="width: 180px; cursor: pointer;">
                                <p>
                                    리뷰 <label style="font-weight: 500; color: rgb(158, 164, 170);"></label>
                                </p>
                            </div>
                            
                        </div>
                        <div style="width: 100%; height: 1px; background-color: var(--grey-020); margin-top: -1px; z-index: -1;"></div>
                    </div>
                </div>





                <p id = "sub_tab_0" style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                    장소 소개
                </p>
                <p style="margin-top: 16px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                    ${dto.placeIntroduce}
                </p>

                <div style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>

                <p style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                    위치
                </p>


                
                
           	<div id="map" style="width:500px;height:400px;"></div>
           	
           	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e575717f81a20e7f099338ffa1121c3f&libraries=services"></script>
		    <script>
		    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('<c:out value="${location}"/>', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">이 근처에요!</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		    
		        
		                    
		    </script>

                <p style="margin-top: 20px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                    자세한 주소는 호스트 승인 후, 문의 가능합니다.
                </p>

                
                
                <div style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
                <p style="margin-top: 40px; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                    장소 이용 규칙
                </p>
                <p style="margin-top: 20px; margin-bottom: 40px; font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                    ${dto.placeRule}
                </p>



                <div id="feedback">
                    
                    <div>
                        <div style="margin-top: 40px; width: 100%; height: 1px; background-color: rgb(231, 234, 238);"></div>
                        <div class="h_row_center" style="margin-top: 40px; position: relative;">
                            
                            <p style="font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                                장소 리뷰
                            </p>
                            <p style="margin-left: 9px; font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 0.7; letter-spacing: -0.67px; text-align: center; color: rgb(36, 111, 248);">
                                
                            </p>

                            
                        </div>
                        <div style="margin-top: 5px;">

						
						<c:forEach items="${ boardLists }" var="row" varStatus="loop">
                            <!--리뷰 한 묶음-->
                            ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
                            <div style="position: relative; margin-top: 30px; width: 100%; padding-bottom: 32px; border-bottom: 1px solid rgb(231, 234, 238);">
                                <div class="h_row_center" style="justify-content: space-between; position: relative;">
                                    <p style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                                        ${row.reviewUserID }
                                    </p>
                                </div>
                                <div class="h_row_center" style="margin-top: 6px;">
                                    <div class="review_star" style="margin-top: 0px;">
                                        <span style="width: 100%;"></span>
                                    </div>
                                    <p style="margin-left: 6px; font-style: normal; xfont-weight: 500; font-size: 12px; color: rgb(158, 164, 170);">
                                        ${row.reviewDate}
                                    </p>
                                </div>
                                <div class="h_row" style="margin-top: 16px; justify-content: space-between;">
                                    <div>
                                        <p style="margin-bottom: 16px; font-size: 16px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(114, 120, 127);">
                                            ${row.reviewText}
                                        </p>
                                        
                                    </div>
                                    
                                </div> 
                            </div>
                        </c:forEach> 
                            
                            
                            
                            
                        </div>
                        <table border="1" width="90%">
					        <tr align="center">
					            <td>
					                ${ map.pagingImg }
					            </td>
					            <td width="100">
					            	<form action="review.jsp" method="get">
					            		<input type="hidden" name="placeID" value="${dto.placeID }">
					            		<input type="hidden" name="userID" value="${dto.userID }">
					            		<button type="submit" >글쓰기</button>
					            	</form>
					            </td>
					        </tr>
					    </table>
                    </div>
                </div>
            </div>



            <div id="booking_box_container" style="width: 400px; margin-left: 40px; position: absolute; right: 0px; top:100px;">
                <div id="booking_box" style="margin-top: 16px; border-radius: 10px; border: 1px solid rgb(223, 226, 231); background-color: rgb(255, 255, 255);">
                    <div style="margin: 30px;">
                        <p
                            style="font-size: 12px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: normal; color: rgb(69, 75, 80);">
                            현재 단계에서는 요금이 청구되지 않습니다.
                        </p>
                        <p
                            style="margin-top: 6px; font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                            호스트에게 진행이 가능한지 확인해 보세요.
                        </p>
                        
                        
                        
                        
                        <form action="./booking.do?placeID=${dto.placeID}&userID=<%=id%>">
                        <input type= "hidden" value="<%=id%>" name ="userID" id="userID">
                        <input type= "hidden" value="${dto.placeID}" name ="placeID" id="placeID">
                        
                        <div style="margin-top: 8px; align-items: flex-end;" class="h_row">
                            <p tyle="font-size: 18px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.44; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                                <input type ="hidden" value="${dto.price}" name ="price" id="price">${dto.price } 원 / 일(day)
                                
                        </div>
                        <div class="" style="margin-top: 16px; height: 1px; background-color: rgb(231, 234, 238);"></div>
                        <div style="margin-top: 20px;" class="h_row_center">
                            <p style="font-size: 16px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                                스케줄
                            </p>
                            
                        </div>
                        <div style="margin-top: 10px; position: relative;">
                            <p style="font-size: 12px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.17; letter-spacing: normal; color: rgb(158, 164, 170);">
                                <input type="date" name ="date" id="date">
                            </p>
                            
                            
                        </div>
                        
                        <!---->
                        <div style="position: relative;">
                            
                            <div class="h_row_center" style="margin-top: 20px;">
                                <div style="width: 235px;">
                                    <div class="request" style="margin-top: 0px;">
                                        <p>
                                            <input type="submit" value="지금 예약 요청하기">
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form>
                        
                    </div>
                </div>
            </div>



        </div>


        

    </div>    

</div>





<div id="footer"></div>
</body>





</body>
</html>