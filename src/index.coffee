express = require 'express'
swig = require 'swig'

config = require './config'

app = express()

app.engine 'html', swig.renderFile

app.set 'views', './views'
app.set 'view engine', 'html'

app.set 'view cache', false
swig.setDefaults
  cache: false

app.use '/static', express.static 'static'

app.get '/', (req, res) ->
  res.render 'index',
    title: 'Hey'
    message: 'Hello there!'

app.listen config.PORT, () ->
  console.log "Server listening on port #{config.PORT}"
