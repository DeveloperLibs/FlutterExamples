import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class MapUtil {
  static var api_key = "Google_map_key";
  var staticMapProvider;
  CameraPosition cameraPosition;
  var location = new Location(30.7269882, 76.8354053);
  var zoomLevel = 12.0;

  init() {
    staticMapProvider = new StaticMapProvider(MapUtil.api_key);
    cameraPosition = new CameraPosition(getMyLocation(), zoomLevel);
  }

  List<Marker> getMarker() {
    List<Marker> markers = <Marker>[
      new Marker("1", "The Lalit", 30.7265995, 76.8361955, color: Colors.amber),
      new Marker("2", "Tech mahindra", 30.7290226, 76.8339204,
          color: Colors.red),
      new Marker("3", "Infosys", 30.7285108, 76.8388771, color: Colors.green),
    ];

    return markers;
  }

  Uri getStaticMap() {
    return staticMapProvider.getStaticUri(getMyLocation(), zoomLevel.toInt(),
        height: 400, width: 900);
  }

  Location getMyLocation() {
    return location;
  }

  CameraPosition getCamera() {
    return cameraPosition;
  }

  showMap(MapView mapView) {
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            initialCameraPosition: getCamera(),
            showUserLocation: true,
            title: "Recent Location"),
        toolbarActions: [new ToolbarAction("Close", 1


        )]

    );


    mapView.zoomToFit(padding: 100);

    mapView.onMapReady.listen((_) {
      mapView.setMarkers(getMarker());
      print("Map ready");
    });

    mapView.onLocationUpdated.listen((location) => updateLocation(location));

    mapView.onTouchAnnotation.listen((marker) => print("marker tapped"));

    mapView.onMapTapped.listen((location) => updateLocation(location));
  }

  updateLocation(Location location) {
    this.location = location;
    print("location changed $location");
  }
  updateZoomLevel(double zoomLevel) {
    this.zoomLevel = zoomLevel;
  }
}
