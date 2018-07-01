import 'package:flutter_drawer_tab_host/app_state.dart';
import 'package:flutter_drawer_tab_host/common_actions.dart';
import 'package:flutter_drawer_tab_host/drawer/drawer_model.dart';
import 'package:flutter_drawer_tab_host/drawer/drawer_selectors.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class DrawerListViewModel {

  DrawerListViewModel({
    @required this.currentDrawer,
    @required this.drawer,
    @required this.changeCurrentDrawer,
  });

  final DrawerModel currentDrawer;
  final List<DrawerModel> drawer;
  final Function(DrawerModel) changeCurrentDrawer;

  static DrawerListViewModel fromStore(Store<AppState> store) {
    return new DrawerListViewModel(

      currentDrawer: currentDrawerSelector(store.state),
      drawer: drawerSelector(store.state),
      changeCurrentDrawer: (theater) {
        store.dispatch(new ChangeCurrentTheaterAction(theater));
      },
    );
  }

}

