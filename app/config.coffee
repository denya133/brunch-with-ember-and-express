App = require 'app'

# linkTo and action handlebars helpers are looked up if not quoted
Ember.ENV.HELPER_PARAM_LOOKUPS = yes

###*
  Some configuration

  @namespace App
  @property CONFIG
  @type Object
  @final
###
module.exports = App.CONFIG =
  ###*
    Some compilation information (look in /config.coffee for more
    information about the keyword plugin configuration)

    @property compilation
    @type Object
    @final
  ###
  compilation:
    ###*
      Will be replaced with the name of the git current branch
      @property gitBranch
      @type String
      @final
    ###
    gitBranch: '{!git_branch!}'
    ###*
      Will be replaced with the hash of the last git commit
      @property gitCommitHash
      @type String
      @final
    ###
    gitCommitHash: '{!git_commit_hash!}'
    ###*
      Will be replaced with the small version of the hash of the last git commit
      @property gitShortCommitHash
      @type String
      @final
    ###
    gitShortCommitHash: '{!git_short_commit_hash!}'
    ###*
      Will be replaced with the compilation date and time
      @property date
      @type Date
      @final
    ###
    date: new Date('{!date!}')
