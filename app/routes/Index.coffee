App = require 'app'


###*
  Route IndexRoute

  @class IndexRoute
  @namespace App
  @extends Ember.Route
###
module.exports = App.IndexRoute = Ember.Route.extend
  ###*
    Our model, just some info message as of example and all the font awesome icons

    @inheritDoc
  ###
  model: (params) ->
    infoMessage: """
      Compiled on branch #{App.CONFIG.compilation.gitBranch}
      at #{App.CONFIG.compilation.date.toTimeString()}
      on #{App.CONFIG.compilation.date.toDateString()}
      """
    iconNames: Ember.A(App.BsIconComponent.NAMES)
