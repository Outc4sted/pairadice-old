'use strict'

###*
 # @ngdoc filter
 # @name pairadiceApp.filter:ordinal
 # @function
 # @description
 # # ordinal
 # Filter in the pairadiceApp.
###
angular.module('pairadiceApp')
    .filter 'ordinal', ->
        (num) ->
            if num? and parseFloat(num) is parseInt(num)
                s = ["th","st","nd","rd"]
                v = num % 100;

                return num + ( s[(v-20)%10] || s[v] || s[0] )
            else return num
