<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/header.css" type="text/css" rel="stylesheet">

    <title>easystudio</title>
</head>
	
	<%String id = ""; 
		id=(String)session.getAttribute("userID");
	%>
	
<body>

    <div style="height: 80px; width: 100%;"></div>
    <div id="header"
        style="position: absolute; width: 100%; top: 0px; z-index: 1000; transform: translateZ(0px); background-color: transparent;">
        <div class="h_row_center" style="position: relative; width: 1160px; height: 80px;">
            <a href="index.jsp" style="text-decoration: none;"><p style="font-size: 30px; width: 130px; height: 32px; cursor: pointer; ">easystudio</p></a>
            <div class="h_row_center" style="position: absolute; right: 0px; height: 100%; z-index: 10000;">
                <div class="h_row_center category_all_button" style="height: 100%;">
                    <div onclick="hourplace_v2.userLog('W', '/', 'click', 'tab', 'all');"
                        class="h_center h_header_button" style="padding: 0px 13px; height: 40px;">
                        <p style="font-style: normal; font-weight: 500; font-size: 16px; line-height: 22px; text-align: center; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
                            모든 카테고리
                        </p>
                        <div class="category_all"
                            style="position: fixed; top: 80px; left: 0px; width: 100%; z-index: 9999; cursor: default;">
                            <div class="h_column_center"
                                style="width: 100%; padding-bottom: 40px; background-color: white; position: relative;">
                                <div style="padding: 10px 0px; width: 1160px; display: flex; flex-direction: row;">
                                    <div style="flex: 1 1 0%;">
                                        <p class="h_hover_button"
                                            style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: -0.2px; color: rgb(69, 75, 80); padding: 7px 12px 5px 8px; margin-bottom: 10px;">
                                            가정집
                                        </p>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                전체
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                아파트
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                주택
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                빌라
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                원룸
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                한옥
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                홈오피스
                                            </p>
                                        </div>
                                    </div>
                                    <div style="flex: 1 1 0%;">
                                        <p class="h_hover_button"
                                            style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: -0.2px; color: rgb(69, 75, 80); padding: 7px 12px 5px 8px; margin-bottom: 10px;">
                                            스튜디오
                                        </p>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                전체
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                자연광
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                호리존
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                유튜브
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                단독주택형
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                빈티지
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                키친
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                무대형
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                세트장
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                무인
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                녹음실
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                연습실
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                파티룸
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                스튜디오 기타
                                            </p>
                                        </div>
                                    </div>
                                    <div style="flex: 1 1 0%;">
                                        <p class="h_hover_button"
                                            style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: -0.2px; color: rgb(69, 75, 80); padding: 7px 12px 5px 8px; margin-bottom: 10px;">
                                            상업 공간
                                        </p>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                전체
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                카페
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                식당
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                바/술집
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                헬스장
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                요가/필라테스
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                기타 상업 공간
                                            </p>
                                        </div>
                                    </div>
                                    <div style="flex: 1 1 0%;">
                                        <p class="h_hover_button"
                                            style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: -0.2px; color: rgb(69, 75, 80); padding: 7px 12px 5px 8px; margin-bottom: 10px;">
                                            편의 시설
                                        </p>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                전체
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                편의점
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                빨래방
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                헤어샵
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                PC방
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                노래방
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                오락실
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                스포츠
                                            </p>
                                        </div>
                                    </div>
                                    <div style="flex: 1 1 0%;">
                                        <p class="h_hover_button"
                                            style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: -0.2px; color: rgb(69, 75, 80); padding: 7px 12px 5px 8px; margin-bottom: 10px;">
                                            문화 공간
                                        </p>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                전체
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                복합문화공간
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                갤러리
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                공방/작업실
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                책방
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                공연장
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                강당
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                강의실
                                            </p>
                                        </div>
                                    </div>
                                    <div style="flex: 1 1 0%;">
                                        <p class="h_hover_button"
                                            style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: -0.2px; color: rgb(69, 75, 80); padding: 7px 12px 5px 8px; margin-bottom: 10px;">
                                            특수 공간
                                        </p>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                전체
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                사무실
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                병원/약국
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                경찰서
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                학교
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                학원
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                클럽
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                웨딩
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                호텔펜션
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                기타 특수 공간
                                            </p>
                                        </div>
                                    </div>
                                    <div style="flex: 1 1 0%;">
                                        <p class="h_hover_button"
                                            style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: -0.2px; color: rgb(69, 75, 80); padding: 7px 12px 5px 8px; margin-bottom: 10px;">
                                            대형 공간
                                        </p>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                전체
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                공장
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                창고
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                지하실
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                빈 공간
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                폐차장
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                기타 대형 공간
                                            </p>
                                        </div>
                                    </div>
                                    <div style="flex: 1 1 0%;">
                                        <p class="h_hover_button"
                                            style="font-size: 20px; font-weight: bold; font-stretch: normal; font-style: normal; line-height: 1.4; letter-spacing: -0.2px; color: rgb(69, 75, 80); padding: 7px 12px 5px 8px; margin-bottom: 10px;">
                                            야외
                                        </p>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                전체
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                옥상
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                정원
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                공터
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                캠핑장
                                            </p>
                                        </div>
                                        <div class="h_hover_button h_row_center"
                                            style="padding-left: 8px; height: 32px; width: 100%; border-radius: 2px;">
                                            <p
                                                style="font-size: 15px; font-weight: normal; font-stretch: normal; font-style: normal; line-height: 1.6; letter-spacing: normal; color: rgb(69, 75, 80);">
                                                기타 야외 장소
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="h_column_center" style="width: 100%;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="list.do" style="text-decoration: none;">
	                <div class="h_center h_header_button" style="padding: 0px 13px; height: 40px; margin-left: 8px;">
	                    <p
	                        style="font-style: normal; font-weight: 500; font-size: 16px; line-height: 22px; text-align: center; letter-spacing: -0.1px; color: rgb(27, 29, 31);">
	                        사진으로보기
	                    </p>
	                </div>
                </a>
                <div class="h_center" style=""></div>


                <a href="search.jsp">
                    <div class="h_center" style="margin-left: 1px; width: 36px; height: 44px; cursor: pointer;"><img
                            src="https://s3.hourplace.co.kr/web/images/icon/search_v4.svg"
                            style="width: 24px; height: 24px;"></div>
                </a>


                <div style="margin-left: 10px; width: 1px; height: 16px; background: rgb(201, 205, 210);"></div>
                <a href="registerplace.jsp">
                    <div onclick="hourplace_v2.userLog('W', '/', 'click', 'tab', 'hosting', 0, '', '/info/hosting')"
                        class="h_center h_header_button" style="padding: 0px 13px; height: 40px; margin-left: 8px;">
                        <p
                            style="font-style: normal; font-weight: normal; font-size: 15px; line-height: 20px; text-align: center; color: rgb(114, 120, 127);">
                            장소 등록
                        </p>
                    </div>
                </a>
                <a href="logout.jsp" style="text-decoration: none;">
                    <div class="h_center h_header_button" style="padding: 0px 13px; height: 40px; margin-left: 8px;">
                        <p
                            style="font-style: normal; font-weight: normal; font-size: 15px; line-height: 20px; text-align: center; color: rgb(114, 120, 127);">
                            로그아웃
                        </p>
                    </div>
                </a>

                
            </div>
        </div>

    </div>

    <div style="width: 100%; background-color: rgb(231, 234, 238); height: 1px;"></div>

</body>

</html>