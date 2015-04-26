@init_main = ->
  init_attachment() if $('.js-dropzone').length
  init_editor()     if $('.js-editor').length
  init_sort()       if $('.js-sortable').length

$ ->
  init_main()
