config      = require "../config"
logger      = require "../core/logger"

module.exports = (app) ->
  app.get "/health", (req, res) ->
    logger.info "health!"
    res.sendStatus(200);
