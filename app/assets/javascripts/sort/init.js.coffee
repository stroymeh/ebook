@init_sort = ->
  $('.js-sortable').sortable(
    connectWith: '.js-connected-sortable'
    placeholder: 'list-group-item sortable-placeholder'

    update: (event, ui) ->
      $_this = $(this)

      $.post($_this.data('sort-url'), $_this.sortable('serialize'))
  ).disableSelection()
  return
