import 'package:flutter/material.dart';
import 'package:flutter_google_map/map_util.dart';
import 'package:map_view/map_view.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => new _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final teLatitude = TextEditingController();
  final teLongitude = TextEditingController();
  final teZoomLevel = TextEditingController();
  MapView mapView;
  MapUtil mapUtil;

  @override
  void initState() {
    super.initState();

    mapUtil = new MapUtil();
    mapUtil.init();
    mapView = new MapView();
    teLatitude.text = mapUtil.getCamera().center.latitude.toString();
    teLongitude.text = mapUtil.getCamera().center.longitude.toString();
    teZoomLevel.text = mapUtil.getCamera().zoom.toString();

  }

  @override
  Widget build(BuildContext context) {
    var screenWidget = new Column(
      children: <Widget>[
        new Container(
          height: 230.0,
          child: new Stack(
            children: <Widget>[
              new Center(
                child: Container(
                  child: new Text(
                    "Google Map Box",
                    textAlign: TextAlign.center,
                  ),
                  padding: const EdgeInsets.all(20.0),
                ),
              ),
              new GestureDetector(
                onTap: () => mapUtil.showMap(mapView),
                child: new Center(
                  child: new Image.network(mapUtil.getStaticMap().toString()),
                ),
              ),
            ],
          ),
        ),
        new Container(
          margin: new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          padding: new EdgeInsets.only(top: 10.0),
          child: new Text(
            "Change Lat and long for get your location map",
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getTextField("latitude", teLatitude),
              getTextField("Lontitude", teLongitude),
              getTextField("Zoom level", teZoomLevel),
              new GestureDetector(
                onTap: () => updateStaticMap(),
                child: new Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: getButton("Get Static map",
                      EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0)),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return new Scaffold(
      appBar: AppBar(
        title: new Text(
          "Flutter Google maps",
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: new SingleChildScrollView(
        child: screenWidget,
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  Widget getButton(String buttonLabel, EdgeInsets margin) {
    var staticMapBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(8.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: const Color(0xFF167F67),
        border: Border.all(color: const Color(0xFF28324E)),
        borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
      ),
      child: new Text(
        buttonLabel,
        style: new TextStyle(
          color: const Color(0xFFFFFFFF),
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
    return staticMapBtn;
  }

  updateStaticMap() {

    mapUtil.updateLocation(new Location(double.tryParse(teLatitude.text) ?? 0.0, double.tryParse(teLongitude.text) ?? 0.0));
    mapUtil.updateZoomLevel(double.tryParse(teZoomLevel.text) ?? 12.0);
    setState(() {

    });

  }
}
