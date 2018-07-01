import 'package:flutter/material.dart';

class DrawerHeaderBox extends StatefulWidget {
  const DrawerHeaderBox();

  @override
  _DrawerHeaderState createState() => new _DrawerHeaderState();
}

class _DrawerHeaderState extends State<DrawerHeaderBox> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return new Container(
      color: const Color(0xFF02BB9F),
      constraints: const BoxConstraints.expand(height: 175.0),
      child: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new CircleAvatar(
                    radius: 30.0,
                    backgroundColor: const Color(0xFF167F67),
                  ),

                  new Container(
                    height: 30.0,
                    width: 30.0,
                    child: new Image.asset("assets/fevicn.png"),
                  )

                ],
              ),
              new Text(
                'Developer Libs',
                style: textTheme.subhead.copyWith(color: Colors.white70),
              ),
              new Text(
                'developerlibs@gmail.com',
                style: textTheme.subhead.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
