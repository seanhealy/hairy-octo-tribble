angularModules = [

]

@APP = angular.module('matersApp', angularModules)

@AppController = ($scope) ->
    $scope.hideClosed = no

@MatterListController = ($scope) ->
    $scope.matters = _seedData