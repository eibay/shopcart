window.dataUpdate = function (){
  $('#getUpdate').on('click', function(){
    $.ajax({
    dataType: 'script',
    type: 'post',
    url: "updates"
    });
  });
};


