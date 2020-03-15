passport  = require 'passport'
chalk     = require 'chalk'
root      = require 'app-root-path'

logger    = require root.resolve 'server/core/logger'
config    = require root.resolve 'server/config'

module.exports = (app) ->
  # TODO