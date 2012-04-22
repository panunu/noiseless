class Noiseless
  formats = '###': 'h3', '##': 'h2', '#': 'h1'

  bind: =>
    $('#format').live 'click', (e) => @format()
  
  format: (content) =>
    content = $('#content').html().trim()
    
    for markdown, html of formats
      content = content.replace('<div>' + markdown, '<div><' + html + '>') # TODO: Make it better.
    
    $('#content').html content

app = new Noiseless
app.bind()