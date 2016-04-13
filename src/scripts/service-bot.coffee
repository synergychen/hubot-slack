# Description:
#   Get service-bot token
#
# Dependencies:
#   - set heroku token url
#
# Configuration:
#
# Commands:
#   token <username>:<password> - return token

module.exports = (robot) ->
  robot.hear /token (.*)/i, (msg) ->
    token_url = process.env.SERVICE_BOT_TOKEN_URL
    user_and_pass = msg.match[1]
    auth = 'Basic ' + new Buffer(user_and_pass).toString('base64');

    msg.http(token_url)
      .headers(Authorization: auth, Accept: 'application/json')
      .get() (err, res, body) ->
          msg.send body
