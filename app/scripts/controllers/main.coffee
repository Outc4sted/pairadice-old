'use strict'

###*
 # @ngdoc function
 # @name pairadiceApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the pairadiceApp
###
angular.module('pairadiceApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
