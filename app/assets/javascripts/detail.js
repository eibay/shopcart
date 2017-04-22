window.selectProduct = function() {
$('.products-row').on('click', function(){
    itemClick = $(this).attr("id");
    window.location = ROUTES.PRODUCT_PATH + "/" + (parseInt(itemClick) + 1);
  });
};