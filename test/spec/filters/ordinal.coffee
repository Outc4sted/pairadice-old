'use strict'

describe 'Filter: ordinal', ->

  # load the filter's module
  beforeEach module 'pairadiceApp'

  # initialize a new instance of the filter before each test
  ordinal = {}
  beforeEach inject ($filter) ->
    ordinal = $filter 'ordinal'

  it 'should return the input prefixed with "ordinal filter:"', ->
    text = 'text'
    expect(ordinal text).not.toBe undefined
