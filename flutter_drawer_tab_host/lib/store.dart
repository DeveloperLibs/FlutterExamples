import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_drawer_tab_host/app_reducer.dart';
import 'package:flutter_drawer_tab_host/app_state.dart';
import 'package:flutter_drawer_tab_host/drawer/drawer_middleware.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Store<AppState>> createStore() async {

  var prefs = await SharedPreferences.getInstance();

  return new Store(
    appReducer,
    initialState: new AppState.initial(),
    middleware: [
      new DrawerMiddleware(rootBundle, prefs),
    ],
  );

}
