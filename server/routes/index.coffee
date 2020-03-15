root    = require 'app-root-path'
config  = require root.resolve('server/config')

module.exports = (app) ->

  require('./health')(app)

  app.get '*', (req, res) ->
    res.sendFile root.resolve 'dist/index.html'

