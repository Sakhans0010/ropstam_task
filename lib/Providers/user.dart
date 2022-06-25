import 'package:flutter/cupertino.dart';
import 'package:ropstam_task/Models/user.dart';

class UserData with ChangeNotifier {
  UserModel? _userData;

  UserModel? get userData {
    return _userData;
  }

//sets the user data for further user in the app
  Future<void> setUserData(dynamic data) async {
    try {
      // a dummy data model
      UserModel _loadedUserData;

      _loadedUserData = UserModel.fromJson(data);
      _userData = _loadedUserData;
    } catch (e) {
      print('An Error Occurred while setting userData $e');
      throw Exception(e);
    }
  }
}
