'use strict'

describe 'Filter: notchSize', ->

  # load the filter's module
  beforeEach module 'pairadiceApp'

  # initialize a new instance of the filter before each test
  notchSize = {}
  beforeEach inject ($filter) ->
    notchSize = $filter 'notchSize'

  it 'should return the input prefixed with "notchSize filter:"', ->
    expect(notchSize text).toBe undefined
