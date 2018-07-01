import 'package:redux/redux.dart';
import 'package:flutter_redux_app/state.dart';
import 'package:flutter_redux_app/task_item.dart';
import 'package:flutter_redux_app/actions.dart';

AppState appReducer(AppState state, action) => AppState(toDoListReducer(state.task, action), listStateReducer(state.stateList, action));

final Reducer<List<TaskItem>> toDoListReducer = combineReducers([
  TypedReducer<List<TaskItem>, AddItemAction>(_addItem),
  TypedReducer<List<TaskItem>, RemoveItemAction>(_removeItem),
]);

List<TaskItem> _removeItem(List<TaskItem> toDos, RemoveItemAction action) => List.unmodifiable(List.from(toDos)..remove(action.item));

List<TaskItem> _addItem(List<TaskItem> toDos, AddItemAction action) => List.unmodifiable(List.from(toDos)..add(action.item));

final Reducer<ListState> listStateReducer = combineReducers<ListState>([
  TypedReducer<ListState, DisplayListOnlyAction>(_displayListOnly),
  TypedReducer<ListState, DisplayListWithNewItemAction>(_displayListWithNewItem),
]);

ListState _displayListOnly(ListState listState, DisplayListOnlyAction action) => ListState.listOnly;

ListState _displayListWithNewItem(ListState listState, DisplayListWithNewItemAction action) => ListState.listWithNewItem;
