'use strict'

###*
 # @ngdoc function
 # @name pairadiceApp.controller:Game2Ctrl
 # @description
 # # Game2Ctrl
 # Controller of the pairadiceApp
###
angular.module('pairadiceApp')
    .controller 'Game2Ctrl', ($scope, Game2Master) ->
        $scope.playerCount = 2
        $scope.gameDice = []
        $scope.rounds   = 0
        $scope.score    = 0

        $scope.gameStarted   = false
        $scope.roundFinished = false
        $scope.gameFinished  = false
        $scope.activePlayer  = null

        $scope.toggleDice = (dice, blankDice) ->
            return if blankDice or $scope.gameStarted
            dice.selected = !dice.selected
            dice.inHand   = dice.selected

        $scope.initRound = ->
            $scope.rounds++
            $scope.roundFinished = false
            (dice.num = _.random(1, 6)) for dice in $scope.gameDice

        $scope.nextPlayerTurn = ->
            # $scope.activePlayer =

        $scope.roll = -> (dice.num = _.random(1, 6)) for dice in $scope.gameDice when not dice.inHand


        $scope.finalizeHand = ->
        $scope.bankScore = ->

        $scope.startGame = ->
            $scope.gameFinished = false
            $scope.score  = 0
            $scope.rounds = 0

            $scope.players = Game2Master.createPlayers $scope.playerCount
            dice.inHand = false for dice in $scope.gameDice

            $scope.initRound()
            $scope.activePlayer = $scope.players[0]
            $scope.gameStarted  = true

        $scope.scoreProgress = (player, roundProgress) ->
            if roundProgress
                return if $scope.score is 0 then '0%' else $scope.score/100+'%'
            return if player.score is 0 then '35%' else player.score/100+'%' #devLogic - 35%

        $scope.rollPermission = ->
            return true

        if not Game2Master.isInit()
            Game2Master.init()
            $scope.gameDice = Game2Master.getGameDice()
            # $scope.startGame() #devLogic - delete
