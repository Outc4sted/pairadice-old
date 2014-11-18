'use strict'

describe 'Service: GameMaster', ->

  # load the service's module
  beforeEach module 'pairadiceApp'

  # instantiate service
  GameMaster = {}
  beforeEach inject (_GameMaster_) ->
    GameMaster = _GameMaster_

  it 'should do something', ->
    expect(!!GameMaster).toBe true
