myJob = require './modules/myJob'
myListener = require './modules/myListener'
moment = require 'moment'

conf =
  type: 'hourly'
  campaign: 'TCamp'
  time: moment().add(1, 'm').hour(1)
  #time: moment().add(1, 'm').valueOf()
  #time: moment().add(1, 'm').minute()

console.log "current = #{moment().format('hh:mm a')}"
console.log "time = #{moment(conf.time).format('hh:mm a')}"

testJob = new myJob.Job(conf)
testJob.on 'TestEvent', myListener

server = require('http').createServer()
server.listen 8080, () ->
  console.log 'listening on port 8080'