import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class MapUtil {


  static var api_key = "AIzaSyDrHKl8IxB4cGXIoELXQOzzZwiH1xtsRf4";
  var staticMapProvider;
  CameraPosition cameraPosition;

  init(){
    staticMapProvider = new StaticMapProvider(MapUtil.api_key);

    cameraPosition =
    new CameraPosition(getMyLocation(), 12.0);
  }

  List<Marker> getMarker() {

    List<Marker> markers = <Marker>[
      new Marker("1", "The Lalit", 30.7269882,76.8354053,
          color: Colors.amber),
      new Marker("2", "Tech mahindra", 30.7269882,76.8354053,
          color: Colors.lightGreen),
      new Marker("3", "Infosys", 30.7269882,76.8354053,
          color: Colors.green),
    ];

    return markers;

  }

  Uri getStaticMap(){
    return staticMapProvider.getStaticUri(
        getMyLocation(), 12,
        height: 400, width: 900);
  }

  Location getMyLocation(){
    return new Location(30.7269882, 76.8354053);
  }

  CameraPosition  getCamera() {
    return cameraPosition;
  }


  showMap(MapView mapView) {

    mapView.show(new MapOptions(
        mapViewType: MapViewType.normal,

        initialCameraPosition:
        getCamera(),
        showUserLocation: true,
        title: "Recent Location"),
        toolbarActions: [new ToolbarAction("Close", 1)]
    );

    mapView.setMarkers(getMarker());
    mapView.zoomToFit(padding: 100);

    mapView.onMapReady.listen((_) {
      print("Map ready");
    });

    mapView.onLocationUpdated.listen((location) => print("Location updated $location"));

    mapView.onTouchAnnotation.listen((marker) => print("marker tapped"));

    mapView.onMapTapped
        .listen((location) => print("Touched location $location"));



  }

}
