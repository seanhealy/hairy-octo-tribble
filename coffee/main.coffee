angularModules = [

]

@APP = angular.module('matersApp', angularModules)

@AppController = ($scope) ->
    $scope.hideClosed = no

    $scope.stateFilter = ''
    $scope.clientFilterText = ''
    $scope.keywordFilterText = ''

    $scope.$watch 'hideClosed', (value) ->
        if value is true
            $scope.stateFilter = 'open'
        else
            $scope.stateFilter = ''

@MatterListController = ($scope) ->
    $scope.matters = _seedData