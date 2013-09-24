Lang = imports.lang
Gtk = imports.gi.Gtk
Application = new Lang.Class(

  #A Class requires an explicit Name parameter. This is the Class Name.
  Name: "Application"

  #create the application
  _init: ->
    @application = new Gtk.Application()

    #connect to 'activate' and 'startup' signals to handlers.
    @application.connect "activate", Lang.bind(this, @_onActivate)
    @application.connect "startup", Lang.bind(this, @_onStartup)


  #create the UI
  _buildUI: ->
    @_window = new Gtk.ApplicationWindow(
      application: @application
      title: "Hello World!"
    )
    @_window.set_default_size 200, 200
    @label = new Gtk.Label(label: "Hello World")
    @_window.add @label


  #handler for 'activate' signal
  _onActivate: ->

    #show the window and all child widgets
    @_window.show_all()


  #handler for 'startup' signal
  _onStartup: ->
    @_buildUI()
)

#run the application
app = new Application()
app.application.run ARGV