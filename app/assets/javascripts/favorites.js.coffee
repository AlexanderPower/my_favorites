jQuery ->
  $(".fa-star-o").click ->
    console.log $(this).data('favorite')