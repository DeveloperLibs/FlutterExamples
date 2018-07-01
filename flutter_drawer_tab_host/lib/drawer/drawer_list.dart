import 'package:flutter/material.dart';
import 'package:flutter_drawer_tab_host/app_state.dart';
import 'package:flutter_drawer_tab_host/drawer/drawer_list_view_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';

class DrawerList extends StatelessWidget {

  DrawerList({
    @required this.header,
    @required this.onItemTapped,
  });

  final Widget header;
  final VoidCallback onItemTapped;

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.vertical;

    return new Transform(
      transform: new Matrix4.translationValues(0.0, -statusBarHeight, 0.0),
      child: new StoreConnector<AppState, DrawerListViewModel>(
        distinct: true,
        converter: (store) => DrawerListViewModel.fromStore(store),
        builder: (BuildContext context, DrawerListViewModel viewModel) {
          return new DrawerListContent(
            header: header,
            onTheaterTapped: onItemTapped,
            viewModel: viewModel,
          );
        },
      ),
    );
  }
}

class DrawerListContent extends StatelessWidget {

  DrawerListContent({
    @required this.header,
    @required this.onTheaterTapped,
    @required this.viewModel,
  });

  final Widget header;
  final VoidCallback onTheaterTapped;
  final DrawerListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: viewModel.drawer.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return header;
        }

        var theater = viewModel.drawer[index - 1];
        var isSelected = viewModel.currentDrawer.id == theater.id;
        var backgroundColor = isSelected
            ? const Color(0xFF01332b)
            : Theme.of(context).canvasColor;

        return new Material(
          color: backgroundColor,
          child: new Container(
            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: new Column(
              children: <Widget>[
                new ListTile(
                  onTap: () {
                    viewModel.changeCurrentDrawer(theater);
                    onTheaterTapped();
                  },
                  selected: isSelected,
                  title: new Text(
                    theater.name,
                    style: new TextStyle(
                      color: isSelected
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF01332b),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.3,
                    ),
                  ),
                )
              ],
            ),
            decoration:
                new BoxDecoration(border: new Border(bottom: new BorderSide())),
          ),
        );
      },
    );
  }
}
