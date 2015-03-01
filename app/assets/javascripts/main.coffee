$ ->
  ruffnote(18941, 'main')
  ruffnote(18942, 'footer')
  if $('#pictures').length
    ruffnote(18943, 'pictures')
  
  $(document).on('click', '#want', () ->
    alert '演奏してみたいボタンを押すと演奏スケジュールカレンダーに遷移する予定です（開発中）'
  )

ruffnote = (id, dom, callback=null) ->
  Ruffnote.fetch("pandeiro245/liveflight/#{id}", dom, callback)
