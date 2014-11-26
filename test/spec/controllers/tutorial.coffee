'use strict'

describe 'Controller: TutorialCtrl', ->

  # load the controller's module
  beforeEach module 'pairadiceApp'

  TutorialCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TutorialCtrl = $controller 'TutorialCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
