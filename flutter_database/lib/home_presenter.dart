import 'package:flutter_database/database/database_hepler.dart';
import 'package:flutter_database/database/model/user.dart';

abstract class HomeContract {
  void screenUpdate();
}

class HomePresenter {

  HomeContract _view;

  var db = new DatabaseHelper();

  HomePresenter(this._view);


  delete(User user) {
    var db = new DatabaseHelper();
    db.deleteUsers(user);
    updateScreen();
  }


  updateScreen() {
    _view.screenUpdate();

  }


}
