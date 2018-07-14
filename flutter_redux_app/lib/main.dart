import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_app/middleware.dart';
import 'package:flutter_redux_app/reducers.dart';
import 'package:flutter_redux_app/state.dart';
import 'package:flutter_redux_app/task_list_page.dart';

void main() => runApp(TaskApp());

class TaskApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: this.store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor:  const Color(0xFF02BB9F),
            primaryColorDark: const Color(0xFF167F67),
            accentColor: const Color(0xFFFFAD32),
          ),
          home: TaskListPage(),
        ),
      );
}
