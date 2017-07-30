function initMate(data, app_id, app_code) {
  /* Map initialization code starts below: */

  // Step 1: initialize communication with the platform
  var platform = new H.service.Platform({
    app_id: app_id,
    app_code: app_code,
    useHTTPS: true,
    useCIT: true
  });
  var defaultLayers = platform.createDefaultLayers();

  // Step 2: initialize a map
  var map = new H.Map(document.getElementById('map'), defaultLayers.normal.map, {
    center: new H.geo.Point(-33.895678, 150.600406),
    zoom: 10
  });

  // Step 3: make the map interactive
  // Behavior implements default interactions for pan/zoom (also on mobile touch environments)
  var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));

  // Step 4: create the default UI component, for displaying bubbles
  var ui = H.ui.UI.createDefault(map, defaultLayers);
  

  startClustering(map, ui, getBubbleContent, data);
  //addPolylineToMap(map, polyData);
}
