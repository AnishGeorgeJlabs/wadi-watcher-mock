// Generated by CoffeeScript 1.9.3
(function() {
  var moment;

  moment = require('moment');


  /*
    Simple logging listener to test out stuff
  
    Production time, will be replaced with actual msg sender mechanics
    event =
      campaign: "campaign name"
   */

  module.exports = function(event) {
    var now;
    now = moment();
    return console.log("Starting campaign: " + event.campaign + " at " + (now.format('hh:mm:ss a')));
  };

}).call(this);
