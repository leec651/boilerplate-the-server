mongoose  = require 'mongoose'
root      = require 'app-root-path'

chalk     = require root.resolve('server/core/chalk')
logger    = require root.resolve('server/core/logger')
config    = require root.resolve('server/config')

mongoose.set 'useCreateIndex', true
mongoose.connect config.db.server, config.db.options

mongoose.connection.on 'error', (err) ->
  logger.error config.mongo
  throw new Error(err) if err

mongoose.connection.once 'open', ->
  logger.info "Connected to #{chalk.yellow(config.db.server)}"

module.exports = mongoose.connection