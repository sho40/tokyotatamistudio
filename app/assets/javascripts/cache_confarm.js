$(document).on('turbolinks:load',function(){
  $(function(){
    $('.confarm-content__main__purchase__purchase-link__bank-transfer').click(function() {
      if (!confirm('現金振込みで確定致しますか？')) {
        return false;
      } else {
        location.href = 'cache.html';
      }
    });
  });
});