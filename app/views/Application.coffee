App = require 'app'

###*
  `ApplicationView` is the main view, understand the bottom layer,
  container of all the applicaiton

  @class ApplicationView
  @namespace App
  @extends Ember.View
###
module.exports = App.ApplicationView = Ember.View.extend
  ###*
    The current path is used to set an attribute in the base application view: `data-path`
    This can be useful in some cases

    @property attributeBindings
    @type Array
  ###
  attributeBindings: ['currentPath:data-path']

  ###*
    Our composed `routeClasses` property is binded to css classes here

    @see {App.ApplicationView#routeClasses}
    @property classNameBindings
    @type Array
  ###
  classNameBindings: ['routeClasses']

  ###*
    Get the current path from our controller which is `ApplicationController`

    @property currentPath
    @type String
  ###
  currentPath: ''
  currentPathBinding: Em.Binding.oneWay 'controller.currentPath'

  ###*
    Returns the classes depending on the current path in the router. For example if we're in path
    `users.user.profile.show` the classes added to the application view would be:
    `resource-users resource-user resource-profile route-show`.
    Note that the last one which is always a route is prepended with `route-` instead of `resource-`.

    This allow you to customize any part of your application depending on the current resource,
    sub-resource and/or even route.

    @property routeClasses
    @type String
  ###
  routeClasses: (() ->
    currentPath = @get 'currentPath'
    resources = currentPath?.split(/\./g) ? []
    route = resources.pop()
    classes = ("resource-#{cl}" for cl in resources)
    classes.push("route-#{route}") if route
    classes.join ' '
  ).property('currentPath').readOnly()

