WebSocket = require 'ws'
{exec} = require 'child_process'

ws = new WebSocket 'wss://ws.blockchain.info/inv'

ws.on 'open', (ev) ->
  ws.send '{"op":"unconfirmed_sub"}'

ws.on 'message', (data) ->
  d = JSON.parse data
  console.log d.x
  exec('say ' + d.x.out[0].value)

