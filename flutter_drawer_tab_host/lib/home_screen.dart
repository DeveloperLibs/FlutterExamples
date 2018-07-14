import 'package:flutter/material.dart';
import 'package:flutter_drawer_tab_host/tab_screen.dart';
import 'package:flutter_drawer_tab_host/drawer/drawer_header.dart';
import 'package:flutter_drawer_tab_host/drawer/drawer_list.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen();
  @override
  _HomeScreenState createState() => new _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: const Color(0xFFFFFFFF),),
        title: new Text("BuyMe",
          style: new TextStyle(
            color:
            const Color(0xFFFFFFFF),
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3,
          ),
        ),
        bottom: new TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Color(0xFFFFFFFF),
          tabs: const <Tab>[
            const Tab(text: 'Trending'),
            const Tab(text: 'Men'),
            const Tab(text: 'Women'),
          ],
        ),
      ),
      drawer: new Drawer(
        child: new DrawerList(
          header: const DrawerHeaderBox(),
          onItemTapped: () => Navigator.pop(context),
        ),
      ),
      body: new TabBarView(
        controller: _controller,
        children: <Widget>[
          new TabScreen("Trending"),
          new TabScreen("Men"),
          new TabScreen("Women"),
        ],
      ),
    );

  }
}
