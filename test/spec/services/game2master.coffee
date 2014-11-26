'use strict'

describe 'Service: Game2Master', ->

  # load the service's module
  beforeEach module 'pairadiceApp'

  # instantiate service
  Game2Master = {}
  beforeEach inject (_Game2Master_) ->
    Game2Master = _Game2Master_

  it 'should do something', ->
    expect(!!Game2Master).toBe true
