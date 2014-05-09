angularModules = [
    'ui.bootstrap'
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

    $scope.state =
        activeMatter: null


@MatterListController = ($scope) ->
    $scope.clients = _seedData
    $scope.selectAll = no

    $scope.closeMatter = (matter, $event) ->
        $event.stopPropagation()
        matter.status = 'closed'

    $scope.openMatter = (matter, $event) ->
        $event.stopPropagation()
        matter.status = 'open'

    $scope.deleteMatter = (matter, $event) ->
        $event.stopPropagation()
        for client in $scope.clients
            client.matters.remove {id: matter.id}

    $scope.$watch 'selectAll', (value) ->
        setSelectAllState value

    setSelectAllState = (state) ->
        for client in $scope.clients
            for matter in client.matters
                matter.selected = state
