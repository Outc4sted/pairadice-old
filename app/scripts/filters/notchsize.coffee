'use strict'

###*
 # @ngdoc filter
 # @name pairadiceApp.filter:notchSize
 # @function
 # @description
 # # notchSize
 # Filter in the pairadiceApp.
###
angular.module('pairadiceApp')
    .filter 'notchSize', ->
        (num, index, notch) ->
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
