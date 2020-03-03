config      = require "../config"
logger      = require "../core/logger"

module.exports = (app) ->
  app.get "/health", (req, res) ->
    res.sendStatus(200);
