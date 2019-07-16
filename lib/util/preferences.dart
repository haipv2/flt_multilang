import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

const String _storageKey = 'Appli_';
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Preferences preferences = Preferences();

class Preferences {
  // generic routine to fetch a preference
  Future<String> _getAppSavedInfo(String name) async {
    final SharedPreferences prefs = await _prefs;
    var result = prefs.getString(_storageKey + name) ?? '';
    return result;
  }

  //generic routine to save
  Future<bool> _setApplicationSavedInfo(String name, String value) async {
    final SharedPreferences prefs = await _prefs;
    var result = prefs.setString(_storageKey + name, value);
    return result;
  }

  // save/restore the preferred language
  getPreferredLanguage() async {
    return _getAppSavedInfo('language');
  }

  setPreferredLanguage(String lang) async {
    return _setApplicationSavedInfo('language', lang);
  }

  //SINGLETON
  static final Preferences _preferences = Preferences._internal();

  factory Preferences() {
    return _preferences;
  }

  Preferences._internal();
}
