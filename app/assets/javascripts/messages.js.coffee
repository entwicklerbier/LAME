$(document).ready ->

  L.mapbox.accessToken = 'pk.eyJ1IjoibXVzaGE2OGsiLCJhIjoibWczVGdXUSJ9.J2JBHznWuMU4pg03wtzzJA';
  map     = L.mapbox.map('map', 'musha68k.k9iphmm9').setView([47.713, 13.345], 7)
  lameMap = L.mapbox.featureLayer().addTo(map)

  addMarker = (lat, lng) ->
    $.ajax
      type: 'POST'
      dataType: 'text'
      url: '/messages.json'
      data: { message: { lonlat: "POINT(#{lat} #{lng})" } }
      success: (success) ->
        console.log success
        marker = L.marker([lat, lng])
                  .addTo(map)
#                  .bindPopup('<div contenteditable="true"></div>')
                  .openPopup()

  map.on 'click', (e) ->
    addMarker(e.latlng.lat, e.latlng.lng)

  lameMap.on 'mouseover', (e) ->
    e.layer.openPopup()

  $.ajax
    dataType: 'text'
    url: '/messages.json'
    success: (data) ->
      geo = $.parseJSON(data)
      fl = lameMap.setGeoJSON(geo)
      console.log fl

