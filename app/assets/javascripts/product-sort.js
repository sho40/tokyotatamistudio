$(function(){
  $("#product-list").change(function(){
    const sortTh = $("#product-list").val();
    $("#span4").text(sortTh);
  });
});