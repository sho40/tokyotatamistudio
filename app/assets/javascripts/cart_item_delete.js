$(document).on('turbolinks:load' , function(){
  $(function(){
    $('.cart-content__main__current-cart__box__middle__product__sum__edit__delete-btn').on('click', function(){
      var deleteConfirm = confirm('カートから削除しますか？');

      if(deleteConfirm == true) {
        var clickEle = $(this)
        var itemID = clickEle.parent().parent().parent().attr("item-id");

        $.ajax({
          url: '/delete_item',
          type: 'DELETE',
          data: {item_id : itemID},
          dataType: 'json'
        })

        .done(function(){
          clickEle.parent().parent().parent().remove();
          window.location.reload(true);
        })

        .fail(function(){
          alert('通信に失敗しました')
        });
      } else {
        (function(){
          alert('商品が見つかりませんでした')
        });
      };
    });
  });
});