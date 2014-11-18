'use strict'

describe 'Directive: deathrow', ->

  # load the directive's module
  beforeEach module 'pairadiceApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<deathrow></deathrow>'
    element = $compile(element) scope
    expect(element).not.toBe undefined
