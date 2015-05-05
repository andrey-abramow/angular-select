angular.module('ngSelect',['ngSanitize']).directive 'selector',[ ->
  restrict : 'E'
  templateUrl : 'selector.html'
  scope :
    values : '='
    model : '='
    modelValue : '@'
    maxItems : '@'
  link: (scope) ->

    document.getElementsByTagName('body')[0].addEventListener 'click', ->
        scope.focus = false
        scope.$apply()

    scope.selectedItem = scope.model[scope.modelValue]
    scope.itemSelected = true

    scope.$watch 'selectedItem', ->
      scope.properItems = []
      if scope.itemSelected
        scope.itemSelected = false
        return
      setProperItems(scope.values, scope.properItems, scope.modelValue, scope.selectedItem, 2)

    setProperItems = (from, to, matchedValue,  match, count)->
      checkEmptyValue(from, to, match, count)
      createItems(from, to, matchedValue,  match, count)


    createItems = (from, to, matchedValue,  match, count)->
      for itemOriginal, index in from
        item  = {}
        item.index = index
        item[matchedValue] = itemOriginal[matchedValue]
        if item[matchedValue].indexOf(match) > -1
          return if to.length == count
          item[matchedValue] = item[matchedValue].replaceAll(match, "<span class='red'>#{match}</span>")
          to.push item


    checkEmptyValue = (from, to, match, count)->
      if match == ''
        for item, index in from
          return if to.length == count
          item.index = index
          to.push item


    scope.setItem = (item)->
      scope.itemSelected = true
      scope.selectedItem = scope.values[item.index][scope.modelValue]
      scope.model = scope.values[item.index]
      scope.properItems = null
]


