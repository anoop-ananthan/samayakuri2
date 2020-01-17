import 'package:mobx/mobx.dart';

import 'package:samayakuri2/models/user.dart';
import 'package:samayakuri2/services/user.dart';

part 'store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  final UserService _service = UserService();

  @observable
  List<User> users;

  @observable
  User currentUser;

  @observable
  User profileUser;

  @observable
  int selectedTabIndex = 0;

  @action
  getUsers({date}) async {
    users = await _service.fetchUsers(date: date);
  }
}
