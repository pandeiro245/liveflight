$ ->
  ruffnote(18941, 'main')
  ruffnote(18942, 'footer')

ruffnote = (id, dom, callback=null) ->
  Ruffnote.fetch("pandeiro245/liveflight/#{id}", dom, callback)
