moment = require 'moment'

###
  Simple logging listener to test out stuff

  Production time, will be replaced with actual msg sender mechanics
  event =
    campaign: "campaign name"
###

module.exports = (event) ->
  now = moment()
  console.log "Starting campaign: #{event.campaign} at #{now.format('hh:mm:ss a')}"
