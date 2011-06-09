// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var directionDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var origin = null;
var destination = null;
var waypoints = [];
var markers = [];
var directionsVisible = false;

function initialize() {
  directionsDisplay = new google.maps.DirectionsRenderer();
  var plainsboro = new google.maps.LatLng(40.331152, -74.558953);
  var myOptions = {
    zoom:11,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    center: plainsboro
    //streetViewControl: true
  }
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById("directionsPanel"));

  google.maps.event.addListener(map, 'click', function(event) {
    if (origin == null) {
      origin = event.latLng;
      addMarker(origin);
      marker.push(origin);
    } else if (destination == null) {
      destination = event.latLng;
      addMarker(destination);
      marker.push(destination);
    } else {
      if (waypoints.length < 9) {
        waypoints.push({location: destination, stopover: true});
        destination = event.latLng;
        addMarker(destination);
        marker.push(destination)
      } else {
        alert("Maximum number of waypoints reached");
      }
    }
  });
}

function addMarker(latlng) {
  markers.push(new google.maps.Marker({
    position: latlng,
    map: map,
    icon: "http://maps.google.com/mapfiles/marker" + String.fromCharCode(markers.length + 65) + ".png"
    }));
  }

function calcRoute() {
  //$('msg').update("");
  if (origin == null) {
    origin = $('origin').value;
  }

  if (destination == null) {
    destination = $('destination').value;
  }

//    var mode;
//    switch (document.getElementById("mode").value) {
//      case "bicycling":
//        mode = google.maps.DirectionsTravelMode.BICYCLING;
//        break;
//      case "driving":
//        mode = google.maps.DirectionsTravelMode.DRIVING;
//        break;
//      case "walking":
//        mode = google.maps.DirectionsTravelMode.WALKING;
//        break;
//    }

  var request = {
      origin: origin,
      destination: destination,
      waypoints: waypoints,
      travelMode: google.maps.DirectionsTravelMode.DRIVING,
      provideRouteAlternatives: true,
      //  unitSystem: google.maps.DirectionsUnitSystem.IMPERIAL,
      optimizeWaypoints: document.getElementById('optimize').checked,
      avoidHighways: document.getElementById('highways').checked,
      avoidTolls: document.getElementById('tolls').checked
    };

  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
      //alert(response.routes[0].legs[0].steps.size());
      turns = [];
      $A(response.routes[0].legs[0].steps).each(function(e){
        turns.push(e.start_location + "," + e.end_location);
      });
      $('msg').update(turns);
      //$('msg').update(response.routes[0].overview_path);
      new Ajax.Updater('msg', "/maps/get_weather",{
        method: "post",
        parameters: {text: Object.toJSON(turns)}
      })
      
    }
    else{ //if(status == google.maps.DirectionsStatus.INVALID_REQUEST){
      $('msg').update("Invalid Request");
    }
  });

clearMarkers();
directionsVisible = true;
}

function updateMode() {
  if (directionsVisible) {
    calcRoute();
  }
}

function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
}

function clearWaypoints() {
  markers = [];
  origin = null;
  destination = null;
  waypoints = [];
  directionsVisible = false;
}

function reset() {
  clearMarkers();
  clearWaypoints();
  directionsDisplay.setMap(null);
  directionsDisplay.setPanel(null);
  directionsDisplay = new google.maps.DirectionsRenderer();
  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById("directionsPanel"));
}

