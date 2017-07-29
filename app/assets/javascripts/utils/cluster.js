function startClustering(map, ui, getBubbleContent, data) {
  // First create an array of DataPoint objects for the ClusterProvider
  var dataPoints = data.map(function (item) {
    return new H.clustering.DataPoint(item.latitude, item.longitude, null, item);
  });

  // Create a clustering provider with custom options for clusterizing the input
  var clusteredDataProvider = new H.clustering.Provider(dataPoints, {
    clusteringOptions: {
      eps: 32, // Maximum radius of the neighbourhood
      minWeight: 2 // minimum weight of points required to form a cluster
    }
  });
  
  clusteredDataProvider.addEventListener('tap', function(e){
    onMarkerClick(e, map, ui);
  });

  // Create a layer tha will consume objects from our clustering provider
  var clusteringLayer = new H.map.layer.ObjectLayer(clusteredDataProvider);

  // Add layer with the the clusters to the map
  map.addLayer(clusteringLayer);
}

function onMarkerClick(e, map, ui) {
  var position = e.target.getPosition(),
    dataK = e.target.getData(),
    bubbleContent = getBubbleContent(dataK),
    bubble = onMarkerClick.bubble;

  // For all markers create only one bubble, if not created yet
  if (!bubble) {
    bubble = new H.ui.InfoBubble(position, {
      content: bubbleContent
    });
    ui.addBubble(bubble);
    // Cache the bubble object
    onMarkerClick.bubble = bubble;
  } else {
    // Reuse existing bubble object
    bubble.setPosition(position);
    bubble.setContent(bubbleContent);
    bubble.open();
  }

  // Move map's center to a clicked marker
  map.setCenter(position, true);
}

function getBubbleContent(data) {
  var item = data.a.data;
  return "<div class='bubble'><p>" + item.name + "</p><a href='" + item.path + "'><img style='height: 100px;' src='" + item.fullurl + "' /></a></div>";
}
