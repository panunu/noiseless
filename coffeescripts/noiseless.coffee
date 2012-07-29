class Noiseless
  formats = '###': 'h3', '##': 'h2', '#': 'h1'
  
  constructor: ->
    if localStorage.getItem 'noiseless-written'
      $('#content').html localStorage.getItem 'noiseless-written'

  bind: =>
    $('#content div').live 'dblclick', (e) => @format e.currentTarget
    $('#persist').live 'click', (e) => @persist()
    
  persist: ->
    localStorage.setItem 'noiseless-written', $('#content').html()
 
  format: (target) =>
    content = $(target).html().trim()
    
    if content.indexOf('#') is -1 then return
        
    # TODO: Make it better.
    for markdown, html of formats
      content = content.replace(markdown, '<' + html + '>')
    
    $(target).html content
    
  focus: (target) => $(target).addClass 'focus'
    
app = new Noiseless
app.bind()