express = require 'express'

config = require './config'

app = express()

app.set 'views', './views'
app.set 'view engine', 'jade'
app.use '/static', express.static 'static'

app.get '/', (req, res) ->
  res.render 'index',
    title: 'Hey'
    message: 'Hello there!'

app.listen config.PORT, () ->
  console.log "Server listening on port #{config.PORT}"
