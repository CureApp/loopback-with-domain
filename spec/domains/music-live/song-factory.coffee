###
generated by base-domain generator
###


BaseFactory = require('base-domain').BaseFactory


###*
factory of song

@class SongFactory
@extends BaseFactory
###
class SongFactory extends BaseFactory

    ###*
    model name to create

    @property modelName
    @static
    @protected
    @type String
    ###
    @modelName: 'song'

module.exports = SongFactory
