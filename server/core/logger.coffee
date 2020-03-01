winston = require 'winston'
mkdirp  = require 'mkdirp'
fs      = require 'fs'
path    = require 'path'
root    = require 'app-root-path'
config  = require root.resolve('server/config')


# Create logs directory if not exists
logDir = config.logging.file.path;
if not fs.existsSync(logDir)
  mkdirp logDir

# configure log format & level
{ combine, timestamp, label, printf } = winston.format
myFormat = printf ({ level, message, label, timestamp }) ->
  return "#{timestamp} [#{level}]: #{message}"

logger = null

if not logger
  logger = winston.createLogger
    level: 'info'
    format: combine(timestamp(), myFormat)
    transports: [
      # Write to all logs with level `info` and below to `combined.log`
      # Write all logs error (and below) to `error.log`.
      new winston.transports.File
        filename: path.join(logDir, 'error.log')
        level: 'error'
      new winston.transports.File
        filename: path.join(logDir, 'service.log')
      new winston.transports.Console({
        colorize: true
        prettyPrint: true,
        format: combine(timestamp(), myFormat)
      })
    ]

  # if process.env.NODE_ENV != 'production'
  #   logger.add(new winston.transports.Console({
  #     colorize: true
  #     prettyPrint: true,
  #     format: combine(timestamp(), myFormat)
  #   }))

module.exports = logger