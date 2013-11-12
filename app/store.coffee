App = require 'app'

###
# Remove this return to enable a store with a REST adapter on your app
# if you're migrating, https://github.com/emberjs/data/blob/master/TRANSITION.md is a good help
###
return

###*
  The application adapter

  @class ApplicationAdapter
  @namespace App
  @extends DS.RESTAdapter
###
App.ApplicationAdapter = DS.RESTAdapter.extend
  ###*
    Put the host of your API here

    @inheritDoc
  ###
  host: 'http://www.google.com'
  ###*
    Put the path/namespace of your API here

    @inheritDoc
  ###
  namespace: 'api/v1'


###*
  If you need to customize the serializer for any reason, here is where it should go:

  @class ApplicationSerializer
  @namespace App
  @extends DS.RESTSerializer
###
App.ApplicationSerializer = DS.RESTSerializer.extend
  # youre code here
