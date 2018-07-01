import 'package:flutter_redux_app/task_item.dart';

class AppState {

  final List<TaskItem> task;
  final ListState stateList;

  AppState(this.task, this.stateList);

  factory AppState.initial() => AppState(List.unmodifiable([]), ListState.listOnly);

}

enum ListState {
  listOnly, listWithNewItem
}