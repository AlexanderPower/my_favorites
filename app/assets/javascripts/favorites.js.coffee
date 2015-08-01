jQuery ->
  $('body').on 'click', '.fa-star-o', ->
#    console.log $(this).data('favorite')
    $.ajax({
      type: "POST",
      url: "/add_favorite",
      data: { favorite: { id: $(this).data('id'),klass: $(this).data('klass') } },
      success:(response) =>
        console.log 'success'
        $(this).removeClass('fa-star-o').addClass('fa-star')
      error: (response) ->
        alert "error #{response}"
    })

  $('body').on 'click', '.fa-star', ->
    $.ajax({
      type: "DELETE",
      url: "/delete_favorite",
      data: { favorite: { id: $(this).data('id'),klass: $(this).data('klass') } },
      success:(response) =>
        console.log 'success'
        $(this).removeClass('fa-star').addClass('fa-star-o')
      error: (response) ->
        alert "error #{response}"
    })