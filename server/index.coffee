moment      = require 'moment'
config      = require './config'
logger      = require './core/logger'
chalk       = require './core/chalk'
app         = require './core/express'


# start server
app.listen config.port, config.ip, () ->
  logger.info "--------------------------------------------------"
  logger.info "Server starting at: " + chalk.pink(moment().format("MM/DD/YYYY HH:mm:ss"))
  logger.info "Environment:        " + chalk.pink(process.env.NODE_ENV)
  logger.info "IP:                 " + chalk.pink(config.ip)
  logger.info "Port:               " + chalk.pink(config.port)
  logger.info "Database:           " + chalk.pink(config.db.server)
  logger.info "Redis:              " + chalk.pink(if config.redis.enabled then config.redis.uri else "Disabled")
  logger.info "--------------------------------------------------"

exports = module.exports = app