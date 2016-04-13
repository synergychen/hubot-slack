# Description:
#   Omnifocus service
#
# Dependencies:
#   None
#
# Configuration:
#   - configure omni-email in heroku
#   - configure service bot token
#
# Commands:
#   hubot add task - receive status

module.exports = (robot) ->
  robot.hear /task (.*)/i, (msg) ->
    service_url = process.env.OMNIFOCUS_ADD_TASK_URL
    token = process.env.SERVICE_BOT_TOKEN

    result = msg.match[1].split(";")
    title = result[0].trim()
    note = (result[1] || "").trim()

    msg.http("#{service_url}?title=#{title}&note=#{note}")
      .headers(Authorization: "Token token=" + token)
      .get() (err, res, body) ->
        msg.send body
