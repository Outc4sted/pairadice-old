'use strict'

###*
 # @ngdoc service
 # @name pairadiceApp.Game2Master
 # @description
 # # Game2Master
 # Service in the pairadiceApp.
###
angular.module('pairadiceApp')
    .service 'Game2Master', ->
        isInit   = false
        gameDice = []
        players  = []

        createGameDice = ->
            dice =
                num:    null
                inHand: false

            for i in [1..5]
                dice.num = i
                gameDice.push( _.clone(dice) )

            return gameDice

        createPlayers = (count) ->
            player =
                name:   null
                score:  0
                rounds: 0

            for i in [1..count]
                player.name = 'Player ' + i
                players.push( _.clone(player) )

            players[0].startsRound = true
            return players

        init = ->
            createGameDice()
            isInit = true

        return {
            init: init
            createPlayers: createPlayers
            isInit:      -> return isInit
            getGameDice: -> return gameDice
        }
