moment  = require 'moment'
config  = require './config'
logger  = require './core/logger'
{pink}  = require './core/chalk'
app     = require './core/express'


app.listen config.port, config.ip, () ->
  logger.info "env    " + pink(process.env.NODE_ENV)
  logger.info "ip     " + pink(config.ip)
  logger.info "port   " + pink(config.port)
  logger.info "db     " + pink(config.db.server)
  logger.info "redis  " + pink(if config.redis.enabled then config.redis.uri else "Disabled")

exports = module.exports = app