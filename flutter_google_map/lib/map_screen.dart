import 'package:flutter/material.dart';
import 'package:flutter_google_map/map_util.dart';
import 'package:map_view/map_view.dart';

class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => new _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  MapView mapView;
  MapUtil mapUtil;




  @override
  void initState() {
    super.initState();

    mapUtil = new MapUtil();
    mapUtil.init();
    mapView = new MapView();
    mapView.onMapTapped.listen((_) {
      setState(() {
        mapView.setMarkers(mapUtil.getMarker());
        mapView.zoomToFit(padding: 100);
      });
    });

    mapView.onCameraChanged.listen((cameraPosition) =>
        this.setState(() => mapUtil.cameraPosition = cameraPosition));

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Flutter Google map",
        style: new TextStyle(
          color: const Color(0xFFFFFFFF),
        ),
        ),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: <Widget>[

          new Container(
            height: 300.0,

            child: new Stack(
              children: <Widget>[

                new Center(
                  child: Container(

                    child: new Text(
                      "Map should show here",
                      textAlign: TextAlign.center,
                    ),
                    padding: const EdgeInsets.all(20.0),
                  ),
                ),
                new InkWell(
                  child: new Center(
                    child: new Image.network(mapUtil.getStaticMap().toString()),
                  ),
                  onTap: mapUtil.showMap(mapView),
                )
              ],
            ),
          ),
          new Container(
            padding: new EdgeInsets.only(top: 10.0),
            child: new Text(
              "Tap the map to interact",
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          new Container(
            padding: new EdgeInsets.only(top: 25.0),
            child: new Text("Camera Position: \n\nLat: ${mapUtil.getCamera().center
                    .latitude}\n\nLng:${mapUtil.getCamera().center
                    .longitude}\n\nZoom: ${mapUtil.getCamera().zoom}"),
          ),
        ],
      ),
    );
  }
}
