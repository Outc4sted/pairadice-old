'use strict'

###*
 # @ngdoc directive
 # @name pairadiceApp.directive:deathrow
 # @description
 # # deathrow
###
angular.module('pairadiceApp')
  .directive('deathrow', ->
    restrict: 'E'
    templateUrl: 'views/templates/deathrow.html'
    scope:
        dice: '='
  )
