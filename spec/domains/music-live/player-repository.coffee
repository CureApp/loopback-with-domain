###
generated by base-domain generator
###


BaseRepository = require('base-domain').BaseRepository

###*
repository of player

@class PlayerRepository
@extends BaseRepository
###
class PlayerRepository extends BaseRepository

    ###*
    model name to create

    @property modelName
    @static
    @protected
    @type String
    ###
    @modelName: 'player'

module.exports = PlayerRepository
