<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="css/index_slide.css" type="text/css" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="javascript/view.js" defer type="text/javascript"></script>
<script src="javascript/index_slide.js" defer type="text/javascript"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="javascript/flipsnap.js"></script>
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
 
 
 
    <div class = "h_column_center" style="padding-left: 100px; ">
        <div style="margin-top: 48px; margin-bottom: 40px; width: 1168px; margin-right: 8px;">
            <div class="h_row_center">
                <div onclick="hourplace_v2.userLog('W', '/', 'click', 'user_recommend', 'all', 0, '', '/user/recommend')" style="padding-left: 10px; cursor: pointer;">
                    <div class="h_row_center">
                        <p style="min-width: max-content; font-size: 24px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.33; letter-spacing: -0.3px; color: rgb(27, 29, 31);">
                            오늘의 추천 장소
                        </p>
                    </div>
                </div>
            </div>

            <div class="viewport">
                <div class="flipsnap">

                    <div class="item">
                        <div class="showbox">
                            <div class="slide-up">
                                <img src="images/room1.jpg">
                            </div>
                            <div class="slide-down">
                                <div class ="h_row_center" style="justify-content: space-between;">
                                    <p style="margin-top: 2px; font-style: normal; font-weight: bold; font-size: 10px; line-height: 14px; color: rgb(38, 40, 43);">
                                        형태 / 지역
                                    </p>
                                </div>
                                    <p class="h_ellipsis">
                                        서울 중심(경복궁역, 광화문) 넓은 마당과 자연이 어우러진 자연광 단독주택 작가의 작업실
                                    </p>
                                <div class="h_row_center" style="margin-top: 10px;">
                                    <p >88000원</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="showbox">
                            <div class="slide-up">
                                <img src="images/room1.jpg">
                            </div>
                            <div class="slide-down">
                                <div class ="h_row_center" style="justify-content: space-between;">
                                    <p style="margin-top: 2px; font-style: normal; font-weight: bold; font-size: 10px; line-height: 14px; color: rgb(38, 40, 43);">
                                        형태 / 지역
                                    </p>
                                </div>
                                    <p class="h_ellipsis">
                                        서울 중심(경복궁역, 광화문) 넓은 마당과 자연이 어우러진 자연광 단독주택 작가의 작업실
                                    </p>
                                <div class="h_row_center" style="margin-top: 10px;">
                                    <p >88000원</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="showbox">
                            <div class="slide-up">
                                <img src="images/room2.jpg">
                            </div>
                            <div class="slide-down">
                                <div class ="h_row_center" style="justify-content: space-between;">
                                    <p style="margin-top: 2px; font-style: normal; font-weight: bold; font-size: 10px; line-height: 14px; color: rgb(38, 40, 43);">
                                        형태 / 지역
                                    </p>
                                </div>
                                    <p class="h_ellipsis">
                                        서울 중심(경복궁역, 광화문) 넓은 마당과 자연이 어우러진 자연광 단독주택 작가의 작업실
                                    </p>
                                <div class="h_row_center" style="margin-top: 10px;">
                                    <p >88000원</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="showbox">
                            <div class="slide-up">
                                <img src="images/room3.jpg">
                            </div>
                            <div class="slide-down">
                                <div class ="h_row_center" style="justify-content: space-between;">
                                    <p style="margin-top: 2px; font-style: normal; font-weight: bold; font-size: 10px; line-height: 14px; color: rgb(38, 40, 43);">
                                        형태 / 지역
                                    </p>
                                </div>
                                    <p class="h_ellipsis">
                                        서울 중심(경복궁역, 광화문) 넓은 마당과 자연이 어우러진 자연광 단독주택 작가의 작업실
                                    </p>
                                <div class="h_row_center" style="margin-top: 10px;">
                                    <p >88000원</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="showbox">
                            <div class="slide-up">
                                <img src="images/room4.jpg">
                            </div>
                            <div class="slide-down">
                                <div class ="h_row_center" style="justify-content: space-between;">
                                    <p style="margin-top: 2px; font-style: normal; font-weight: bold; font-size: 10px; line-height: 14px; color: rgb(38, 40, 43);">
                                        형태 / 지역
                                    </p>
                                </div>
                                    <p class="h_ellipsis">
                                        서울 중심(경복궁역, 광화문) 넓은 마당과 자연이 어우러진 자연광 단독주택 작가의 작업실
                                    </p>
                                <div class="h_row_center" style="margin-top: 10px;">
                                    <p >88000원</p>
                                </div>
                            </div>
                        </div>
                    </div>


                    
                    

                </div>
            </div>


        </div>
    </div>

    <!--banner slide-->
    <div class="h_column_center" style="margin-top: 40px;  width: 100%; background-color: white;">
        <div class="swiper-container_big_banner_container" style="width: 1260px; height: 160px; position: relative;  padding-left: 110px;">
            <div class="swiper mySwiper" style="position: relative; height: 100%; width: 100%; border-radius: 9px; overflow: hidden; ">
                <div class="swiper-wrapper">
                <div class="swiper-slide" style="background-color: rgb(31, 211, 67);">Slide 1</div>
                <div class="swiper-slide" style="background-color: rgb(37, 124, 168);">Slide 2</div>
                <div class="swiper-slide" style="background-color: rgb(139, 171, 32);">Slide 3</div>
                <div class="swiper-slide" style="background-color: rgb(211, 67, 31);">Slide 4</div>
                <div class="swiper-slide" style="background-color: rgb(211, 42, 172);">Slide 5</div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    
    <div class="h_column_center" style="background-color: white;">
        <div class="h_row_center" style="margin-top: 60px; width: 1260px; justify-content: space-around; padding-left:100px;">
            <article><a href="detail1.html" id="cover"><div id = "inner_title">컨셉스튜디오</div></a><img src="images/contents2/house.jpg" alt="" style="width: 274px; height: 140px; border-radius:  10px;"></article>
            <article><a href="detail2.html" id="cover"><div id = "inner_title">상업 공간</div></a><img src="images/contents2/cafe-3537801_1920.jpg" alt="" style="width: 274px; height: 140px; border-radius:  10px;"></article>
            <article><a href="detail3.html" id="cover"><div id = "inner_title">문화 공간</div></a><img src="images/contents2/culture.jpg" alt=""style="width: 274px; height: 140px;border-radius:  10px;"></article>
            <article><a href="detail4.html" id="cover"><div id = "inner_title">특수 공간</div></a><img src="images/contents2/office.jpg" alt=""style="width: 274px; height: 140px;border-radius:  10px;"></article>
        </div>
    </div>




        <div style="flex-direction: row; display: flex; justify-content: center;"><div style="display: flex; flex-flow: row wrap; margin-top: 7px; min-width: 1160px; max-width: 1160px;"><div style="margin-top: 60px; width: 274px; margin-right: 21px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 1, '', '/category/1')" class="h_row_center h_pc_category_header" style="height: 40px; width: 100%;"><div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;"><img src="https://s3.hourplace.co.kr/web/images/category/main_emoji_1.png" style="width: 100%; height: 100%;"></div> <p>
            가정집
        </p> <img src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_b.svg" class="h_pc_category_header_chevron" style="width: 20px; height: 20px;"></div> <div style="display: flex; flex-flow: row wrap; margin-top: 7px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 1, '', '/category/1/1')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    아파트
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 2, '', '/category/1/2')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    주택
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 3, '', '/category/1/3')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    빌라
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 4, '', '/category/1/4')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    원룸
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 5, '', '/category/1/5')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    한옥
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'more', 1, '', '/category/1')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; background-color: rgb(245, 247, 248);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; color: rgb(114, 120, 127);">
                    더보기
                </p></div></div></div> <div style="margin-top: 60px; width: 274px; margin-right: 21px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 2, '', '/category/2')" class="h_row_center h_pc_category_header" style="height: 40px; width: 100%;"><div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;"><img src="https://s3.hourplace.co.kr/web/images/category/main_emoji_2.png" style="width: 100%; height: 100%;"></div> <p>
            스튜디오
        </p> <img src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_b.svg" class="h_pc_category_header_chevron" style="width: 20px; height: 20px;"></div> <div style="display: flex; flex-flow: row wrap; margin-top: 7px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 6, '', '/category/2/6')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    자연광
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 7, '', '/category/2/7')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    호리존
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 12, '', '/category/2/12')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    유튜브
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 9, '', '/category/2/9')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    단독주택형
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 8, '', '/category/2/8')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    키친
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'more', 2, '', '/category/2')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; background-color: rgb(245, 247, 248);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; color: rgb(114, 120, 127);">
                    더보기
                </p></div></div></div> <div style="margin-top: 60px; width: 274px; margin-right: 21px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 5, '', '/category/5')" class="h_row_center h_pc_category_header" style="height: 40px; width: 100%;"><div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;"><img src="https://s3.hourplace.co.kr/web/images/category/main_emoji_3.png" style="width: 100%; height: 100%;"></div> <p>
            상업 공간
        </p> <img src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_b.svg" class="h_pc_category_header_chevron" style="width: 20px; height: 20px;"></div> <div style="display: flex; flex-flow: row wrap; margin-top: 7px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 24, '', '/category/5/24')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    카페
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 56, '', '/category/5/56')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    식당
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 57, '', '/category/5/57')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    바/술집
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 38, '', '/category/5/38')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    헬스장
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 58, '', '/category/5/58')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    요가/필라테스
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'more', 5, '', '/category/5')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; background-color: rgb(245, 247, 248);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; color: rgb(114, 120, 127);">
                    더보기
                </p></div></div></div> <div style="margin-top: 60px; width: 274px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 4, '', '/category/4')" class="h_row_center h_pc_category_header" style="height: 40px; width: 100%;"><div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;"><img src="https://s3.hourplace.co.kr/web/images/category/main_emoji_4.png" style="width: 100%; height: 100%;"></div> <p>
            편의 시설
        </p> <img src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_b.svg" class="h_pc_category_header_chevron" style="width: 20px; height: 20px;"></div> <div style="display: flex; flex-flow: row wrap; margin-top: 7px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 31, '', '/category/4/31')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    편의점
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 30, '', '/category/4/30')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    빨래방
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 27, '', '/category/4/27')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    헤어샵
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 32, '', '/category/4/32')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    PC방
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 35, '', '/category/4/35')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    노래방
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'more', 4, '', '/category/4')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; background-color: rgb(245, 247, 248);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; color: rgb(114, 120, 127);">
                    더보기
                </p></div></div></div> <div style="margin-top: 60px; width: 274px; margin-right: 21px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 3, '', '/category/3')" class="h_row_center h_pc_category_header" style="height: 40px; width: 100%;"><div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;"><img src="https://s3.hourplace.co.kr/web/images/category/main_emoji_5.png" style="width: 100%; height: 100%;"></div> <p>
            문화 공간
        </p> <img src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_b.svg" class="h_pc_category_header_chevron" style="width: 20px; height: 20px;"></div> <div style="display: flex; flex-flow: row wrap; margin-top: 7px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 16, '', '/category/3/16')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    복합문화공간
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 60, '', '/category/3/60')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    갤러리
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 18, '', '/category/3/18')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    공방/작업실
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 20, '', '/category/3/20')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    공연장
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 23, '', '/category/3/23')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    강의실
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'more', 3, '', '/category/3')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; background-color: rgb(245, 247, 248);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; color: rgb(114, 120, 127);">
                    더보기
                </p></div></div></div> <div style="margin-top: 60px; width: 274px; margin-right: 21px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 6, '', '/category/6')" class="h_row_center h_pc_category_header" style="height: 40px; width: 100%;"><div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;"><img src="https://s3.hourplace.co.kr/web/images/category/main_emoji_6.png" style="width: 100%; height: 100%;"></div> <p>
            특수 공간
        </p> <img src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_b.svg" class="h_pc_category_header_chevron" style="width: 20px; height: 20px;"></div> <div style="display: flex; flex-flow: row wrap; margin-top: 7px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 25, '', '/category/6/25')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    사무실
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 36, '', '/category/6/36')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    병원/약국
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 22, '', '/category/6/22')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    학교
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 34, '', '/category/6/34')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    웨딩
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 26, '', '/category/6/26')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    호텔펜션
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'more', 6, '', '/category/6')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; background-color: rgb(245, 247, 248);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; color: rgb(114, 120, 127);">
                    더보기
                </p></div></div></div> <div style="margin-top: 60px; width: 274px; margin-right: 21px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 8, '', '/category/8')" class="h_row_center h_pc_category_header" style="height: 40px; width: 100%;"><div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;"><img src="https://s3.hourplace.co.kr/web/images/category/main_emoji_7.png" style="width: 100%; height: 100%;"></div> <p>
            대형 공간
        </p> <img src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_b.svg" class="h_pc_category_header_chevron" style="width: 20px; height: 20px;"></div> <div style="display: flex; flex-flow: row wrap; margin-top: 7px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 46, '', '/category/8/46')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    공장
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 49, '', '/category/8/49')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    창고
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 47, '', '/category/8/47')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    지하실
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 45, '', '/category/8/45')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    빈 공간
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 50, '', '/category/8/50')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    폐차장
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'more', 8, '', '/category/8')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; background-color: rgb(245, 247, 248);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; color: rgb(114, 120, 127);">
                    더보기
                </p></div></div></div> <div style="margin-top: 60px; width: 274px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'main', 7, '', '/category/7')" class="h_row_center h_pc_category_header" style="height: 40px; width: 100%;"><div style="width: 24px; height: 24px; margin: 0px 8px 0px 0px;"><img src="https://s3.hourplace.co.kr/web/images/category/main_emoji_8.png" style="width: 100%; height: 100%;"></div> <p>
            야외
        </p> <img src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_b.svg" class="h_pc_category_header_chevron" style="width: 20px; height: 20px;"></div> <div style="display: flex; flex-flow: row wrap; margin-top: 7px;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 40, '', '/category/7/40')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    옥상
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 41, '', '/category/7/41')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    정원
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 29, '', '/category/7/29')" class="h_center h_hover_button" style="margin-top: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    캠핑장
                </p></div> <div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'sub', 43, '', '/category/7/43')" class="h_center h_hover_button" style="margin-top: 8px; margin-right: 8px; width: 86px; height: 36px; border-radius: 4px; border: 1px solid rgb(223, 226, 231);"><p style="font-style: normal; font-weight: normal; font-size: 13px; line-height: 16px; text-align: center; color: rgb(27, 29, 31);">
                    기타 야외 장소
                </p></div></div></div></div></div>

        
                <div style="flex-direction: row; display: flex; justify-content: center; "><div style="position: relative; width: 1160px; margin-top: 60px; "><div class="h_column_center" style="width: 100%; background-color: white;"><div onclick="hourplace_v2.userLog('W', '/', 'click', 'category', 'all', 0, '', '/category')" class="h_center" style="width: 280px; height: 56px; border-radius: 8px; background-color: rgb(245, 249, 255); cursor: pointer;"><div class="h_row_center"><p style="font-size: 16px; font-weight: 500; font-stretch: normal; font-style: normal; line-height: 1.38; letter-spacing: -0.1px; text-align: center; color: rgb(36, 111, 248);">
                    모든 장소 보기
                </p> <img src="//s3.hourplace.co.kr/web/images/icon/before_blue.svg" style="margin: 0px 8px; width: 20px; height: 20px;"></div></div></div></div></div>

    </div>



    <div id="footer"></div>
</body>
</html>