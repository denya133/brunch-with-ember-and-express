sysPath = require 'path'
fs = require 'fs'
DIR_SEP = sysPath.sep

objectify = ->
  o = {}
  for k, i in arguments by 2
    o[k] = arguments[i + 1]
  o


#TODO: find a method to do this in a cleaner way
gitHead = -> fs.readFileSync(sysPath.join('.git', 'HEAD')).toString().replace(/^\s*ref\:\s*/g, '').replace(/\s*$/g, '')
gitBranch = ->
  head = gitHead().split /\//g
  branch = head.slice()
  branch.shift()
  branch.shift()
  branch.join '/'
gitCommitHash = -> fs.readFileSync(sysPath.join('.git',
  gitHead().split(/\//g).join(DIR_SEP))).toString().replace(/^\s*/g, '').replace(/\s*$/g, '')

exports.config =
# See http://brunch.io/#documentation for documentation.
  files:
    javascripts:
      joinTo: objectify(
        "javascripts#{DIR_SEP}app.js", (path) -> /^app/.test(path) and not /\.prod\./.test(path)
        "javascripts#{DIR_SEP}vendor.js", (path) -> /^vendor/.test(path) and not /\.prod\./.test(path)
        "test#{DIR_SEP}javascripts#{DIR_SEP}test-vendor.js", /^test(\/|\\)(?=vendor)/
      )

      order: jsOrder =
        before: [
          "vendor#{DIR_SEP}scripts#{DIR_SEP}console-polyfill.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}jquery-1.9.1.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}handlebars-1.0.0.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}ember.dev.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}ember.prod.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}ember-data.dev.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}ember-data.prod.js"
          "vendor#{DIR_SEP}scripts#{DIR_SEP}bootstrap#{DIR_SEP}tooltip.js"
        ]
        after: [
          "vendor#{DIR_SEP}scripts#{DIR_SEP}ember-bootstrap.js"
        ]

    stylesheets:
      joinTo: objectify(
        "stylesheets#{DIR_SEP}app.css", (path) ->
          # we need to exclude bootstrap files since they're included in the application.styl
          /^(app|vendor)/.test(path) and not /^vendor(\/|\\)styles(\/|\\)(bootstrap|font\-awesome)(\/|\\)/.test(path)
      )
      order:
        before: [
          "vendor#{DIR_SEP}styles#{DIR_SEP}normalize.css"
        ]

      modules:
        addSourceURLs: true

    templates:
    # for smaller builds, disable the pre-compilation of tempaltes
      precompile: true
      root: 'templates'
      joinTo: objectify(
        "javascripts#{DIR_SEP}app.js", /^app/
      )

# CoffeeScript easy-debugging
  sourceMaps: true

# keyword-brunch plugin
  keyword:
    map:
      git_commit_hash: gitCommitHash
      git_short_commit_hash: -> gitCommitHash().substr 0, 7
      git_branch: gitBranch


  overrides:
    production:
      optimize: yes
      sourceMaps: no
      files:
        javascripts:
          joinTo: objectify(
            "javascripts#{DIR_SEP}app.js", (path) -> /^app/.test(path) and not /\.dev\./.test(path)
            "javascripts#{DIR_SEP}vendor.js", (path) -> /^vendor/.test(path) and not /\.dev\./.test(path)
          )
          order: jsOrder
      plugins:
        autoreload:
          enabled: no


# allow _ prefixed templates so partials work
  conventions:
    ignored: (path) ->
      startsWith = (string, substring) ->
        string.indexOf(substring, 0) is 0
      if path.indexOf("app#{DIR_SEP}templates#{DIR_SEP}") is 0
        no
      else
        startsWith sysPath.basename(path), '_'
