import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_app/actions.dart';
import 'package:flutter_redux_app/state.dart';
import 'package:flutter_redux_app/task_item.dart';

class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) => Scaffold(
              appBar: AppBar(
                title: Text(viewModel.pageTitle),
              ),
              body: ListView(children: viewModel.items.map((_ItemViewModel item) => _createWidget(item)).toList()),
              floatingActionButton: FloatingActionButton(
                onPressed: viewModel.onAddItem,
                backgroundColor: const Color(0xFF02BB9F),
                tooltip: viewModel.newItemToolTip,
                child: Icon(viewModel.newItemIcon),
              ),
            ),
      );

  Widget _createWidget(_ItemViewModel item) {
    if (item is _EmptyItemViewModel) {
      return _createEmptyTaskItemWidget(item);
    } else {
      return _createTaskItemWidget(item);
    }
  }


  Widget _createEmptyTaskItemWidget(_EmptyItemViewModel item) => Container(
    margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
      child: new Column(
        children: [
          TextField(

            onSubmitted: item.onCreateItem,
            autofocus: true,
            decoration: InputDecoration(
              hintText: item.createItemToolTip,
            ),
          )
        ],

      ),
  );


  Widget _createTaskItemWidget(_ToDoItemViewModel item) => Container(
    margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
    child: new Row(
      children: [
        Text(item.title),
        FlatButton(

          onPressed: item.onDeleteItem,
          child: Icon(
            item.deleteItemIcon,
            color: const Color(0xFF02BB9F),
            semanticLabel: item.deleteItemToolTip,
          ),
        )
      ],
    ),
  );


}

class _ViewModel {
  final String pageTitle;
  final List<_ItemViewModel> items;
  final Function() onAddItem;
  final String newItemToolTip;
  final IconData newItemIcon;

  _ViewModel(this.pageTitle, this.items, this.onAddItem, this.newItemToolTip, this.newItemIcon);

  factory _ViewModel.create(Store<AppState> store) {
    List<_ItemViewModel> items = store.state.task
        .map((TaskItem item) => _ToDoItemViewModel(item.title, () {
              store.dispatch(RemoveItemAction(item));
              store.dispatch(SaveListAction());
            }, 'Delete', Icons.delete) as _ItemViewModel)
        .toList();

    if (store.state.stateList == ListState.listWithNewItem) {
      items.add(_EmptyItemViewModel('Type the next task here', (String title) {
        store.dispatch(DisplayListOnlyAction());
        store.dispatch(AddItemAction(TaskItem(title)));
        store.dispatch(SaveListAction());
      }, 'Add'));
    }

    return _ViewModel('Task', items, () => store.dispatch(DisplayListWithNewItemAction()), 'Add new detail ', Icons.add);
  }
}

abstract class _ItemViewModel {}

@immutable
class _EmptyItemViewModel extends _ItemViewModel {
  final String hint;
  final Function(String) onCreateItem;
  final String createItemToolTip;

  _EmptyItemViewModel(this.hint, this.onCreateItem, this.createItemToolTip);
}

@immutable
class _ToDoItemViewModel extends _ItemViewModel {
  final String title;
  final Function() onDeleteItem;
  final String deleteItemToolTip;
  final IconData deleteItemIcon;

  _ToDoItemViewModel(this.title, this.onDeleteItem, this.deleteItemToolTip, this.deleteItemIcon);
}
