require 'coffee-script'
http = require 'http'
fs = require 'fs'
socketio = require 'socket.io'
jade = require 'jade'
assets = require 'connect-assets'
express = require 'express'
request = require 'request'

MemoryStore = express.session.MemoryStore

app = express()
app.set 'views', __dirname + '/components'
app.set 'view engine', 'jade'
app.use express.bodyParser()
app.use express.favicon()
app.use '/assets', express.static __dirname + '/assets'
app.use assets src: __dirname
app.use app.router

css.root = 'assets'
js.root = 'assets'

app.get '/', (req, res) ->
  res.render 'index.jade'

server = http.createServer app
server.listen 3000, 'localhost'

io = socketio.listen server
io.set 'log level', 2
io.sockets.on 'connection', (socket) ->
  console.log 'connected'
