

import 'package:flutter_drawer_tab_host/app_state.dart';
import 'package:flutter_drawer_tab_host/drawer/drawer_model.dart';

DrawerModel currentDrawerSelector(AppState state) => state.drawerState.currentTheater;

List<DrawerModel> drawerSelector(AppState state) => state.drawerState.theaters;
