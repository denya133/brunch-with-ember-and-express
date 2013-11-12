App = require 'app'

###*
  Component BsIconComponent to insert bound font awesome icons
  Example:
  ```handlebars
  {{bs-icon name="user" type="info"}}

  @class BsIconComponent
  @namespace App
  @extends Ember.Component
###
module.exports = App.BsIconComponent = Ember.Component.extend Bootstrap.TypeSupport,
  ###*
    Our tag name is an <i> element

    @inheritDoc
  ###
  tagName: 'i'
  ###*
    We bind the icon name and some other options depending on the css class

    @inheritDoc
  ###
  classNameBindings: [
    'iconClass'
    'border:icon-border'
    'flipHorizontal:icon-flip-horizontal'
    'flipVertical:icon-flip-vertical'
    'spin:icon-spin'
  ]
  ###*
    The base class name for {Bootstrap.TypeSupport}

    @property baseClassName
    @type String
  ###
  baseClassName: 'text'
  ###*
    Set this to true and the icon will be rotating

    @property spin
    @type Boolean
  ###
  spin: no
  ###*
    Should the icon have a border?

    @property border
    @type Boolean
  ###
  border: no
  ###*
    Set this to true and the icon will be filpped horizontally

    @property flipHorizontal
    @type Boolean
  ###
  flipHorizontal: no
  ###*
    Set this to true and the icon will be flipped vertically

    @property flipVertical
    @type Boolean
  ###
  flipVertical: no
  ###*
    Name of the icon based on the name given in context

    @property iconClass
    @type String
  ###
  iconClass: (() ->
    "icon-#{@get 'name'}"
  ).property('name')


App.BsIconComponent.reopenClass
  ###*
    All the possible icon names

    @property NAMES
    @type Array
    @static
    @final
  ###
  NAMES: ['glass','music','search','envelope','heart','star','star-empty','user','film','th-large','th','th-list','ok','remove','zoom-in','zoom-out','off','signal','cog','trash','home','file','time','road','download-alt','download','upload','inbox','play-circle','repeat','rotate-right','refresh','list-alt','lock','flag','headphones','volume-off','volume-down','volume-up','qrcode','barcode','tag','tags','book','bookmark','print','camera','font','bold','italic','text-height','text-width','align-left','align-center','align-right','align-justify','list','indent-left','indent-right','facetime-video','picture','pencil','map-marker','adjust','tint','edit','share','check','move','step-backward','fast-backward','backward','play','pause','stop','forward','fast-forward','step-forward','eject','chevron-left','chevron-right','plus-sign','minus-sign','remove-sign','ok-sign','question-sign','info-sign','screenshot','remove-circle','ok-circle','ban-circle','arrow-left','arrow-right','arrow-up','arrow-down','share-alt','mail-forward','resize-full','resize-small','plus','minus','asterisk','exclamation-sign','gift','leaf','fire','eye-open','eye-close','warning-sign','plane','calendar','random','comment','magnet','chevron-up','chevron-down','retweet','shopping-cart','folder-close','folder-open','resize-vertical','resize-horizontal','bar-chart','twitter-sign','facebook-sign','camera-retro','key','cogs','comments','thumbs-up','thumbs-down','star-half','heart-empty','signout','linkedin-sign','pushpin','external-link','signin','trophy','github-sign','upload-alt','lemon','phone','check-empty','bookmark-empty','phone-sign','twitter','facebook','github','unlock','credit-card','rss','hdd','bullhorn','bell','certificate','hand-right','hand-left','hand-up','hand-down','circle-arrow-left','circle-arrow-right','circle-arrow-up','circle-arrow-down','globe','wrench','tasks','filter','briefcase','fullscreen','group','link','cloud','beaker','cut','copy','paper-clip','save','sign-blank','reorder','list-ul','list-ol','strikethrough','underline','table','magic','truck','pinterest','pinterest-sign','google-plus-sign','google-plus','money','caret-down','caret-up','caret-left','caret-right','columns','sort','sort-down','sort-up','envelope-alt','linkedin','undo','rotate-left','legal','dashboard','comment-alt','comments-alt','bolt','sitemap','umbrella','paste','lightbulb','exchange','cloud-download','cloud-upload','user-md','stethoscope','suitcase','bell-alt','coffee','food','file-alt','building','hospital','ambulance','medkit','fighter-jet','beer','h-sign','plus-sign-alt','double-angle-left','double-angle-right','double-angle-up','double-angle-down','angle-left','angle-right','angle-up','angle-down','desktop','laptop','tablet','mobile-phone','circle-blank','quote-left','quote-right','spinner','circle','reply','mail-reply','folder-close-alt','folder-open-alt','expand-alt','collapse-alt','smile','frown','meh','gamepad','keyboard','flag-alt','flag-checkered','terminal','code','reply-all','mail-reply-all','star-half-empty','location-arrow','crop','code-fork','unlink','question','info','exclamation','superscript','subscript','eraser','puzzle-piece','microphone','microphone-off','shield','calendar-empty','fire-extinguisher','rocket','maxcdn','chevron-sign-left','chevron-sign-right','chevron-sign-up','chevron-sign-down','html5','css3','anchor','unlock-alt','bullseye','ellipsis-horizontal','ellipsis-vertical','rss-sign','play-sign','ticket','minus-sign-alt','check-minus','level-up','level-down','check-sign','edit-sign','external-link-sign','share-sign'].sort()
