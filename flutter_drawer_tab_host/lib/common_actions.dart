import 'package:flutter_drawer_tab_host/drawer/drawer_model.dart';


class InitAction {}

class InitCompleteAction {
  InitCompleteAction(
    this.drawer,
    this.selectedDrawer,
  );

  final List<DrawerModel> drawer;
  final DrawerModel selectedDrawer;
}

class ChangeCurrentTheaterAction {
  ChangeCurrentTheaterAction(this.selectedDrawer);
  final DrawerModel selectedDrawer;
}

