app = angular.module('app', ['ngSelect'])
app.controller 'mainCtrl', ['$scope', ($scope)->

  $scope.items = [
     {name : '2001'},
     { name : '2000'},
     {name : '1999'}
    ]

  $scope.selectedItem = $scope.items[1]
  $scope.$watch 'selectedItem', ->
    console.log $scope.selectedItem

  $scope.addNewItem = (content)->

]