moment   = require 'moment'
winston  = require 'winston'
mkdirp   = require 'mkdirp'
fs       = require 'fs'
path     = require 'path'
config   = require '../config'


# Create logs directory if not exists
logDir = config.logging.file.path;
if not fs.existsSync(logDir)
  mkdirp logDir

{format, createLogger, transports} = winston
prettyJson = format.printf (info) ->
  if info.message.constructor == Object
    info.message = JSON.stringify(info.message, null, 2)
  time = moment(info.timestamp).format('YYYY-MM-DD HH:mm:ss')
  return "#{time} #{info.level}: #{info.message}"

logger = null
if not logger
  logger = createLogger
    level: 'info'
    format: format.combine(
      format.colorize(),
      format.prettyPrint(),
      format.splat(),
      format.simple(),
      prettyJson,
    )
    transports: [
      new winston.transports.File
        filename: path.join(logDir, 'error.log')
        level: 'error'
      new transports.Console({})
    ]

module.exports = logger