
define (require, exports) ->
  esprima = require "esprima"
  compact = require "compact"
  compact.render.hide = no

  mode = "compact" # or "json"

  q = (query) ->
    document.querySelector query

  source = q ".source"
  target = q ".target"
  mode_btn = q ".mode"

  render = (data) ->
    content = \
      if mode is "compact"
        compact.render data
      else
        JSON.stringify data, null, 2
    target.value = content

  get_data = ->
    try
      esprima.parse source.value, loc: yes
    catch error
      error.toString()

  whole = ->
    render get_data()

  mode_btn.onclick = ->
    mode = if mode is "compact" then "json" else "compact"
    do whole

  source.onkeyup = ->
    target.value = ""
    do whole

  do whole