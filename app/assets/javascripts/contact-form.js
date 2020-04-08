$(document).on('turbolinks:load',function(){
  $(function(){

    $('.nice-textbox').on('focusin', function(){
      $(this).parent().find('label').addClass('active');
    });

    $('.nice-textbox').on('focusout', function(){
      if (!this.value) {
        $(this).parent().find('label').removeClass('active');
      }
    });

  });
});