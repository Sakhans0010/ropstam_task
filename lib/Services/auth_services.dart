import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices with ChangeNotifier {
  String? _accessToken;

  int? _userId;
  String? _userRole;

  static const baseUrl = 'http://buddy.ropstambpo.com/api/login';
  static const deviceToken = 'zasdcvgtghnkiuhgfde345tewasdfghjkm';

  bool get isAuth {
    return _accessToken != null;
  }

// method for signing in the user
  Future<dynamic> signIn({String? email, String? password}) async {
    try {
      final url =
          '$baseUrl?email=$email&password=$password&device_token=$deviceToken';
      var response = await http.post(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final extratedData = json.decode(response.body);

        _accessToken = extratedData['data']['access_token'];
        _userId = extratedData['data']['user']['id'];
        _userRole = extratedData['data']['user']['role'];

//making a user session with shared preferences
        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'access_token': _accessToken,
          'userId': _userId,
          'userRole': _userRole,
          'isLoggedIn': true,
        });
        prefs.setString('userData', userData);

        notifyListeners();
        return extratedData['data']['user'];
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

// for auto login this method first checks if there is a token and the user session data in preferences then
// returns true if it has the user session and falseif there is no user session.
  Future<bool> tryAutoLogIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      print('prefs has no data');
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')!) as Map<String, Object?>;

    _accessToken = extractedUserData['token'].toString();
    _userId = int.parse(extractedUserData['userId'].toString());
    _userRole = extractedUserData['userRole'].toString();
    print('object');
    notifyListeners();

    return true;
  }

//method fo loggin the user out and clearing the preferences data or killing the user session.
  Future<void> logOut() async {
    _accessToken = null;
    _userId = null;
    _userRole = null;

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
