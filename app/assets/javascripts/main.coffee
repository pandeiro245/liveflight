$ ->
  ruffnote(18941, 'main')

ruffnote = (id, dom, callback=null) ->
  Ruffnote.fetch("pandeiro245/liveflight/#{id}", dom, callback)
