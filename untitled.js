function changeCheckbox(element){
   $.ajax({
      url: ' http://localhost:3000/update_checked',
      dataType: 'text',
      type: 'post',
      data: { 'id': $(element).attr('id'), checked: $(element).is(":checked") },
      success: function(data){
        console.log(data)
      },
      error: function( jqXhr, textStatus, errorThrown ){
        console.log( errorThrown );
      }
    });
 }