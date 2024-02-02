import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences _preferences =
      SharedPreferences.getInstance() as SharedPreferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static const login = 'Access Granted';
  late dynamic userData = {};

  static Future saveAccess(String val) async {
    await _preferences.setString(login, val);
  }

  static String? getSaveAccess(){
    return _preferences.getString(login);
  }

  static clearSaveAccess() {
    _preferences.remove(login);
  }

  static Future<void> saveUserData(dynamic userData) async {
    final userDataJson = jsonEncode(userData);
    await _preferences.setString('userData', userDataJson);
    }

  static dynamic getUserData() {
    final userDataJson = _preferences.getString('userData');
    if (userDataJson != null) {
      return jsonDecode(userDataJson);
    }
      return null;
  }
  static Future<void> clearUserData() async {
    await _preferences.remove('userData');
    }

}
