'use strict'

###*
 # @ngdoc service
 # @name pairadiceApp.GameMaster
 # @description
 # # GameMaster
 # Service in the pairadiceApp.
###
angular.module('pairadiceApp')
    .service 'GameMaster', ($q) ->
        state =
            rounds: 0
            score:  0
            gameStarted:   false
            gameFinished:  false
            roundFinished: false
            gameDice:   []
            deathBoard: []
            scoreBoard: []
            pairTotals: { p1: 0, p2: 0 }

        createGameDice = ->
            dice =
                num:  null
                pair: null # null || 'p1' || 'p2'

            for i in [1..5]
                dice.num = i
                state.gameDice.push( _.clone(dice) )

        createDeathBoard = ->
            deathRow =
                num: null
                notches: [false,false,false,false,
                          false,false,false,false]

            state.deathBoard.push( $.extend(true, {}, deathRow) ) for i in [1..3]

        createScoreBoard = ->
            scoreRow =
                num: null
                points: null
                notches: [false,false,false,false,false,
                          false,false,false,false,false]

            for i in [2..12]
                scoreRow.num = i

                switch scoreRow.num                           # probabilities
                    when 2, 12 then scoreRow.points = 1000    #         2.78%
                    when 3, 11 then scoreRow.points = 500     #         5.56%
                    when 4, 10 then scoreRow.points = 350     #         8.33%
                    when 5, 9  then scoreRow.points = 250     #        11.11%
                    when 6, 8  then scoreRow.points = 200     #        13.89%
                    else scoreRow.points = 150                #        16.67%

                state.scoreBoard.push( $.extend(true, {}, scoreRow) )

        createGameDice()
        createDeathBoard()
        createScoreBoard()

        return state
