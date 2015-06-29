###
  Defining a class Job, which will create a campaign
  from a single row in the csv
###

events = require 'events'
CronJob = require('cron').CronJob
moment = require('moment')

###
  Conf object: Contains the configuration for the job
  fields:
    type: "daily", "hourly", "once"
    time: if type = "daily" then time of day (timestamp or date object)
          if type = "hourly" then minute
          if type = "once" then date time timestamp
    campaign: name
###

WatchJob = (conf) ->
  self = this
  self.conf = conf
  events.EventEmitter.call(self)    # call the constructor for EventEmitter
  triggerEvent =
    campaign: self.conf.campaign

  self.emitEvent = () -> self.emit 'TestEvent', triggerEvent

  setup = switch self.conf.type
    when "hourly" then moment(self.conf.time).format('00 mm * * * *')
    when "daily" then moment(self.conf.time).format('00 mm */h * * *')
    when "once" then new Date(self.conf.time)

  console.log "setup: #{setup}"

  job = new CronJob setup,
    () ->  self.emitEvent() ,
    () -> console.log "finished" ,
    true

  console.log 'created WatchJob'

WatchJob.prototype.__proto__ = events.EventEmitter.prototype

module.exports =
  Job: WatchJob
  createJob: (uconf) ->
    new WatchJob(uconf)         # Todo, do the necessary time adjustment
