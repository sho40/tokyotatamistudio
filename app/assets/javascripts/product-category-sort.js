$(document).on('turbolinks:load',function(){
  $(function(){
    $('.products-content__main__tab__group li').click(function(){
      var index = $('.products-content__main__tab__group li').index(this);
      $('.products-content__main__tab__group li').removeClass('is-active');
      $(this).addClass('is-active');
      $('.products-content__main ul').removeClass('is-show').eq(index).addClass('is-show');
    });
  });
});