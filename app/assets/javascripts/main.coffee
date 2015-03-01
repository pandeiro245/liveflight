$ ->
  ruffnote(18941, 'main')
  ruffnote(18942, 'footer')
  if $('#pictures').length
    ruffnote(18943, 'pictures')
  
  $(document).on('click', '#want', () ->
    alert '演奏してみたいボタンをクリックしました！'
  )

ruffnote = (id, dom, callback=null) ->
  Ruffnote.fetch("pandeiro245/liveflight/#{id}", dom, callback)
