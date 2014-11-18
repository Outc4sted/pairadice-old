'use strict'

describe 'Controller: HighscoresCtrl', ->

  # load the controller's module
  beforeEach module 'pairadiceApp'

  HighscoresCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    HighscoresCtrl = $controller 'HighscoresCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
