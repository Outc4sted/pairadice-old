'use strict'

describe 'Controller: Game2Ctrl', ->

  # load the controller's module
  beforeEach module 'pairadiceApp'

  Game2Ctrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    Game2Ctrl = $controller 'Game2Ctrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings).toBe undefined
