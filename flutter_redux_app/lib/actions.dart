import 'package:flutter_redux_app/task_item.dart';

class RemoveItemAction {
  final TaskItem item;

  RemoveItemAction(this.item);
}

class AddItemAction {
  final TaskItem item;

  AddItemAction(this.item);
}

class DisplayListOnlyAction {}

class DisplayListWithNewItemAction {}

class SaveListAction {}
