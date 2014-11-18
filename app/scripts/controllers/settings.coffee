'use strict'

###*
 # @ngdoc function
 # @name pairadiceApp.controller:SettingsCtrl
 # @description
 # # SettingsCtrl
 # Controller of the pairadiceApp
###
angular.module('pairadiceApp')
  .controller 'SettingsCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
