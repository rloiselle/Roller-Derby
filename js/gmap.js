
function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(39.50, -98.35),
    zoom: 4,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);