import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_drawer_tab_host/common_actions.dart';
import 'package:flutter_drawer_tab_host/home_screen.dart';
import 'package:flutter_drawer_tab_host/app_state.dart';
import 'package:flutter_drawer_tab_host/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


Future<Null> main() async {
  var store = await createStore();
  runApp(new BuyMeApp(store));
}

class BuyMeApp extends StatefulWidget {
  BuyMeApp(this.store);
  final Store<AppState> store;

  @override
  _BuyMeAppState createState() => new _BuyMeAppState();
}

class _BuyMeAppState extends State<BuyMeApp> {

  @override
  void initState() {
    super.initState();
    widget.store.dispatch(new InitAction());
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
        title: 'BuyMe',
        theme: new ThemeData(
          primaryColor:  const Color(0xFF02BB9F),
          primaryColorDark: const Color(0xFF167F67),
          accentColor: const Color(0xFFFFAD32),
        ),
        home: const HomeScreen(),
      ),
    );
  }

}
