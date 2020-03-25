$(document).on('turbolinks:load',function(){
  $(function() {
    $('.confarm-content__main__purchase__purchase-link__btn').on('click', function() {
      $('#card-overlay, #card-modalWindow').fadeIn();
    });
    
    $('.card-modalWindow__content__top__close-btn, #card-overlay').on('click', function() {
      $('#card-overlay, #card-modalWindow').fadeOut();
    });
    
    locateCenter();
    $(window).resize(locateCenter);

    function locateCenter() {
      let w = $(window).width();
      let h = $(window).height();
      
      let cw = $('#card-modalWindow').outerWidth();
      let ch = $('#card-modalWindow').outerHeight();
    
      $('#card-modalWindow').css({
        'left': ((w - cw) / 2) + 'px',
        'top': ((h - ch) / 2) + 'px'
      });
    }
  });
});
