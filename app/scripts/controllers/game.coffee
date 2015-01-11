'use strict'

###*
 # @ngdoc function
 # @name pairadiceApp.controller:GameCtrl
 # @description
 # # GameCtrl
 # Controller of the pairadiceApp
###
angular.module('pairadiceApp')
    .controller 'GameCtrl', ($scope, GameMaster, breeze) ->
        $scope.state = GameMaster

        $scope.startGame = ->
            $scope.state.gameFinished = false
            $scope.state.score  = 0
            $scope.state.rounds = 0

            for deathCard in $scope.state.deathBoard
                deathCard.num = null
                deathCard.notches = [false,false,false,false,
                                     false,false,false,false]
            for scoreCard in $scope.state.scoreBoard
                scoreCard.notches = [false,false,false,false,false,
                                     false,false,false,false,false]

            $scope.initRound()
            $scope.state.gameStarted = true

        $scope.initRound = ->
            $scope.state.rounds++
            $scope.state.roundFinished = false
            $scope.state.pairTotals.p1 = 0
            $scope.state.pairTotals.p2 = 0

            for dice in $scope.state.gameDice
                dice.pair = null
                dice.num  = _.random(1, 6)

        $scope.finalizeRound = ->
            return unless $scope.state.roundFinished

            deathDie      = _.findWhere $scope.state.gameDice, { pair: null }
            deathCards    = _.pluck $scope.state.deathBoard, 'num'
            gameDiceRolls = _.pluck $scope.state.gameDice,   'num'

            # Unless all 3 deathCard rows have been assigned, there's no limitation. If all rows exist, check if the deathDie matches any.
            # If it's not matched, it's still valid if none of the dice rolled this round can be matched either.
            rule1 = (_.compact deathCards).length isnt 3
            rule2 = _.contains(deathCards, deathDie.num)
            rule3 = (_.intersection deathCards, gameDiceRolls).length is 0

            discardRulesFollowed = rule1 or rule2 or rule3
            return unless discardRulesFollowed

            $scope.updateScoreBoard()
            $scope.state.gameFinished = $scope.updateDeathBoard()

            if $scope.state.gameFinished
                console.log 'Game over'
                # submitHighScores()
            else $scope.initRound()

        $scope.pairDice = (dice) ->
            return unless $scope.state.gameStarted

            if dice.pair
                $scope.state.pairTotals[dice.pair] -= dice.num
                dice.pair = null
                $scope.state.roundFinished = false

            else
                pairs = _.countBy $scope.state.gameDice, (d) -> return d.pair

                if not pairs.p1 or pairs.p1 < 2
                    dice.pair = 'p1'
                    $scope.state.pairTotals.p1 += dice.num
                    pairs.p1++

                else if not pairs.p2 or pairs.p2 < 2
                    dice.pair = 'p2'
                    $scope.state.pairTotals.p2 += dice.num
                    pairs.p2++

                $scope.state.roundFinished = pairs.p1 + pairs.p2 is 4

        $scope.updateScoreBoard = ->
            for scoreCard in $scope.state.scoreBoard when scoreCard.num is $scope.state.pairTotals.p1 or scoreCard.num is $scope.state.pairTotals.p2
                notchCount = _.indexOf scoreCard.notches, false
                scoreCard.notches[notchCount] = true

                if $scope.state.pairTotals.p1 is $scope.state.pairTotals.p2
                    scoreCard.notches[++notchCount] = true

            $scope.state.score = _.reduce $scope.state.scoreBoard, ((score, scoreCard) ->
                notchCount = _.indexOf scoreCard.notches, false

                return switch
                    when notchCount is -1 then score += 5 * scoreCard.points
                    when notchCount > 0 and notchCount < 5 then score -= 200
                    when notchCount > 5 then score += (notchCount - 5) * scoreCard.points
                    else score
            ), 0

        $scope.updateDeathBoard = ->
            deathDie  = _.findWhere $scope.state.gameDice,   { pair: null }
            emptySlot = _.findWhere $scope.state.deathBoard, { num:  null }
            deathCard = _.findWhere $scope.state.deathBoard, { num:  deathDie.num }

            if deathCard
                notchCount = _.indexOf deathCard.notches, false
                deathCard.notches[notchCount] = true
                return notchCount is 7

            else if emptySlot
                emptySlot.num = deathDie.num
                emptySlot.notches[0] = true

            return false
