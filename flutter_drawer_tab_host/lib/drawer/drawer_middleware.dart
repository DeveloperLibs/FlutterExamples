import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_drawer_tab_host/app_state.dart';
import 'package:flutter_drawer_tab_host/common_actions.dart';
import 'package:flutter_drawer_tab_host/drawer/drawer_model.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerMiddleware extends MiddlewareClass<AppState> {
  static const String kDefaultTheaterId = 'default_theater_id';

  final AssetBundle bundle;
  final SharedPreferences preferences;

  DrawerMiddleware(this.bundle, this.preferences);

  @override
  Future<Null> call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is InitAction) {
      await _init(action, next);
    } else if (action is ChangeCurrentTheaterAction) {
      await _changeCurrentTheater(action, next);
    } else {
      next(action);
    }
  }

  Future<Null> _init(
    InitAction action,
    NextDispatcher next,
  ) async {
    List<DrawerModel> allTheaters = new List();

    DrawerModel theater = new DrawerModel(id: "1030", name: "Electronics");
    DrawerModel theater1 = new DrawerModel(id: "1014", name: "Fashion");
    DrawerModel theater2 = new DrawerModel(id: "1012", name: "Furniture");
    DrawerModel theater3 = new DrawerModel(id: "1039", name: "Sports");
    DrawerModel theater4 = new DrawerModel(id: "1038", name: "Books");
    DrawerModel theater5 = new DrawerModel(id: "1031", name: "Medical");
    DrawerModel theater6 = new DrawerModel(id: "1011", name: "Vegetable");
    DrawerModel theater7 = new DrawerModel(id: "1015", name: "Drink");
    DrawerModel theater8 = new DrawerModel(id: "1016", name: "Watch");

    allTheaters.add(theater);
    allTheaters.add(theater1);
    allTheaters.add(theater2);
    allTheaters.add(theater3);
    allTheaters.add(theater4);
    allTheaters.add(theater5);
    allTheaters.add(theater6);
    allTheaters.add(theater7);
    allTheaters.add(theater8);

    next(new InitCompleteAction(allTheaters, allTheaters.first));
  }

  Future<Null> _changeCurrentTheater(
    ChangeCurrentTheaterAction action,
    NextDispatcher next,
  ) async {
    preferences.setString(kDefaultTheaterId, action.selectedDrawer.id);
    next(action);
  }
}
