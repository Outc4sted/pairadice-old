'use strict'

###*
 # @ngdoc function
 # @name pairadiceApp.controller:TutorialCtrl
 # @description
 # # TutorialCtrl
 # Controller of the pairadiceApp
###
angular.module('pairadiceApp')
  .controller 'TutorialCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
