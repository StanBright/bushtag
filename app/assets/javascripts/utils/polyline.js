function addPolylineToMap(map, polyData) {
  var polyId = 0;
  var strip = new H.geo.Strip();
  
  for (var i = 0; i <= polyData.length; i++) {
    if (polyId == polyData[i].shapeid) {
      strip.push({
        lat: polyData[i].lat,
        lng: polyData[i].lng
      })
    } else {
      map.addObject(new H.map.Polyline(
        strip, { style: { lineWidth: 4 }}
      ));
      
      strip = new H.geo.Strip();
      polyId = polyData[i].shapeid;
    }
  }
}
