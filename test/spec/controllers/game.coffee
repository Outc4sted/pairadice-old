'use strict'

describe 'Controller: GameCtrl', ->

  # load the controller's module
  beforeEach module 'pairadiceApp'

  GameCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    GameCtrl = $controller 'GameCtrl', {
      $scope: scope
    }

  # it 'should attach 3 death dice to the scope', ->
  #   expect(scope.deathDice.length).toBe 3
