#!/usr/bin/gjs
var Application, Gtk, Lang, app;

Lang = imports.lang;

Gtk = imports.gi.Gtk;

Application = new Lang.Class({
  Name: "Application",
  _init: function() {
    this.application = new Gtk.Application();
    this.application.connect("activate", Lang.bind(this, this._onActivate));
    return this.application.connect("startup", Lang.bind(this, this._onStartup));
  },
  _buildUI: function() {
    this._window = new Gtk.ApplicationWindow({
      application: this.application,
      title: "Hello World!"
    });
    this._window.set_default_size(200, 200);
    this.label = new Gtk.Label({
      label: "Hello World"
    });
    return this._window.add(this.label);
  },
  _onActivate: function() {
    return this._window.show_all();
  },
  _onStartup: function() {
    return this._buildUI();
  }
});

app = new Application();

app.application.run(ARGV);