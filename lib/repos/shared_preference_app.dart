import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
SharedPreferencesUtil preferencesUtil = SharedPreferencesUtil();

class SharedPreferencesUtil {
// generic routine to fetch a preference
  Future<String> getAppSavedInfo(String name) async {
    final SharedPreferences prefs = await _prefs;
    var result = prefs.getString(name) ?? '';
    return result;
  }

  //generic routine to save
  Future<bool> setApplicationSavedInfo(String name, String value) async {
    final SharedPreferences prefs = await _prefs;
    var result = prefs.setString(name, value);
    return result;
  }
}
