'use strict'

###*
 # @ngdoc function
 # @name pairadiceApp.controller:GameCtrl
 # @description
 # # GameCtrl
 # Controller of the pairadiceApp
###
angular.module('pairadiceApp')
    .controller 'GameCtrl', ($scope, game) ->
        $scope.gameDice   = game.gameDice
        $scope.deathBoard = game.deathBoard
        $scope.scoreBoard = game.scoreBoard

        $scope.rounds = 0
        $scope.score  = 0
        $scope.gameStarted   = false
        $scope.roundFinished = false
        $scope.pairTotals    = { p1: 0, p2: 0 }

        $scope.startGame = ->
            $scope.gameStarted = true
            $scope.initRound()

        $scope.pairDice = (dice) ->
            return unless $scope.gameStarted

            if dice.pair
                $scope.pairTotals[dice.pair] -= dice.num
                dice.pair = null
                $scope.roundFinished = false

            else
                pairs = _.countBy $scope.gameDice, (d) -> return d.pair

                if not pairs.p1 or pairs.p1 < 2
                    dice.pair = 'p1'
                    $scope.pairTotals.p1 += dice.num
                else if not pairs.p2 or pairs.p2 < 2
                    dice.pair = 'p2'
                    $scope.pairTotals.p2 += dice.num

                $scope.roundFinished = pairs.p1 + pairs.p2 is 3

        $scope.updateScoreBoard = ->
            for scoreCard in $scope.scoreBoard when scoreCard.num is $scope.pairTotals.p1 or scoreCard.num is $scope.pairTotals.p2
                notchCount = _.indexOf scoreCard.notches, false
                scoreCard.notches[notchCount] = true

                if $scope.pairTotals.p1 is $scope.pairTotals.p2
                    scoreCard.notches[++notchCount] = true

            score = 0
            for scoreCard in $scope.scoreBoard
                notchCount = _.indexOf scoreCard.notches, false

                if notchCount is -1
                    score += 5 * scoreCard.points
                if notchCount > 0 and notchCount < 5
                    score -= 200
                else if notchCount > 5
                    score += (notchCount - 5) * scoreCard.points

            $scope.score = score

        $scope.updateDeathBoard = ->
            deathDice = _.findWhere $scope.gameDice,   { pair: null }
            emptySlot = _.findWhere $scope.deathBoard, { num:  null }
            deathCard = _.findWhere $scope.deathBoard, { num:  deathDice.num }

            if deathCard
                notchCount = _.indexOf deathCard.notches, false
                deathCard.notches[notchCount] = true
                return notchCount is 7

            else if emptySlot
                emptySlot.num = deathDice.num
                emptySlot.notches[0] = true

            return false

        $scope.initRound = ->
            $scope.roundFinished = false
            $scope.rounds++
            $scope.pairTotals.p1 = 0
            $scope.pairTotals.p2 = 0
            dice.pair = null for dice in $scope.gameDice
            (dice.num = _.random(1, 6)) for dice in $scope.gameDice

        $scope.finalizeRound = ->
            return unless $scope.roundFinished

            $scope.updateScoreBoard()
            gameover = $scope.updateDeathBoard()

            if gameover
                console.log 'Game over'
                # submitHighScores()
            else $scope.initRound()

        $scope.notchSize = (num, index, notch) ->
            return unless num or index

            if index < 4
                notchClass = 'notch-single'
                if notch
                    notchClass += ' sm-active'

            else if index is 4
                notchClass = 'notch-0'
                if notch
                    notchClass += ' z-active'

            else
                notchClass = 'notch-' + num
                if notch
                    notchClass += ' lg-active'

            return notchClass

        $scope.trackNotch = (num, index) -> return "#{num}#{index}"