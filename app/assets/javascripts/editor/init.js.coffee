@init_editor = ->
  editor = new MediumEditor('.js-editor')

  endSubmit = undefined

  $('.js-editor').on 'input', ->
    $_this = $(this)

    clearTimeout endSubmit

    endSubmit = setTimeout((->
      $(window).trigger 'endSubmit'

      form = $_this.siblings('.js-form')
      form.find('.js-editable').val($_this.html()).submit()

      return
    ), 1000)

    return
