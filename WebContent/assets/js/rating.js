$(".rating-box").show().css('left',$(".rating-n li").eq(0).offset().left);

$(".rating-n").mouseenter(function() {
  $(".rating-box").show();
}).mouseleave(function() {
  //$(".rating-box").hide();
});


$(".rating-n li").mouseenter(function() {
var offset = $(this).offset();
  $(".rating-box").stop().animate({'left':offset.left});
  
  var index = $(this).index();
  $(".rating-preview").stop().animate({'margin-top':(index*50)*-1});
});

// Animation preview
$('.rating-preview').delay(500).animate({
  'margin-top': -50
  }, 500, function() {
$('.rating-preview').delay(500).animate({
  'margin-top': -100
  },500);
                                        
  });

$('.rating-box').delay(500).animate({
  'left':"+=45"
  }, 500, function() {
    
$('.rating-box').delay(500).animate({
  'left':"+=45"
  }, 500)

});