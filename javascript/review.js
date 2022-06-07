// container 클래스안의 모든 이미지가 로딩되면 masonry 적용
$imgs = $('.container').imagesLoaded(function() {
  $imgs.masonry({
      itemSelector : '.item', // img 태그를 대상으로 masonry 적용
      fitWidth : true // 내용물을 가운데 정렬하기, CSS margin:0 auto; 설정이 필요함
  });
});



function indexViewMore() {
  var lastIndex = 0;
  if ((currentIndex + 10) < rankList.length) {
      lastIndex = currentIndex + 10;
  } else {
      lastIndex = rankList.length;
  }

  var htmlString = '';
  for (currentIndex; currentIndex < lastIndex; currentIndex++) {
      htmlString += '<div class="item">';
      htmlString += '    <img src="' + apiUrl + rankList[currentIndex]["thumbnailImageUrl"] + '" class="gg-image" onclick="javascript:goGallery(\'' + rankList[currentIndex]["userId"] + '\', \'' + rankList[currentIndex]["userName"] + '\', \'' + rankList[currentIndex]["countryCode"] + '\', \'' + rankList[currentIndex]["Cnt"] + '\', \'' + rankList[currentIndex]["photoUrl"] + '\', \'0\', \'' + rankList[currentIndex]["id"] + '\');">';
      htmlString += '    <div class="info">';
      htmlString += '        <div class="donee donee-' + rankList[currentIndex]["givingTargetId"] + '"></div>';
      htmlString += '        <div class="profile">';

      if (rankList[currentIndex]["photoUrl"]) {
          htmlString += '         <img src="' + apiUrl + rankList[currentIndex]["photoUrl"] + '">';
      } else {
          htmlString += '         <img class="null" src="">';
      }
      
      htmlString += '        </div>';
      htmlString += '        <div class="username">' + rankList[currentIndex]["userName"] + '</div>';
      htmlString += '        <div class="country">' + countryName(rankList[currentIndex]["countryCode"]) + '</div>';
      htmlString += '        <div class="tag-area">';

      for (var j = 0; j < rankList[currentIndex]["hashTags"].length; j++) {
          htmlString += '            <a class="tag">#' + rankList[currentIndex]["hashTags"][j] + '</a>';
      }//end for j

      htmlString += '        </div>';
      htmlString += '    </div>';
      htmlString += '</div>';
  }//end for currentIndex

  var localEl = $(htmlString);

  $('#masonryContainer').append(localEl).masonry('appended', localEl, true);

  setTimeout(function() {
      $('#masonryContainer').masonry();
  }, 50);

  setTimeout(function() {
      $('#masonryContainer').masonry();
  }, 50);
}