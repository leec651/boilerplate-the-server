mongoose  = require 'mongoose'

chalk     = require '../core/chalk'
logger    = require '../core/logger'
config    = require '../config'

mongoose.set 'useCreateIndex', true
mongoose.connect config.db.server, config.db.options

mongoose.connection.on 'error', (err) ->
  logger.error config.mongo
  throw new Error(err) if err

mongoose.connection.once 'open', ->
  logger.info "Connected to #{chalk.yellow(config.db.server)}"

module.exports = mongoose.connection