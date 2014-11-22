# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

  L.mapbox.accessToken = 'pk.eyJ1IjoibXVzaGE2OGsiLCJhIjoibWczVGdXUSJ9.J2JBHznWuMU4pg03wtzzJA';
  map     = L.mapbox.map('map', 'musha68k.k9iphmm9').setView([47.713, 13.345], 7)
  lameMap = L.mapbox.featureLayer().addTo(map)

#  lameMap.on 'addlayer', (e) ->
#    marker = e.layer
#    properties = marker.feature.properties
#
#    popupContent =  '<div class="popup">' +
#      '<h3>' + properties.name + '</h3>' +
##      '<p>' + properties.address + '</p>' +
#      '</div>'
#
#    marker.bindPopup popupContent,
#      closeButton: false
#      minWidth: 320

  $.ajax
    dataType: 'text'
    url: '/messages.json'
    success: (data) ->
      geo = $.parseJSON(data)
      fl = map.featureLayer.setGeoJSON(geo)
      console.log fl

