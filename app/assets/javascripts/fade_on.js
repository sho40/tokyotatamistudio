$(function(){
  $(window).scroll(function(){
    $("#fade_on_parts").each(function(){
      var imgpos = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > imgpos - windowHeight + windowHeight/3) {
        $(this).addClass("fade_on");
      } else {
        $(this).removeClass("fade_on");
      }
    });
  });
});