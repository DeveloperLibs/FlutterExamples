import 'package:flutter/material.dart';
import 'package:flutter_google_map/map_screen.dart';
import 'package:flutter_google_map/map_util.dart';
import 'package:map_view/map_view.dart';



void main() {

  MapView.setApiKey(MapUtil.api_key);
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor:  const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
      accentColor: const Color(0xFFFFAD32),
    ),
    home: new MapScreen(),
  ));

}


