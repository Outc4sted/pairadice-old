'use strict'

###*
   # @ngdoc overview
   # @name pairadiceApp
   # @description
   # # pairadiceApp
   #
   # Main module of the application.
###
angular
    .module('pairadiceApp', [
        'ngAnimate'
        'ngCookies'
        'ngSanitize'
        'ngTouch'
        'ui.router'
        'satellizer'
    ])
    .config(($stateProvider, $urlRouterProvider, $authProvider) ->
        $authProvider.facebook({clientId: '00000'})
        $authProvider.google({clientId: '00000'})
        $authProvider.twitter({url: '/auth/twitter'})

        $stateProvider
            .state 'index',
                url: ""
                templateUrl: 'views/main.html'
                controller: 'MainCtrl'

            .state 'login',
                url: "/login"
                templateUrl: 'views/login.html'
                controller: 'LoginCtrl'

            .state 'settings',
                url: "/settings"
                templateUrl: 'views/settings.html'
                controller: 'SettingsCtrl'

            .state 'highscores',
                url: "/highscores"
                templateUrl: 'views/highscores.html'
                controller: 'HighscoresCtrl'

            .state 'game',
                url: "/play"
                templateUrl: 'views/game.html'
                controller: 'GameCtrl'
                resolve:
                    game: (GameMaster) -> return GameMaster.init()

        $urlRouterProvider.otherwise('')
    )
