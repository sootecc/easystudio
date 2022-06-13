var $pointer = $('.pointer span');
var flipsnap = Flipsnap('.flipsnap', {
    distance: 230
});
flipsnap.element.addEventListener('fspointmove', function() {
    $pointer.filter('.current').removeClass('current');
    $pointer.eq(flipsnap.currentPoint).addClass('current');
}, false);