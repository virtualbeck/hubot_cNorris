# Description: Chuck Norris test API
#
# Command:
#   chuck norris
#

request = require('request')
options =
  method: 'GET'
  url: 'http://api.icndb.com/jokes/random'
  qs: limitTo: '[nerdy]'

module.exports = (robot) ->
  robot.hear /chuck norris/ig, (msg) ->
    #msg.send

    request options, (error, response, body) ->
      if error
        msg.send error.message
      #if response
        #console.log response
        #msg.send "#{response.statusCode}"
      if body
        jsonBody = JSON.parse body
        #console.log jsonBody.type
        if jsonBody.type == 'success'
          msg.send jsonBody.value.joke
          #msg.send "Category: #{jsonBody.value.categories.join(', ')}"
