# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  L.mapbox.accessToken = 'pk.eyJ1IjoibXVzaGE2OGsiLCJhIjoibWczVGdXUSJ9.J2JBHznWuMU4pg03wtzzJA';
  map = L.mapbox.map('map', 'musha68k.k9iphmm9').setView([45.52086, -122.679523], 14)
