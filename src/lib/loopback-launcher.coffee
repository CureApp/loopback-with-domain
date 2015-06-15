
{ normalize } = require 'path'
Promise = require('es6-promise').Promise

class LoopbackLauncher

    entryPath: normalize __dirname + '/../../loopback/server/server.js'

    constructor: (@options = {}) ->


    launch: -> new Promise (resolve, reject) =>

        @lbProcess = require('child_process').spawn 'node', [@entryPath]
        @lbProcess.stdout.setEncoding 'utf8'
        @lbProcess.stderr.pipe process.stderr

        @rejectOnFailure(reject)
        @rejectOnTimeout(reject)
        @resolveOnStarted(resolve)



    rejectOnFailure: (reject) ->

        @lbProcess.on 'exit', (code) ->
            reject new Error "process exit with error code #{code}"

        @lbProcess.on 'error', (e) =>
            @lbProcess.kill()
            reject new Error e


    rejectOnTimeout: (reject) ->

        @timer = setTimeout =>
            @lbProcess.kill()
            reject new Error('timeout after 30sec')
        , 30 * 1000


    removeListeners: ->

        clearTimeout @timer
        @lbProcess.removeAllListeners()
        @lbProcess.stdout.removeAllListeners()


    resolveOnStarted: (resolve) ->

        prevChunk = ''

        @lbProcess.stdout.on 'data', (chunk) =>
            data = prevChunk + chunk

            if data.match('LOOPBACK_WITH_DOMAIN_STARTED')
                @removeListeners()
                resolve(@lbProcess)

            prevChunk = chunk


module.exports = LoopbackLauncher
