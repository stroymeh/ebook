@init_main = ->
  init_editor() if $('.js-editor').length

$ ->
  init_main()
