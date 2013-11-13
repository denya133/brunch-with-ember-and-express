* __0.5.0__
    * Merged brunch skeletons: brunch-with-ember-and-bootstrap and ExpressBrunchJade

* __0.4.2-1__
    * Fixed wrong data in the `yuidoc.json` file

* __0.4.2__
    * Updated the README to reflect all changes
    * Added a cake task to generate API docs with YUI doc generator
    * Added Font Awesome and a `bs-icon` component for it
    * Added a cake task to update Font Awesome sources
    * Updated the index template to show some more stuff by default
    * Fixed the `update-ember` and `update-ember-data` cake tasks, now they work with the -c or --channel option
    * Updated the `index.html` in the assets to reflect updated plugins
    * Fixed some typo in the config
    * Added a cake command to get the Ember Date library

* __0.4.1__
    * Adding `cake build` and `cake clean`. The build script is cleaning up everything, using production vendor files, and packing the public folder in a tgz file ready to send on server and deploy
    * Now scaffolding (using generators) will automatically add the corresponding `require` call(s) to each type initializer
    * Added missing documentation blocks in existing files
    * Each generator is now coming with some documentation blocks
    * The application view's element (container of all app) now has css classes depending on the name of all current resource(s) and the current route to help page dependent design.

* __0.4.0__
    * Upgraded to Twitter Bootstrap 3 and added a cake task to upgrade
    * Upgraded Ember Bootstrap library to the latest version
    * Upgraded to Ember 1 and Ember Data 1 beta 2
    * Updated the config files and Cakefile so that production and development build process use different source files

* __0.3.0__
    * Updated the README
    * Added support for Ember Bootstrap

* __0.2.2__
    * Updated the README
    * Fixed some file names

* __0.2.1__
    * Fixing the package.json for npm registry publication

* __0.2.0__
    * First version released
