$(document).on('turbolinks:load',function(){

  var form = $("#charge-form")
      number = form.find('input[name="number"]'),
      exp_year = form.find('input[name="exp_year"]'),
      exp_month = form.find('input[name="exp_month"]'),
      cvc = form.find('input[name="cvc"]');
  $("#open-modal").click(function() {
    form.find("button[type=submit]").prop("disabled", true);

    Payjp.setPublicKey('pk_test_249441c3c84fde3e191db39c');

    var card = {
      number: number.val(),
      cvc: cvc.val(),
      exp_month: exp_month.val(),
      exp_year: exp_year.val()
    };


    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        form.find('.payment-errors').text(response.error.message);
        form.find('button[type=submit]').prop('disabled', false);
      }
      else {
        $(".card-modalWindow__content__form__number__input").removeAttr("name");
        $(".card-modalWindow__content__form__sub__cvc__input").removeAttr("name");
        $(".card-modalWindow__content__form__sub__wide-field__month__input").removeAttr("name");
        $(".card-modalWindow__content__form__sub__wide-field__year__input").removeAttr("name");

        var token = response.id;

        form.append($('<input type="hidden" name="payjp-token" />').val(token));
        form.get(0).submit();
      }
    });
  });
});