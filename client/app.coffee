MainView = Backbone.View.extend
  id: 'main-view'
  className: 'container'
  
  events:
    'click em': 'loadTime'
    
  initialize: ->
    Meteor.call 'server-time', (err, time) ->
      Session.set 'time', time
  
  render: ->
    @$el.html Meteor.ui.render ->
      "<h1>App loaded at <em>#{Session.get('time')}</em>"
    
    this
    
  loadTime: (e) ->
    Meteor.call 'server-time', (err, time) ->
      Session.set 'time', time




AppRouter = Backbone.Router.extend
  routes:
    "": "main"

  main:  ->
    $('body').append (new MainView).render().el

Router = new AppRouter
Meteor.startup ->  
  Backbone.history.start pushState: true  