import 'package:samayakuri2/models/user.dart';

class Settings {
  User currentUser;

  User _profileUser;
  User get profileUser => _profileUser;
  set profileUser(User value) {
    _profileUser = value;
    print('> profile user property set ${_profileUser.username}');
  }
}
