'use strict'

###*
 # @ngdoc function
 # @name pairadiceApp.controller:HighscoresCtrl
 # @description
 # # HighscoresCtrl
 # Controller of the pairadiceApp
###
angular.module('pairadiceApp')
  .controller 'HighscoresCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
