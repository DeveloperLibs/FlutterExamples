import 'package:flutter_drawer_tab_host/app_state.dart';
import 'package:flutter_drawer_tab_host/drawer/drawer_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    drawerState: drawerReducer(state.drawerState, action),
  );
}
