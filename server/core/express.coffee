express          = require 'express'
session          = require 'express-session'
moment           = require 'moment'
compress         = require 'compression'
bodyParser       = require 'body-parser'
methodOverride   = require 'method-override'
cookieParser     = require 'cookie-parser'
passport         = require 'passport'

root             = require 'app-root-path'
pkg              = require root.resolve('package.json')
config           = require root.resolve('server/config')
chalk            = require root.resolve('server/core/chalk')
logger           = require root.resolve('server/core/logger')
db               = require root.resolve('server/core/mongo')
MongoStore       = require('connect-mongo')(session)


setUpText = (item) ->
  logger.info "Set up #{chalk.blue(item)}"

initMiddleware = (app) ->
  setUpText "compressor"
  app.use compress
    filter: (req, res) ->
      return /json|text|javascript|css/.test(res.getHeader("Content-Type"));
    level: 3,
    threshold: 512

  setUpText "body parser"
  app.use bodyParser.urlencoded
    extended: true
    limit: config.contentMaxLength * 2

  setUpText "static path"
  app.use(express.static(root.resolve('dist'), { maxAge: 30 * 60 * 60 * 24 * 1000 }))
  setUpText "methods override"
  app.use methodOverride()
  setUpText "cookie parser"
  app.use cookieParser()
  setUpText "cookie parser"
  app.use bodyParser.json()


initSession = (app) ->
  app.use session
    saveUninitialized: true,
    resave: false,
    secret: config.sessionSecret
    store: new MongoStore({
      mongooseConnection: db
      collection: config.sessions.collection
      autoReconnect: true
    })
    cookie: config.sessions.cookie
    name: config.sessions.name
  setUpText "session with mongo"


initAuth = (app) ->
  setUpText "passport"
  # https://www.npmjs.com/package/passport
  # no auth needed for this app


# create our express app
app = express()
app.set "port", config.port
app.set 'service', 'the server'
app.locals.year = moment().format("YYYY")
app.locals.app =
  name: pkg.name
  version: pkg.version
  description: pkg.description
app.locals.root = root.path

# Set up our express app
initMiddleware(app)
initSession(app)
initAuth(app)

# register routes
require('../routes')(app)

module.exports = app