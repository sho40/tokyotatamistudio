$(document).on('turbolinks:load',function(){

  var form = $(".card-form")
  $("#charge-form").click(function() {
    form.find("button[type=submit]").prop("disabled", true);

    Payjp.setPublicKey('pk_test_249441c3c84fde3e191db39c');

    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
      name: $('#name').val()
    };


    Payjp.createToken(card, function(status, response) {
      if (response.error) {
        form.find('.payment-errors').text(response.error.message);
        form.find('button[type=submit]').prop('disabled', false);
      }
      else {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#name").removeAttr("name")

        var token = response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      }
    });
  });
});