# Description:
#   Simple greeting service
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot greeting - receive "Hello world"

module.exports = (robot) ->

  robot.hear /greeting/i, (msg) ->
    robot.http("https://service-bot.herokuapp.com/")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).greeting

