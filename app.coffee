express = require 'express'
app = express()

server = require('http').createServer app

port = 8080
server.listen port, () ->
  console.log "listening on port #{port}"