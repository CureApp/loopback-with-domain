
{ normalize } = require 'path'
require('es6-promise').polyfill()

###*
launches loopback server

@class LoopbackServer
###
class LoopbackServer

    entryPath: normalize __dirname + '/../../loopback/server/server.js'

    launch: -> new Promise (resolve) =>
        return require(@entryPath).start resolve


module.exports = LoopbackServer
