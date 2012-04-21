$('#format').live 'click', (e) ->
  content = $('#content').html().trim()
  content = content.replace('<div>#', '<div><h1>').replace('#</div>', '</h1></div>') # TODO: Make it better.
  
  $('#content').html content